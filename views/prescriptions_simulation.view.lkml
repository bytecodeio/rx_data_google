include: "/views/prescriptions.view.lkml"

view: prescriptions_simulation {
# This simulation is inteded for use in the prescriptions explore joined with ncds, county_dt, & spi_roots
  extends: [prescriptions]

  # Days Supply simulation using the actual therapeutic classes
  dimension: days_supply {
    type: number
    sql:
    CASE
      -- Maintenance Classes (Long Days Supply): Cardiac, Antihypertensives, Diabetes, Lipids, Thyroid
      WHEN ${ndcs.therapeutic} IN (
        'CARDIAC THERAPY',
        'ANTIHYPERTENSIVES',
        'DRUGS USED IN DIABETES',
        'AGENTS ACTING ON THE RENIN-ANGIOTENSIN SYSTEM',
        'BETA BLOCKING AGENTS',
        'DIURETICS',
        'CALCIUM CHANNEL BLOCKERS',
        'LIPID MODIFYING AGENTS',
        'THYROID THERAPY'
      )
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 10) < 7 THEN 90 ELSE 30 END
      -- Acute Classes (Short Days Supply): Antibacterials, Analgesics, Cough/Cold, Antivirals
      WHEN ${ndcs.therapeutic} IN (
        'ANTIBACTERIALS FOR SYSTEMIC USE',
        'ANALGESICS',
        'COUGH AND COLD PREPARATIONS',
        'ANTIVIRALS FOR SYSTEMIC USE',
        'ANTIPROTOZOALS'
      )
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 10) < 5 THEN 7
                  WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 10) < 8 THEN 5
                  ELSE 10 END
      -- Default Baseline for other classes
       ELSE CASE WHEN MOD(ABS(FARM_FINGERPRINT(${primary_key})), 10) < 7 THEN 30 ELSE 15 END
    END ;;
  }

  # RTPB Adoption (RTPB) simulation based on Prescriber Deciles & Census Income
  dimension: rtpb {
    description: "Simulated RTPB check flag (1 = Check Run, 0 = No Check Run)"
    type: number
    sql:
    CASE
      -- High-decile prescribers in High-Income counties (85% adoption)
      WHEN ${spi_roots.decile_routing} IN ('08', '09', '10')
           AND ${county_census_dt.income_tier} = '150k+'
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 100) < 85 THEN 1 ELSE 0 END
      -- Low-decile or Low-Income counties (rural/financial barriers - 25% adoption)
      WHEN ${spi_roots.decile_routing} IN ('01', '02', '03')
           OR ${county_census_dt.income_tier} = 'Under 35K'
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 100) < 25 THEN 1 ELSE 0 END
      -- Default general adoption rate (55%)
      ELSE CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 100) < 55 THEN 1 ELSE 0 END
    END ;;
  }

  # New Rx flag simulation based on ATC Therapeutic Classes
  dimension: new_rx {
    description: "New prescription flag (1 = New Start, 0 = Refill/Renewal)"
    type: number
    sql:
    CASE
      -- Acute classes are 90% new starts
      WHEN ${ndcs.therapeutic} IN (
        'ANTIBACTERIALS FOR SYSTEMIC USE',
        'ANALGESICS',
        'COUGH AND COLD PREPARATIONS',
        'ANTIVIRALS FOR SYSTEMIC USE'
      )
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 10) < 9 THEN 1 ELSE 0 END
      -- Maintenance classes are 15% new starts (85% refills)
      WHEN ${ndcs.therapeutic} IN (
        'CARDIAC THERAPY',
        'ANTIHYPERTENSIVES',
        'DRUGS USED IN DIABETES',
        'LIPID MODIFYING AGENTS',
        'THYROID THERAPY'
      )
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 10) < 2 THEN 1 ELSE 0 END
      -- Baseline (30%)
      ELSE CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${primary_key} AS STRING))), 10) < 3 THEN 1 ELSE 0 END
    END ;;
  }

  measure: avg_days_supply {
    hidden: no
    label: "Average Days of Supply"
    description: "The average days of medication supply filled per prescription"
    synonyms: ["mean days supply", "average fill length"]
    type: average
    sql: ${days_supply} ;;
    value_format_name: decimal_2
  }
  measure: number_of_prescriptions {
    hidden: no
    label: "Number of Prescriptions"
    description: "The total volume count of filled prescriptions"
    synonyms: ["total rx count", "transaction count", "prescription volume"]
    # type: count_distinct
    # sql: ${primary_key} ;;
    type: sum
    sql:
      CASE
        -- Winter respiratory surge (Jan thru Mar) +25%
        WHEN EXTRACT(MONTH FROM ${rx_raw}) IN (1, 2, 3) THEN 1.25
        -- Summer lulls (Jun thru Aug) -15%
        WHEN EXTRACT(MONTH FROM ${rx_raw}) IN (6, 7, 8) THEN 0.85
        ELSE 1.0
      END ;;
  }
  measure: rtpb_adoption_rate {
    label: "RTPB Adoption Rate"
    description: "The percentage of prescription transactions where a Real-Time Prescription Benefit check was performed"
    type: number
    sql: SAFE_DIVIDE( sum(${rtpb}), ${number_of_prescriptions}) ;;
    value_format_name: percent_1
  }
  measure: number_of_new_prescriptions {
    hidden: no
    label: "Number of New Prescriptions"
    description: "The total count of new prescriptions (Sum of new prescriptions sold)"
    synonyms: ["total new rx", "new start count"]
    type: sum
    sql: ${new_rx} ;;
    drill_fields: [detail*]
  }
  measure: new_rx_ratio {
    label: "New Prescription Rate"
    description: "The percentage of total filled prescriptions that are new starts"
    type: number
    sql: SAFE_DIVIDE(${number_of_new_prescriptions}, ${number_of_prescriptions}) ;;
    value_format_name: percent_2
  }
  measure: number_of_new_prescriptions_in_first_period {
    hidden: no
    label: "Number of New Prescriptions in First Period"
    group_label: "Arbitrary Period Comparison"
    description: "The count of new prescriptions in the first comparison period selected"
    synonyms: ["new rx first period"]
    type: sum
    sql: ${new_rx} ;;
    filters: [is_first_period: "Yes"]
    drill_fields: [detail*]
  }
  measure: number_of_new_prescriptions_in_second_period {
    hidden: no
    label: "Number of New Prescriptions in Second Period"
    group_label: "Arbitrary Period Comparison"
    description: "The count of new prescriptions in the second comparison period selected"
    synonyms: ["new rx second period"]
    type: sum
    sql: ${new_rx} ;;
    filters: [is_second_period: "Yes"]
    drill_fields: [detail*]
  }
  measure: avg_days_supply_in_first_period {
    hidden: no
    label: "Average Days of Supply in First Period"
    group_label: "Arbitrary Period Comparison"
    description: "The average days of supply for the first comparison period selected"
    synonyms: ["mean days supply first period"]
    type: average
    sql: ${days_supply} ;;
    filters: [is_first_period: "Yes"]
    value_format_name: decimal_2
  }
  measure: avg_days_supply_in_second_period {
    hidden: no
    label: "Average Days of Supply in Second Period"
    group_label: "Arbitrary Period Comparison"
    description: "The average days of supply for the second comparison period selected"
    synonyms: ["mean days supply second period"]
    type: average
    sql: ${days_supply} ;;
    filters: [is_second_period: "Yes"]
    value_format_name: decimal_2
  }
  measure: number_of_new_prescriptions_last_month {
    hidden: no
    label: "Number of New Prescriptions Last Month"
    group_label: "Previous Period Comparison"
    description: "The total number of new prescriptions prescribed last month. Use with the Prescription Date, or Month."
    synonyms: ["new rx prior month"]
    type: period_over_period
    kind: previous
    based_on: number_of_new_prescriptions
    based_on_time: rx_month
    period: month
    value_format_name: "decimal_0"
    drill_fields: [detail*]
  }
  measure: number_of_new_prescriptions_last_year {
    hidden: no
    label: "Number of New Prescriptions Last Year"
    group_label: "Previous Period Comparison"
    description: "The total number of new prescriptions prescribed last year. Use with the Prescription Date, Month, Quarter or Year."
    synonyms: ["new rx prior year"]
    type: period_over_period
    kind: previous
    based_on: number_of_new_prescriptions
    based_on_time: rx_year
    period: year
    value_format_name: "decimal_0"
    drill_fields: [detail*]
  }
  measure: new_prescriptions_change_from_last_year {
    hidden: no
    label: "New Prescriptions Change from Last Year"
    group_label: "Previous Period Comparison"
    description: "The change in the number of new prescriptions prescribed this year versus last year."
    synonyms: ["new rx year over year change"]
    type: period_over_period
    kind: difference
    based_on: number_of_new_prescriptions
    based_on_time: rx_year
    period: year
    value_format_name: "decimal_0"
    drill_fields: [detail*]
  }
  measure: new_prescriptions_percent_change_from_last_year {
    hidden: no
    label: "New Prescriptions Percent Change from Last Year"
    group_label: "Previous Period Comparison"
    description: "The percentage change in the number of new prescriptions prescribed this year versus last year"
    synonyms: ["new rx yoy percent change"]
    type: period_over_period
    kind: relative_change
    based_on: number_of_new_prescriptions
    based_on_time: rx_year
    period: year
    value_format_name: "percent_1"
    drill_fields: [detail*]
  }
}
