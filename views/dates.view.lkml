view: dates {
  sql_table_name: `Rx_Data.dates` ;;
  drill_fields: [dates_pk]

  dimension: dates_pk {
    primary_key: yes
    label: "Date PK"
    description: "The unique primary key for the date"
    synonyms: ["date_key", "pk"]
    type: number
    sql: ${TABLE}.dates_pk ;;
  }
  dimension_group: date {
    label: "Fulfillment"
    description: "The calendar date when the transaction occurred"
    synonyms: ["fulfillment_date", "rx_date", "day"]
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }
  dimension: iso_week {
    label: "ISO Week"
    description: "The ISO week number of the year"
    synonyms: ["week_number"]
    type: number
    sql: ${TABLE}.ISO_Week ;;
  }
  dimension: iso_year {
    label: "ISO Year"
    description: "The ISO year of the date"
    synonyms: ["year_number"]
    type: number
    sql: ${TABLE}.ISO_Year ;;
  }
  dimension: mm {
    label: "Month (MM)"
    description: "The two-digit month code (e.g. 01 to 12)"
    synonyms: ["month_code", "month_number"]
    type: string
    sql: ${TABLE}.MM ;;
  }
  dimension: yyyy {
    label: "Year (YYYY)"
    description: "The four-digit calendar year (e.g. 2023)"
    synonyms: ["calendar_year"]
    type: number
    sql: ${TABLE}.YYYY ;;
  }
  dimension: yyyymm {
    label: "Year Month (YYYYMM)"
    description: "The concatenated year and month code (e.g. 202301)"
    synonyms: ["year_month_code"]
    type: number
    sql: ${TABLE}.YYYYMM ;;
  }
  measure: count {
    label: "Date Count"
    description: "The total number of date calendar records"
    type: count
    drill_fields: [dates_pk]
  }
}
