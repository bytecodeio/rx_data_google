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
    sql: DATE_ADD(${TABLE}.Date, INTERVAL 1 YEAR) ;;
  }
  dimension: iso_week {
    label: "ISO Week"
    description: "The ISO week number of the year"
    synonyms: ["week number"]
    type: number
    sql: ${TABLE}.ISO_Week ;;
  }
  dimension: iso_year {
    label: "ISO Year"
    description: "The ISO year of the date"
    synonyms: ["year number"]
    type: number
    sql: ${TABLE}.ISO_Year + 1 ;;
  }
  dimension: mm {
    label: "Month (MM)"
    description: "The two-digit month code (e.g. 01 to 12)"
    synonyms: ["month code", "month number"]
    type: string
    sql: ${TABLE}.MM ;;
  }
  dimension: yyyy {
    label: "Year (YYYY)"
    description: "The four-digit calendar year (e.g. 2023)"
    synonyms: ["calendar year"]
    type: number
    sql: ${TABLE}.YYYY + 1 ;;
  }
  dimension: yyyymm {
    label: "Year Month (YYYYMM)"
    description: "The concatenated year and month code (e.g. 202301)"
    synonyms: ["year month code"]
    type: number
    sql: ${TABLE}.YYYYMM + 100 ;;
  }
  measure: count {
    label: "Date Count"
    description: "The total number of date calendar records"
    type: count
    drill_fields: [dates_pk]
  }
}
