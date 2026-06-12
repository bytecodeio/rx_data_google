view: accounts {
  sql_table_name: `Rx_Data.accounts` ;;
  drill_fields: [account_pk]

  dimension: account_pk {
    primary_key: yes
    label: "Account PK"
    description: "The unique internal primary key identifier for the account"
    synonyms: ["account key", "pk"]
    type: number
    sql: ${TABLE}.account_pk ;;
  }
  dimension: account_id {
    label: "Account ID"
    description: "The unique public ID identifier for the account"
    synonyms: ["company id", "client id"]
    type: number
    sql: ${TABLE}.account_id ;;
  }
  dimension: account_name {
    label: "Account Name"
    description: "The name of the account organization"
    synonyms: ["company name", "client name", "account"]
    type: string
    sql: ${TABLE}.account_name ;;
  }
  dimension: rollup_name {
    label: "Rollup Name"
    description: "The parent or rollup group name for the account"
    synonyms: ["group name", "parent account"]
    type: string
    sql: ${TABLE}.rollup_name ;;
  }
  dimension: vendor_common_name {
    label: "Vendor Common Name"
    description: "The common name used for the vendor"
    synonyms: ["manufacturer common name"]
    type: string
    sql: ${TABLE}.vendor_common_name ;;
  }
  dimension: vendor_name {
    label: "Vendor Name"
    description: "The full legal name of the vendor"
    synonyms: ["manufacturer name"]
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  measure: count {
    label: "Account Count"
    description: "The total number of accounts"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  # account_pk,
  # vendor_common_name,
  # rollup_name,
  # account_name,
  # vendor_name,
  accounts.vendor_common_name,
  accounts.rollup_name,
  accounts.account_pk,
  accounts.account_name,
  accounts.vendor_name,
  accounts.count
  ]
  }

}
