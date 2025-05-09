view: rx_fact {
  sql_table_name: `Rx_Data.rx_fact` ;;
  drill_fields: [pk]

  dimension: pk {
    primary_key: yes
    type: number
    sql: ${TABLE}.pk ;;
  }
  dimension: account {
    type: number
    sql: ${TABLE}.account ;;
  }
  dimension: age_group {
    type: number
    sql: ${TABLE}.age_group ;;
  }
  dimension: date_key {
    type: number
    sql: ${TABLE}.date_key ;;
  }
  dimension: days_supply {
    type: number
    sql: ${TABLE}.days_supply ;;
  }
  dimension: doctor {
    type: number
    sql: ${TABLE}.doctor ;;
  }
  dimension: ndc {
    type: number
    sql: ${TABLE}.ndc ;;
  }
  dimension: new_rx {
    type: number
    sql: ${TABLE}.new_rx ;;
  }
  dimension: pharmacy {
    type: number
    sql: ${TABLE}.pharmacy ;;
  }
  dimension: rtpb {
    type: number
    sql: ${TABLE}.RTPB ;;
  }
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }
  measure: count {
    type: count
    drill_fields: [pk]
  }
}
