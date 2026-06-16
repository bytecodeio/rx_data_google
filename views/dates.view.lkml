view: dates {
  sql_table_name: `Rx_Data.dates` ;;
  drill_fields: [dates_pk]

  dimension: dates_pk {
    primary_key: yes
    label: "Date PK"
    description: "The unique primary key for the date"
    synonyms: ["date key", "pk"]
    type: number
    sql: ${TABLE}.dates_pk ;;
  }
  dimension_group: date {
    label: "Fulfillment"
    description: "The calendar date when the transaction occurred"
    synonyms: ["fulfillment date", "rx date", "day"]
    type: time
    timeframes: [raw, date, week, month, month_name, quarter, year, day_of_week]
    convert_tz: no
    datatype: date
    sql: TIMESTAMP_ADD(${TABLE}.Date, INTERVAL DATE_DIFF(CURRENT_DATE(), DATE('2023-12-31'),DAY) DAY) ;;
  }
  dimension: iso_week {
    label: "ISO Week"
    description: "The ISO week number of the year"
    synonyms: ["week number"]
    type: date_week_of_year
    hidden: yes
    sql: ${date_raw} ;;
  }
  dimension: iso_year {
    label: "ISO Year"
    description: "The ISO year of the date"
    synonyms: ["year number"]
    type: date_year
    hidden: yes
    sql: ${date_raw} ;;
  }
  dimension: mm {
    label: "Month (MM)"
    description: "The two-digit month code (e.g. 01 to 12)"
    synonyms: ["month code", "month number"]
    type: date_month_num
    convert_tz: no
    sql: ${date_raw} ;;
  }
  dimension: yyyy {
    label: "Year (YYYY)"
    description: "The four-digit calendar year (e.g. 2023)"
    synonyms: ["calendar year"]
    type: date_year
    sql: ${date_raw} ;;
  }
  dimension: yyyymm {
    label: "Year Month (YYYYMM)"
    description: "The concatenated year and month code (e.g. 202301)"
    synonyms: ["year month code"]
    type: string
    sql: DATE_FORMAT('%Y%m', ${date_raw}) ;;
  }
  measure: count {
    label: "Date Count"
    description: "The total number of date calendar records"
    type: count
    drill_fields: [dates_pk]
  }
}
