view: prescriptions {
  sql_table_name: `Rx_Data.rx_denorm_fact_1` ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${account_name},${age_group},${rx_date},${ndc},${ncpdpid},${spi_root},${patient_zip}) ;;
  }

  parameter: pick_field_to_count {
    label: "Pick Field to Count"
    description: "Parameter that allows you to dynamically select Pharmacies or Providers to count"
    type: unquoted
    allowed_value: {
      label: "Pharmacies"
      value: "ncpdpid"
    }
    allowed_value: {
      label: "Providers"
      value: "spi_root"
    }
  }
  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }
  dimension: age_group {
    type: string
    sql: ${TABLE}.age_group ;;
  }
  dimension: brand_name {
    type: string
    sql: ${TABLE}.Brand_Name ;;
  }
  dimension: days_supply {
    type: number
    sql: ${TABLE}.days_supply ;;
  }
  dimension: disease {
    type: string
    sql: ${TABLE}.Disease ;;
  }
  dimension: dispenser_class {
    type: string
    sql: ${TABLE}.Dispenser_Class ;;
  }
  dimension: dispenser_type {
    type: string
    sql: ${TABLE}.Dispenser_Type ;;
  }
  dimension: generic_name {
    type: string
    sql: ${TABLE}.Generic_Name ;;
  }
  dimension: label_name {
    type: string
    sql: ${TABLE}.Label_Name ;;
  }
  dimension: ncpdpid {
    label: "Pharmacy ID"
    type: string
    sql: ${TABLE}.NCPDPID ;;
  }
  dimension: ndc {
    description: "National Drug Code"
    type: number
    sql: ${TABLE}.NDC ;;
  }
  dimension: new_rx {
    label: "New Prescriptions"
    type: number
    sql: ${TABLE}.new_rx ;;
  }
  dimension: patient_city {
    group_label: "Patient Location"
    type: string
    sql: ${TABLE}.patient_city ;;
  }
  dimension: patient_county {
    group_label: "Patient Location"
    type: string
    sql: ${TABLE}.patient_county ;;
  }
  dimension: patient_state {
    group_label: "Patient Location"
    type: string
    sql: ${TABLE}.patient_state ;;
  }
  dimension: patient_zip {
    group_label: "Patient Location"
    type: string
    sql: ${TABLE}.patient_zip ;;
  }
  dimension: pharmacy_city {
    hidden: no
    group_label: "Pharmacy Location"
    type: string
    sql: ${TABLE}.pharmacy_city ;;
  }
  dimension: pharmacy_state {
    hidden: no
    group_label: "Pharmacy Location"
    type: string
    sql: ${TABLE}.pharmacy_state ;;
  }
  dimension: pharmacy_zip {
    group_label: "Pharmacy Location"
    type: string
    sql: ${TABLE}.pharmacy_zip ;;
  }
  dimension: prescriber_type {
    type: string
    sql: ${TABLE}.prescriber_type ;;
  }
  dimension: primary_care {
    type: yesno
    sql: ${TABLE}.primary_care ;;
  }
  dimension: rollup_name {
    type: string
    sql: ${TABLE}.rollup_name ;;
  }
  dimension: rtpb {
    type: number
    sql: ${TABLE}.rtpb ;;
  }
  dimension_group: rx {
    label: "Prescription"
    type: time
    timeframes: [raw, date, time, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.rx_date ;;
  }
  dimension: specialty {
    type: string
    sql: ${TABLE}.Specialty ;;
  }
  dimension: spi_city {
    group_label: "Prescriber Location"
    label: "Prescriber City"
    type: string
    sql: ${TABLE}.spi_city ;;
  }
  dimension: spi_county {
    group_label: "Prescriber Location"
    label: "Prescriber Country"
    type: string
    sql: ${TABLE}.spi_county ;;
  }
  dimension: spi_root {
    label: "Prescriber ID"
    type: string
    sql: ${TABLE}.SPI_Root ;;
  }
  dimension: spi_state {
    group_label: "Prescriber Location"
    label: "Prescriber State"
    type: string
    sql: ${TABLE}.spi_state ;;
  }
  dimension: spi_zip {
    group_label: "Prescriber Location"
    label: "Prescriber Zip"
    type: string
    sql: ${TABLE}.spi_zip ;;
  }
  dimension: therapeutic {
    type: string
    sql: ${TABLE}.Therapeutic ;;
  }
  dimension: vendor_common_name {
    type: string
    sql: ${TABLE}.vendor_common_name ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  measure: avg_days_supply {
    hidden: no
    label: "Average Days of Supply"
    type: average
    sql: ${days_supply} ;;
    value_format_name: decimal_2
  }
  measure: dynamic_counter {
    hidden: no
    label: "Dynamic Counter"
    description: "Measure that receives input value from the parameter Pick Field to Count and returns a distinct count of the input dimension"
    type: count_distinct
    sql: {% parameter pick_field_to_count %} ;;
  }
  measure: number_of_pharmacies {
    hidden: no
    label: "Number of Pharmacies"
    description: "The total number of pharmacies (Distinct count of ncpdpid)"
    type: count_distinct
    sql: ${ncpdpid} ;;
    value_format_name: decimal_2
  }
  measure: number_of_new_prescriptions {
    hidden: no
    label: "Number of New Prescriptions"
    description: "The total number of new prescriptions (Sum of new prescriptions sold)"
    type: sum
    sql: ${new_rx} ;;
    drill_fields: [detail*]
  }
  measure: number_of_providers {
    hidden: no
    label: "Number of Providers"
    description: "The total number of providers (SPI root)"
    type: count_distinct
    sql: ${spi_root} ;;
    drill_fields: [detail*]
  }
  measure: number_of_prescriptions {
    hidden: no
    label: "Number of Prescriptions"
    description: "The total number of prescriptions."
    type: count_distinct
    sql: ${primary_key} ;;
  }
  measure: number_of_specialties {
    hidden: no
    label: "Number of Specialties"
    description: "Distinct count of the total number of specialties"
    type: count_distinct
    sql: ${specialty} ;;
  }
  measure: utilization {
    type: number
    sql: SAFE_DIVIDE(${number_of_prescriptions},${number_of_providers}) ;;
    value_format_name:decimal_2
    drill_fields: [detail*]
  }

  ### PERIOD COMPARISON
  filter: first_date_period {
    group_label: "Period Comparison"
    description: "Use this to compare measures against two date ranges. This will filter the first period comparison measures by the selected date range."
    type: date
    suggest_dimension: rx_date
    suggest_explore: prescriptions
    default_value: "2023"
    sql: ${is_first_period} OR ${is_second_period} ;;
  }
  filter: second_date_period {
    group_label: "Period Comparison"
    description: "Use this to compare measures against two date ranges. This will filter the second period comparison measures by the selected date range."
    type: date
    suggest_dimension: rx_date
    suggest_explore: prescriptions
    default_value: "2022"
    sql: ${is_first_period} OR ${is_second_period} ;;
  }
  dimension: is_first_period {
    hidden: yes
    group_label: "Period Comparison"
    type: yesno
    sql: {% condition first_date_period %} CAST(${rx_raw} as TIMESTAMP) {% endcondition %} ;;
  }
  dimension: is_second_period {
    hidden: yes
    group_label: "Period Comparison"
    type: yesno
    sql: {% condition second_date_period %} CAST(${rx_raw} as TIMESTAMP) {% endcondition %} ;;
  }
  measure: number_of_new_prescriptions_in_first_period {
    hidden: no
    label: "Number of New Prescriptions in First Period"
    group_label: "Period Comparison"
    description: "The total number of new prescriptions in the first period selected (Sum of new prescriptions sold)"
    type: sum
    sql: ${new_rx} ;;
    filters: [is_first_period: "Yes"]
    drill_fields: [detail*]
  }
  measure: number_of_new_prescriptions_in_second_period {
    hidden: no
    label: "Number of New Prescriptions in Second Period"
    group_label: "Period Comparison"
    description: "The total number of new prescriptions in the second period selected (Sum of new prescriptions sold)"
    type: sum
    sql: ${new_rx} ;;
    filters: [is_second_period: "Yes"]
    drill_fields: [detail*]
  }
  measure: avg_days_supply_in_first_period {
    hidden: no
    label: "Average Days of Supply in First Period"
    group_label: "Period Comparison"
    type: average
    sql: ${days_supply} ;;
    filters: [is_first_period: "Yes"]
    value_format_name: decimal_2
  }
  measure: avg_days_supply_in_second_period {
    hidden: no
    label: "Average Days of Supply in Second Period"
    group_label: "Period Comparison"
    type: average
    sql: ${days_supply} ;;
    filters: [is_second_period: "Yes"]
    value_format_name: decimal_2
  }
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
