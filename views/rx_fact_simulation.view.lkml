include: "/views/rx_fact.view.lkml"
include: "/views/ndcs.view.lkml"
include: "/views/dates.view.lkml"
include: "/views/county_census_dt.view.lkml"

view: rx_fact_simulation {
# This extended view allows/aims to make the 'dummy' data look more realistic.
  extends: [rx_fact]

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
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 10) < 7 THEN 90 ELSE 30 END
      -- Acute Classes (Short Days Supply): Antibacterials, Analgesics, Cough/Cold, Antivirals
      WHEN ${ndcs.therapeutic} IN (
        'ANTIBACTERIALS FOR SYSTEMIC USE',
        'ANALGESICS',
        'COUGH AND COLD PREPARATIONS',
        'ANTIVIRALS FOR SYSTEMIC USE',
        'ANTIPROTOZOALS'
      )
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 10) < 5 THEN 7
                  WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 10) < 8 THEN 5
                  ELSE 10 END
      -- Default Baseline for other classes
      ELSE ${TABLE}.days_supply
    END ;;
  }

  # RTPB Adoption (RTPB) simulation based on Prescriber Deciles & Census Income
  dimension: rtpb {
    type: number
    sql:
    CASE
      -- High-decile prescribers in High-Income counties (85% adoption)
      WHEN ${spi_roots.decile_routing} IN ('08', '09', '10')
           AND ${county_census_dt.income_tier} = '150k+'
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 100) < 85 THEN 1 ELSE 0 END
      -- Low-decile or Low-Income counties (rural/financial barriers - 25% adoption)
      WHEN ${spi_roots.decile_routing} IN ('01', '02', '03')
           OR ${county_census_dt.income_tier} = 'Under 35K'
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 100) < 25 THEN 1 ELSE 0 END
      -- Default general adoption rate (55%)
      ELSE CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 100) < 55 THEN 1 ELSE 0 END
    END ;;
  }

  # New Rx flag simulation based on ATC Therapeutic Classes
  dimension: new_rx {
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
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 10) < 9 THEN 1 ELSE 0 END
      -- Maintenance classes are 15% new starts (85% refills)
      WHEN ${ndcs.therapeutic} IN (
        'CARDIAC THERAPY',
        'ANTIHYPERTENSIVES',
        'DRUGS USED IN DIABETES',
        'LIPID MODIFYING AGENTS',
        'THYROID THERAPY'
      )
        THEN CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 10) < 2 THEN 1 ELSE 0 END
      -- Baseline (30%)
      ELSE CASE WHEN MOD(ABS(FARM_FINGERPRINT(CAST(${pk} AS STRING))), 10) < 3 THEN 1 ELSE 0 END
    END ;;
  }

   # Seasonal Volume count measure referencing the dates.date_date column
  measure: count {
    label: "Prescription Transaction Count"
    description: "The total number of prescription transactions filled"
    synonyms: ["total rx count", "transaction count"]
    type: sum
    sql:
    CASE
      -- Winter respiratory surge (Jan thru Mar) +25%
      WHEN EXTRACT(MONTH FROM ${dates.date_date}) IN (1, 2, 3) THEN 1.25
      -- Summer lulls (Jun thru Aug) -15%
      WHEN EXTRACT(MONTH FROM ${dates.date_date}) IN (6, 7, 8) THEN 0.85
      ELSE 1.0
    END ;;
    drill_fields: [pk]
  }
  measure: average_days_supply {
    label: "Average Days Supply"
    description: "The average days of medication supply filled per transaction"
    type: average
    sql: ${days_supply} ;;
    value_format_name: decimal_2
  }
  measure: number_of_new_prescriptions {
    label: "Number of New Prescriptions"
    description: "The total number of new prescriptions (Sum of new prescriptions sold)"
    synonyms: ["total new rx"]
    type: sum
    sql: ${new_rx} ;;
  }
  measure: new_rx_ratio {
    label: "New Prescription Rate"
    description: "The percentage of total filled prescriptions that are new starts"
    synonyms: ["new rx percentage"]
    type: number
    sql: SAFE_DIVIDE(${number_of_new_prescriptions}, ${count}) ;;
    value_format_name: percent_2
  }
  measure: rtpb_adoption {
    type: sum
    sql: ${rtpb} ;;
    hidden: yes
  }
  measure: rtpb_adoption_rate {
    label: "RTPB Adoption Rate"
    description: "The percentage of prescription transactions where a Real-Time Prescription Benefit check was performed"
    synonyms: ["rtpb utilization"]
    type: number
    sql: SAFE_DIVIDE(${rtpb_adoption},${count}) ;;
    value_format_name: percent_1
  }

}
