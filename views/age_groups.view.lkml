view: age_groups {
  sql_table_name: `Rx_Data.age_groups` ;;

  dimension: age_group_pk {
    primary_key: yes
    label: "Age Group PK"
    description: "The unique primary key for the age group"
    synonyms: ["age_group_key", "pk"]
    type: number
    sql: ${TABLE}.age_group_pk ;;
  }
  dimension: age_group {
    label: "Age Group"
    description: "The bracketed age range (e.g. 18-24, 65+)"
    synonyms: ["age_bracket", "age_cohort", "cohort"]
    type: string
    sql: ${TABLE}.Age_Group ;;
  }

  dimension: age_group_id {
    label: "Age Group ID"
    description: "The unique ID representing the age group classification"
    synonyms: ["age_bracket_code"]
    type: number
    sql: ${TABLE}.Age_Group_ID ;;
  }
  measure: count {
    label: "Age Group Category Count"
    description: "The total number of age group categories"
    type: count
  }
}
