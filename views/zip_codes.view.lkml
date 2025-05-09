view: zip_codes {
  sql_table_name: `Rx_Data.zip_codes` ;;
  drill_fields: [zip_pk]

  dimension: zip_pk {
    primary_key: yes
    type: number
    sql: ${TABLE}.zip_pk ;;
  }
  dimension: african_american_population {
    type: string
    sql: ${TABLE}.African_American_Population ;;
  }
  dimension: area_type {
    type: string
    sql: ${TABLE}.Area_Type ;;
  }
  dimension: average_house_value {
    type: string
    sql: ${TABLE}.Average_House_Value ;;
  }
  dimension: cbsa {
    type: string
    sql: ${TABLE}.CBSA ;;
  }
  dimension: cbsa_name {
    type: string
    sql: ${TABLE}.CBSA_Name ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }
  dimension: hispanic_population {
    type: string
    sql: ${TABLE}.Hispanic_Population ;;
  }
  dimension: household {
    type: string
    sql: ${TABLE}.Household ;;
  }
  dimension: income_per_household {
    type: string
    sql: ${TABLE}.Income_Per_Household ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: white_population {
    type: string
    sql: ${TABLE}.White_Population ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }
  dimension: zip_population {
    type: string
    sql: ${TABLE}.Zip_Population ;;
  }
  measure: count {
    type: count
    drill_fields: [zip_pk, cbsa_name]
  }
}
