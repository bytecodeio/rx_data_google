view: rx_fact {
  sql_table_name: `Rx_Data.rx_fact` ;;
  drill_fields: [pk]

  dimension: pk {
    primary_key: yes
    label: "PK"
    description: "The unique primary key for the prescription fact record"
    synonyms: ["fact_key", "pk"]
    type: number
    sql: ${TABLE}.pk ;;
  }
  dimension: account {
    label: "Account Key"
    description: "Foreign key referencing the accounts table"
    synonyms: ["account_key"]
    type: number
    sql: ${TABLE}.account ;;
  }
  dimension: age_group {
    label: "Age Group Key"
    description: "Foreign key referencing the age groups table"
    synonyms: ["age_group_key"]
    type: number
    sql: ${TABLE}.age_group ;;
  }
  dimension: date_key {
    label: "Date Key"
    description: "Foreign key referencing the dates table"
    synonyms: ["date_id"]
    type: number
    sql: ${TABLE}.date_key ;;
  }
  dimension: days_supply {
    label: "Days Supply"
    description: "The number of days of medication supply provided in this transaction"
    synonyms: ["fill_length", "supply_duration"]
    type: number
    sql: ${TABLE}.days_supply ;;
  }
  dimension: days_supply_tier {
    label: "Days Supply Tier"
    description: "Groups prescription fills into Short-term, Standard, and Maintenance lengths"
    synonyms: ["days_supply_group"]
    type: string
    sql: CASE 
      WHEN ${days_supply} <= 15 THEN "1. Short-term Acute (<=15 Days)"
      WHEN ${days_supply} <= 30 THEN "2. Standard Retail (16-30 Days)"
      WHEN ${days_supply} <= 60 THEN "3. Intermediate (31-60 Days)"
      ELSE "4. Maintenance (61+ Days)"
    END ;;
  }
  dimension: doctor {
    label: "Doctor Key"
    description: "Foreign key referencing the doctors/spi_roots table"
    synonyms: ["spi_root_key", "provider_key"]
    type: number
    sql: ${TABLE}.doctor ;;
  }
  dimension: ndc {
    label: "NDC Key"
    description: "Foreign key referencing the NDCs table"
    synonyms: ["ndc_key"]
    type: number
    sql: ${TABLE}.ndc ;;
  }
  dimension: new_rx {
    label: "New Prescriptions Flag"
    description: "Indicator of whether the prescription is a new start (1 = new, 0 = refill)"
    synonyms: ["first_fill", "new_start"]
    type: number
    sql: ${TABLE}.new_rx ;;
  }
  dimension: pharmacy {
    label: "Pharmacy Key"
    description: "Foreign key referencing the pharmacy table"
    synonyms: ["pharmacy_key", "store_key"]
    type: number
    sql: ${TABLE}.pharmacy ;;
  }
  dimension: rtpb {
    label: "RTPB Check Flag"
    description: "Indicates whether a Real-Time Prescription Benefit check was run (values > 0)"
    synonyms: ["real_time_benefit", "benefit_check"]
    type: number
    sql: ${TABLE}.RTPB ;;
  }
  dimension: zipcode {
    label: "Zipcode"
    description: "The postal ZIP code associated with the prescription"
    synonyms: ["postal_code", "zip"]
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }
  measure: count {
    label: "Prescription Transaction Count"
    description: "The total number of prescription transactions filled"
    synonyms: ["total_rx_count", "transaction_count"]
    type: count
    drill_fields: [pk]
  }
  measure: number_of_new_prescriptions {
    label: "Number of New Prescriptions"
    description: "The total number of new prescriptions (Sum of new prescriptions sold)"
    synonyms: ["total_new_rx"]
    type: sum
    sql: ${new_rx} ;;
  }
  measure: new_rx_ratio {
    label: "New Prescription Rate"
    description: "The percentage of total filled prescriptions that are new starts"
    synonyms: ["new_rx_percentage"]
    type: number
    sql: SAFE_DIVIDE(${number_of_new_prescriptions}, ${count}) ;;
    value_format_name: percent_2
  }
  measure: rtpb_adoption_rate {
    label: "RTPB Adoption Rate"
    description: "The percentage of prescription transactions where a Real-Time Prescription Benefit check was performed"
    synonyms: ["rtpb_utilization"]
    type: number
    sql: SAFE_DIVIDE(
      COUNT(CASE WHEN ${rtpb} > 0 THEN 1 END),
      ${count}
    ) ;;
    value_format_name: percent_1
  }
}
