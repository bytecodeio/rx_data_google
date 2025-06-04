view: accounts {
  sql_table_name: `Rx_Data.accounts` ;;
  drill_fields: [account_pk]

  dimension: account_pk {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_pk ;;
  }
  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }
  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
  }
  dimension: rollup_name {
    type: string
    sql: ${TABLE}.rollup_name ;;
  }
  dimension: vendor_common_name {
    type: string
    sql: ${TABLE}.vendor_common_name ;;
  }
  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  account_pk,
  vendor_common_name,
  rollup_name,
  account_name,
  vendor_name,
  accounts.vendor_common_name,
  accounts.rollup_name,
  accounts.account_pk,
  accounts.account_name,
  accounts.vendor_name,
  accounts.count
  ]
  }

}
