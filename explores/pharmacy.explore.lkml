include: "/views/pharmacy.view.lkml"
include: "/views/self_contained_prescriptions_sim.view.lkml"

explore: pharmacy {
  label: "Pharmacy Explore"
  description: "This explore provides insight into the pharmacies, including location (state, zip), dispenser class and type."
  group_label: "Google RX Project"
  aggregate_table: pharmacy_monthly_summary {
    query: {
      dimensions: [pharmacy.city, prescriptions.rx_month]
      measures: [prescriptions.number_of_prescriptions]
      timezone: America/Los_Angeles
    }
    materialization: {
      sql_trigger_value: SELECT EXTRACT(Year FROM CURRENT_TIMESTAMP())  ;;
    }
  }
  join: prescriptions {
    from: self_contained_prescriptions_sim
    type: left_outer
    relationship: one_to_many
    sql_on: ${pharmacy.ncpdpid} = ${prescriptions.ncpdpid} ;;
  }
  always_filter: {
    filters: [pharmacy.state: "NY"]
  }
}
