view: ndcs {
  sql_table_name: `Rx_Data.ndcs` ;;
  drill_fields: [ndc_pk]

  dimension: ndc_pk {
    primary_key: yes
    type: number
    sql: ${TABLE}.ndc_pk ;;
  }
  dimension: brand_name {
    type: string
    sql: ${TABLE}.Brand_Name ;;
  }
  dimension: disease {
    type: string
    sql: ${TABLE}.Disease ;;
  }
  dimension: dosage_unit {
    type: string
    sql: ${TABLE}.Dosage_Unit ;;
  }
  dimension: generic_long_name {
    type: string
    sql: ${TABLE}.Generic_Long_Name ;;
  }
  dimension: generic_name {
    type: string
    sql: ${TABLE}.Generic_Name ;;
  }
  dimension: label_name {
    type: string
    sql: ${TABLE}.Label_Name ;;
  }
  dimension: ndc {
    type: number
    sql: ${TABLE}.NDC ;;
  }
  dimension: therapeutic {
    type: string
    sql: ${TABLE}.Therapeutic ;;
  }
  measure: count {
    type: count
    drill_fields: [ndc_pk, generic_name, label_name, generic_long_name, brand_name]
  }
}
