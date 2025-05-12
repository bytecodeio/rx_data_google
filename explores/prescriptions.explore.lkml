include: "/views/prescriptions.view.lkml"

explore: prescriptions {
  label: "Rx Explore Google"
#  persist_with: performance_datagroup
  aggregate_table: rollup_agg_brand_age_date {
    query: {
      dimensions: [prescriptions.brand_name, prescriptions.rx_date,prescriptions.specialty
      ]
      measures: [prescriptions.total_new_rx]
      # prescriptions.specialty
     timezone: America/Los_Angeles
    }

    materialization: {
      sql_trigger_value: SELECT EXTRACT(Year FROM CURRENT_TIMESTAMP())  ;;
    }
  }

  aggregate_table: rollup_agg_specialty_brand_month {
    query: {
      dimensions: [prescriptions.brand_name, prescriptions.specialty, prescriptions.rx_month]
      measures: [prescriptions.total_new_rx]
      timezone: America/Los_Angeles
    }

    materialization: {
      sql_trigger_value: SELECT EXTRACT(Year FROM CURRENT_TIMESTAMP())  ;;
    }
  }
  # join: public_temp {
  #   type: inner
  #   relationship: many_to_one
  #   sql_on: ${prescriptions_1.rx_date} = ${public_temp.date_local} ;;
  # }
}
