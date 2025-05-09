view: dates {
  sql_table_name: `Rx_Data.dates` ;;
  drill_fields: [dates_pk]

  dimension: dates_pk {
    primary_key: yes
    type: number
    sql: ${TABLE}.dates_pk ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }
  dimension: iso_week {
    type: number
    sql: ${TABLE}.ISO_Week ;;
  }
  dimension: iso_year {
    type: number
    sql: ${TABLE}.ISO_Year ;;
  }
  dimension: mm {
    type: string
    sql: ${TABLE}.MM ;;
  }
  dimension: yyyy {
    type: number
    sql: ${TABLE}.YYYY ;;
  }
  dimension: yyyymm {
    type: number
    sql: ${TABLE}.YYYYMM ;;
  }
  measure: count {
    type: count
    drill_fields: [dates_pk]
  }
}
