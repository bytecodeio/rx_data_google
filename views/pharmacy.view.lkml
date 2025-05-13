view: pharmacy {
  sql_table_name: `Rx_Data.pharmacy` ;;
  drill_fields: [pharmacy_pk]

  dimension: pharmacy_pk {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.pharmacy_pk ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: dispenser_class {
    type: string
    sql: ${TABLE}.Dispenser_Class ;;
  }
  dimension: dispenser_type {
    type: string
    sql: ${TABLE}.Dispenser_Type ;;
  }
  dimension: ncpdpid {
    type: string
    sql: ${TABLE}.NCPDPID ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: [pharmacy_pk]
  }
  measure: number_of_pharmacies {
    label: "Number of Pharmacies"
    type: count_distinct
    sql: ${ncpdpid} ;;
    value_format_name: decimal_2
  }
}
