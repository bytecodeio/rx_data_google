view: prescriptions {
  sql_table_name: `Rx_Data.rx_denorm_fact_1` ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    label: "Primary Key"
    description: "Compound primary key identifying a unique prescription record"
    synonyms: ["pk", "prescription_key"]
    type: string
    sql: CONCAT(${account_name},${age_group},${rx_date},${ndc},${ncpdpid},${spi_root},${patient_zip}) ;;
  }
  parameter: pick_field_to_count {
    label: "Pick Field to Count"
    description: "Parameter that allows you to dynamically select Diseases, Brands, Vendors or Therapeutics to count"
    type: unquoted
    default_value: "Vendors"
    allowed_value: {
      label: "Diseases"
      value: "disease"
    }
    allowed_value: {
      label: "Brands"
      value: "brand_name"
    }
    allowed_value: {
      label: "Vendors"
      value: "vendor_name"
    }
    allowed_value: {
      label: "Therapeutics"
      value: "therapeutic"
    }
  }
  dimension: account_name {
    label: "Account Name"
    description: "The name of the account organization associated with the prescription"
    synonyms: ["company", "customer", "account"]
    type: string
    sql: ${TABLE}.account_name ;;
  }
  dimension: age_group {
    label: "Age Group"
    description: "The age range group bracket of the patient"
    synonyms: ["age_bracket", "age_cohort", "cohort"]
    type: string
    sql: ${TABLE}.age_group ;;
  }
  dimension: brand_name {
    label: "Brand Name"
    description: "The brand/proprietary name of the prescribed medication"
    synonyms: ["trade_name", "product_name"]
    type: string
    sql: ${TABLE}.Brand_Name ;;
  }
  dimension: days_supply {
    label: "Days Supply"
    description: "The number of days of medication supplied"
    synonyms: ["fill_length", "supply_duration"]
    type: number
    sql: ${TABLE}.days_supply ;;
  }
  dimension: disease {
    label: "Disease Target"
    description: "The condition or disease target for the prescription"
    synonyms: ["indication", "condition", "illness"]
    type: string
    sql: ${TABLE}.Disease ;;
  }
  dimension: dispenser_class {
    label: "Dispenser Class"
    description: "The general class of dispenser (e.g. Retail, Mail Order, Specialty)"
    synonyms: ["pharmacy_class"]
    type: string
    sql: ${TABLE}.Dispenser_Class ;;
  }
  dimension: dispenser_type {
    label: "Dispenser Type"
    description: "The detailed dispenser sub-type description"
    synonyms: ["pharmacy_type"]
    type: string
    sql: ${TABLE}.Dispenser_Type ;;
  }
  dimension: generic_name {
    label: "Generic Name"
    description: "The established short generic name of the active drug ingredient"
    synonyms: ["generic_drug", "active_ingredient"]
    type: string
    sql: ${TABLE}.Generic_Name ;;
  }
  dimension: label_name {
    label: "Label Name"
    description: "The printed product label name of the drug package"
    synonyms: ["package_label"]
    type: string
    sql: ${TABLE}.Label_Name ;;
  }
  dimension: ncpdpid {
    label: "Pharmacy ID"
    description: "The National Council for Prescription Drug Programs pharmacy identifier"
    synonyms: ["pharmacy_npi", "store_id", "ncpdp"]
    type: string
    sql: ${TABLE}.NCPDPID ;;
  }
  dimension: ndc {
    label: "NDC Code"
    description: "National Drug Code standard identifier"
    synonyms: ["drug_code", "medication_id"]
    type: number
    sql: ${TABLE}.NDC ;;
  }
  dimension: new_rx {
    label: "New Prescriptions Flag"
    description: "Indicator of whether the prescription is a new fill"
    synonyms: ["first_fill", "new_start"]
    type: number
    sql: ${TABLE}.new_rx ;;
  }
  dimension: patient_city {
    group_label: "Patient Location"
    label: "Patient City"
    description: "The city where the patient resides"
    synonyms: ["patient_city"]
    type: string
    sql: ${TABLE}.patient_city ;;
  }
  dimension: patient_county {
    group_label: "Patient Location"
    label: "Patient County"
    description: "The county where the patient resides"
    synonyms: ["patient_county"]
    type: string
    sql: ${TABLE}.patient_county ;;
  }
  dimension: patient_state {
    group_label: "Patient Location"
    label: "Patient State"
    description: "The US state where the patient resides"
    synonyms: ["patient_state"]
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.patient_state ;;
  }
  dimension: patient_zip {
    group_label: "Patient Location"
    label: "Patient ZIP"
    description: "The postal ZIP code where the patient resides"
    synonyms: ["patient_zip", "patient_postal_code"]
    type: zipcode
    sql: ${TABLE}.patient_zip ;;
  }
  dimension: pharmacy_city {
    hidden: no
    group_label: "Pharmacy Location"
    label: "Pharmacy City"
    description: "The city where the pharmacy is located"
    synonyms: ["pharmacy city"]
    type: string
    sql: ${TABLE}.pharmacy_city ;;
  }
  dimension: pharmacy_state {
    hidden: no
    group_label: "Pharmacy Location"
    label: "Pharmacy State"
    description: "The US state where the pharmacy is located"
    synonyms: ["pharmacy state"]
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.pharmacy_state ;;
  }
  dimension: pharmacy_zip {
    group_label: "Pharmacy Location"
    label: "Pharmacy ZIP"
    description: "The postal ZIP code for the pharmacy"
    synonyms: ["pharmacy zip", "pharmacy postal code"]
    type: zipcode
    sql: ${TABLE}.pharmacy_zip ;;
  }
  dimension: prescriber_type {
    label: "Prescriber Type"
    description: "The category/credential type of the prescriber (e.g. MD, NP, PA)"
    synonyms: ["provider type", "doctor type"]
    type: string
    sql: ${TABLE}.prescriber_type ;;
  }
  dimension: primary_care {
    label: "Is Primary Care Provider"
    description: "Indicates if the prescriber is a primary care physician (Yes/No)"
    synonyms: ["pcp", "primary care flag"]
    type: yesno
    sql: ${TABLE}.primary_care ;;
  }
  dimension: rollup_name {
    label: "Rollup Name"
    description: "The parent or rollup group name for the account"
    synonyms: ["parent account", "rollup group"]
    type: string
    sql: ${TABLE}.rollup_name ;;
  }
  dimension: rtpb {
    label: "RTPB Check Flag"
    description: "Indicates whether a Real-Time Prescription Benefit check was run (values > 0)"
    synonyms: ["real time benefit", "benefit check"]
    type: number
    sql: ${TABLE}.rtpb ;;
  }
  dimension_group: rx {
    label: "Prescription"
    description: "The date and time the prescription transaction occurred"
    synonyms: ["fulfillment date", "rx date"]
    type: time
    timeframes: [raw, date, time, week, week_of_year, month, month_name, quarter, quarter_of_year, year]
    convert_tz: no
    datatype: date
    sql: TIMESTAMP_ADD(${TABLE}.rx_date, INTERVAL DATE_DIFF(CURRENT_DATE(), DATE('2023-12-30'),DAY) DAY) ;;
  }
  dimension: specialty {
    label: "Prescriber Specialty"
    description: "The primary medical specialty of the prescribing doctor"
    synonyms: ["doctor specialty", "medical specialty"]
    type: string
    sql: ${TABLE}.Specialty ;;
    drill_fields: [spi_root]
  }
  dimension: spi_city {
    group_label: "Prescriber Location"
    label: "Prescriber City"
    description: "The city where the prescriber's clinic is located"
    synonyms: ["provider city", "doctor city"]
    type: string
    sql: ${TABLE}.spi_city ;;
  }
  dimension: spi_county {
    group_label: "Prescriber Location"
    label: "Prescriber Country"
    description: "The county or country where the prescriber is located"
    synonyms: ["provider county", "doctor county"]
    type: string
    sql: ${TABLE}.spi_county ;;
  }
  dimension: spi_root {
    label: "Prescriber ID"
    description: "The unique ID (SPI root) of the prescribing provider"
    synonyms: ["provider npi", "npi", "spi root"]
    type: string
    sql: ${TABLE}.SPI_Root ;;
  }
  dimension: spi_state {
    group_label: "Prescriber Location"
    label: "Prescriber State"
    description: "The US state where the prescriber is licensed/located"
    synonyms: ["provider state", "doctor state"]
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.spi_state ;;
  }
  dimension: spi_zip {
    group_label: "Prescriber Location"
    label: "Prescriber ZIP"
    description: "The postal ZIP code for the prescriber's clinic location"
    synonyms: ["provider zip", "doctor zip"]
    type: zipcode
    sql: ${TABLE}.spi_zip ;;
  }
  dimension: therapeutic {
    label: "Therapeutic Class"
    description: "The therapeutic category class of the drug (e.g. cardiovascular, vitamins)"
    synonyms: ["drug class", "pharmacological class"]
    type: string
    sql: ${TABLE}.Therapeutic ;;
  }
  dimension: vendor_common_name {
    label: "Vendor Common Name"
    description: "The common name used for the vendor manufacturer"
    synonyms: ["manufacturer common name"]
    type: string
    sql: ${TABLE}.vendor_common_name ;;
  }
  dimension: vendor_name {
    label: "Vendor Name"
    description: "The full legal name of the vendor manufacturer"
    synonyms: ["manufacturer name"]
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  # measure: avg_days_supply {
  #   hidden: no
  #   label: "Average Days of Supply"
  #   description: "The average days of medication supply filled per prescription"
  #   synonyms: ["mean days supply", "average fill length"]
  #   type: average
  #   sql: ${days_supply} ;;
  #   value_format_name: decimal_2
  # }
  measure: dynamic_counter {
    hidden: no
    label_from_parameter: pick_field_to_count
    description: "Use this with the Pick Field to Count parameter to return a count of the selected field"
    synonyms: ["dynamic count"]
    type: count_distinct
    sql: {% parameter pick_field_to_count %} ;;
  }
  measure: number_of_pharmacies {
    hidden: no
    label: "Number of Pharmacies"
    description: "The total number of pharmacies (Distinct count of NCPDPIDs)"
    synonyms: ["total pharmacies", "pharmacy count"]
    type: count_distinct
    sql: ${ncpdpid} ;;
    value_format_name: decimal_2
  }
  # measure: number_of_new_prescriptions {
  #   hidden: no
  #   label: "Number of New Prescriptions"
  #   description: "The total count of new prescriptions (Sum of new prescriptions sold)"
  #   synonyms: ["total new rx", "new start count"]
  #   type: sum
  #   sql: ${new_rx} ;;
  #   drill_fields: [detail*]
  # }
  # measure: new_rx_ratio {
  #   label: "New Prescription Rate"
  #   description: "The percentage of total filled prescriptions that are new starts"
  #   type: number
  #   sql: SAFE_DIVIDE(${number_of_new_prescriptions}, ${number_of_prescriptions}) ;;
  #   value_format_name: percent_2
  # }
  # measure: number_of_new_prescriptions_last_month {
  #   hidden: no
  #   label: "Number of New Prescriptions Last Month"
  #   group_label: "Previous Period Comparison"
  #   description: "The total number of new prescriptions prescribed last month. Use with the Prescription Date, or Month."
  #   synonyms: ["new rx prior month"]
  #   type: period_over_period
  #   kind: previous
  #   based_on: number_of_new_prescriptions
  #   based_on_time: rx_month
  #   period: month
  #   value_format_name: "decimal_0"
  #   drill_fields: [detail*]
  # }
  # measure: number_of_new_prescriptions_last_year {
  #   hidden: no
  #   label: "Number of New Prescriptions Last Year"
  #   group_label: "Previous Period Comparison"
  #   description: "The total number of new prescriptions prescribed last year. Use with the Prescription Date, Month, Quarter or Year."
  #   synonyms: ["new rx prior year"]
  #   type: period_over_period
  #   kind: previous
  #   based_on: number_of_new_prescriptions
  #   based_on_time: rx_year
  #   period: year
  #   value_format_name: "decimal_0"
  #   drill_fields: [detail*]
  # }
  # measure: new_prescriptions_change_from_last_year {
  #   hidden: no
  #   label: "New Prescriptions Change from Last Year"
  #   group_label: "Previous Period Comparison"
  #   description: "The change in the number of new prescriptions prescribed this year versus last year."
  #   synonyms: ["new rx year over year change"]
  #   type: period_over_period
  #   kind: difference
  #   based_on: number_of_new_prescriptions
  #   based_on_time: rx_year
  #   period: year
  #   value_format_name: "decimal_0"
  #   drill_fields: [detail*]
  # }
  # measure: new_prescriptions_percent_change_from_last_year {
  #   hidden: no
  #   label: "New Prescriptions Percent Change from Last Year"
  #   group_label: "Previous Period Comparison"
  #   description: "The percentage change in the number of new prescriptions prescribed this year versus last year"
  #   synonyms: ["new rx yoy percent change"]
  #   type: period_over_period
  #   kind: relative_change
  #   based_on: number_of_new_prescriptions
  #   based_on_time: rx_year
  #   period: year
  #   value_format_name: "percent_1"
  #   drill_fields: [detail*]
  # }
  measure: number_of_providers {
    hidden: no
    label: "Number of Providers"
    description: "The total number of unique prescribing doctors/providers"
    synonyms: ["total providers", "doctor count", "provider count"]
    type: count_distinct
    sql: ${spi_root} ;;
    drill_fields: [detail*]
  }
  measure: number_of_prescriptions {
    hidden: no
    label: "Number of Prescriptions"
    description: "The total volume count of filled prescriptions"
    synonyms: ["total rx count", "transaction count", "prescription volume"]
    type: count_distinct
    sql: ${primary_key} ;;
    value_format_name: decimal_0
  }
  # measure: rtpb_adoption_rate {
  #   label: "RTPB Adoption Rate"
  #   description: "The percentage of prescription transactions where a Real-Time Prescription Benefit check was performed"
  #   type: number
  #   sql: SAFE_DIVIDE(
  #     COUNT(CASE WHEN ${rtpb} > 0 THEN 1 END),
  #     ${number_of_prescriptions}
  #   ) ;;
  #   value_format_name: percent_1
  # }
  measure: number_of_specialties {
    hidden: no
    label: "Number of Specialties"
    description: "The distinct count of unique prescriber medical specialties"
    synonyms: ["total specialties", "specialty count"]
    type: count_distinct
    sql: ${specialty} ;;
  }
  measure: utilization {
    label: "Provider Utilization"
    description: "The average number of prescriptions per prescribing provider (Number of Prescriptions divided by Number of Providers)"
    synonyms: ["utilization rate", "rx per provider"]
    type: number
    sql: SAFE_DIVIDE(${number_of_prescriptions},${number_of_providers}) ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  ### PERIOD COMPARISON
  filter: first_date_period {
    group_label: "Arbitrary Period Comparison"
    label: "First Date Period Filter"
    description: "Filters the first comparison period by the selected date range"
    type: date
    suggest_dimension: rx_date
    suggest_explore: prescriptions
    default_value: "2023"
    sql: ${is_first_period} OR ${is_second_period} ;;
  }
  filter: second_date_period {
    group_label: "Arbitrary Period Comparison"
    label: "Second Date Period Filter"
    description: "Filters the second comparison period by the selected date range"
    type: date
    suggest_dimension: rx_date
    suggest_explore: prescriptions
    default_value: "2022"
    sql: ${is_first_period} OR ${is_second_period} ;;
  }
  dimension: is_first_period {
    hidden: yes
    label: "Is First Period"
    description: "Flag indicating if the prescription date falls in the first period"
    group_label: "Arbitrary Period Comparison"
    type: yesno
    sql: {% condition first_date_period %} CAST(${rx_raw} as TIMESTAMP) {% endcondition %} ;;
  }
  dimension: is_second_period {
    hidden: yes
    label: "Is Second Period"
    description: "Flag indicating if the prescription date falls in the second period"
    group_label: "Arbitrary Period Comparison"
    type: yesno
    sql: {% condition second_date_period %} CAST(${rx_raw} as TIMESTAMP) {% endcondition %} ;;
  }
  # measure: number_of_new_prescriptions_in_first_period {
  #   hidden: no
  #   label: "Number of New Prescriptions in First Period"
  #   group_label: "Arbitrary Period Comparison"
  #   description: "The count of new prescriptions in the first comparison period selected"
  #   synonyms: ["new rx first period"]
  #   type: sum
  #   sql: ${new_rx} ;;
  #   filters: [is_first_period: "Yes"]
  #   drill_fields: [detail*]
  # }
  # measure: number_of_new_prescriptions_in_second_period {
  #   hidden: no
  #   label: "Number of New Prescriptions in Second Period"
  #   group_label: "Arbitrary Period Comparison"
  #   description: "The count of new prescriptions in the second comparison period selected"
  #   synonyms: ["new rx second period"]
  #   type: sum
  #   sql: ${new_rx} ;;
  #   filters: [is_second_period: "Yes"]
  #   drill_fields: [detail*]
  # }
  # measure: avg_days_supply_in_first_period {
  #   hidden: no
  #   label: "Average Days of Supply in First Period"
  #   group_label: "Arbitrary Period Comparison"
  #   description: "The average days of supply for the first comparison period selected"
  #   synonyms: ["mean days supply first period"]
  #   type: average
  #   sql: ${days_supply} ;;
  #   filters: [is_first_period: "Yes"]
  #   value_format_name: decimal_2
  # }
  # measure: avg_days_supply_in_second_period {
  #   hidden: no
  #   label: "Average Days of Supply in Second Period"
  #   group_label: "Arbitrary Period Comparison"
  #   description: "The average days of supply for the second comparison period selected"
  #   synonyms: ["mean days supply second period"]
  #   type: average
  #   sql: ${days_supply} ;;
  #   filters: [is_second_period: "Yes"]
  #   value_format_name: decimal_2
  # }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      rollup_name,
      account_name,
      label_name,
      generic_name,
      vendor_name,
      brand_name,
      vendor_common_name
    ]
  }

}
