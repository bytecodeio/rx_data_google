view: prescriptions {
  sql_table_name: `Rx_Data.rx_denorm_fact_1` ;;

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    type: number
    sql: CONCAT(${account_name},${age_group},${rx_date},${ndc},${ncpdpid},${spi_root},${patient_zip}) ;;
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
    type: string
    sql: ${TABLE}.NCPDPID ;;
  }
  dimension: ndc {
    type: number
    sql: ${TABLE}.NDC ;;
  }
  dimension: new_rx {
    type: number
    sql: ${TABLE}.new_rx ;;
  }
  dimension: patient_city {
    type: string
    sql: ${TABLE}.patient_city ;;
  }
  dimension: patient_county {
    type: string
    sql: ${TABLE}.patient_county ;;
  }
  dimension: patient_state {
    type: string
    sql: ${TABLE}.patient_state ;;
  }
  dimension: patient_zip {
    type: string
    sql: ${TABLE}.patient_zip ;;
  }
  dimension: pharmacy_city {
    type: string
    sql: ${TABLE}.pharmacy_city ;;
  }
  dimension: pharmacy_state {
    type: string
    sql: ${TABLE}.pharmacy_state ;;
  }
  dimension: pharmacy_zip {
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
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.rx_date ;;
  }
  dimension: specialty {
    type: string
    sql: ${TABLE}.Specialty ;;
  }
  dimension: spi_city {
    type: string
    sql: ${TABLE}.spi_city ;;
  }
  dimension: spi_county {
    type: string
    sql: ${TABLE}.spi_county ;;
  }
  dimension: spi_root {
    type: string
    sql: ${TABLE}.SPI_Root ;;
  }
  dimension: spi_state {
    type: string
    sql: ${TABLE}.spi_state ;;
  }
  dimension: spi_zip {
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
    label: "Average Days of Supply"
    type: average
    sql: ${days_supply} ;;
    value_format_name: decimal_2
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: [detail*]
  }
  measure: number_of_pharmacies {
    label: "Number of Pharmacies"
    type: count_distinct
    sql: ${ncpdpid} ;;
    value_format_name: decimal_2
  }
  measure: number_of_prescriptions {
    hidden: no
    label: "Number of Prescriptions"
    description: "Count of prescriptions sold"
    type: sum
    sql: ${new_rx} ;;
    drill_fields: [detail*]
  }
  measure: number_of_providers {
    label: "Number of Providers"
    type: count_distinct
    sql: ${spi_root} ;;
    drill_fields: [detail*]
  }
  measure: utilization {
    type: number
    sql: SAFE_DIVIDE(${number_of_prescriptions},${number_of_providers}) ;;
    value_format_name:decimal_2
    drill_fields: [detail*]
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
