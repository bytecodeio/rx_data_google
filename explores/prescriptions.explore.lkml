include: "/views/prescriptions.view.lkml"

explore: prescriptions {
  group_label: "Google RX Project"
  label: "Prescriptions"
  aggregate_table: rollup_agg_brand_age_date {
    query: {
      dimensions: [prescriptions.brand_name, prescriptions.rx_date, prescriptions.age_group ]
      measures: [prescriptions.number_of_new_prescriptions]
      timezone: America/Los_Angeles
    }
    materialization: {
      sql_trigger_value: SELECT EXTRACT(Year FROM CURRENT_TIMESTAMP())  ;;
    }
  }

  aggregate_table: rollup_agg_specialty_brand_month {
    query: {
      dimensions: [prescriptions.brand_name, prescriptions.specialty, prescriptions.rx_month]
      measures: [prescriptions.number_of_new_prescriptions]
      timezone: America/Los_Angeles
    }
    materialization: {
      sql_trigger_value: SELECT EXTRACT(Year FROM CURRENT_TIMESTAMP())  ;;
    }
  }

}
