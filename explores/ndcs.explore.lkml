include: "/views/ndcs.view.lkml"
include: "/views/prescriptions.view.lkml"

explore: ndcs {
  label: "Medication Explore"
  group_label: "Google RX Project"
  join: prescriptions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ndcs.ndc} = ${prescriptions.ndc} ;;
  }
  conditionally_filter: {
    filters: [
      prescriptions.rx_date: "7 days ago",
      prescriptions.specialty: "Dermatology"
    ]
    unless: [prescriptions.rx_date, prescriptions.specialty]
  }
}
