view: age_groups {
  sql_table_name: `Rx_Data.age_groups` ;;

  dimension: age_group_pk {
    primary_key: yes
    type: number
    sql: ${TABLE}.age_group_pk ;;
  }
  dimension: age_group {
    type: string
    sql: ${TABLE}.Age_Group ;;
  }

  dimension: age_group_id {
    type: number
    sql: ${TABLE}.Age_Group_ID ;;
  }
  measure: count {
    type: count
  }
}
