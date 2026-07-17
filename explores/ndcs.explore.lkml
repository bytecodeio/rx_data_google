include: "/views/ndcs.view.lkml"
include: "/views/self_contained_prescriptions_sim.view.lkml"

explore: ndcs {
  label: "Medication Explore"
  description: "This explore digs into the details for medications themselves, looking at things like dosage, supply amount, brand, targeted disease, etc."
  group_label: "Google RX Project"
  view_label: "Medications"
  join: prescriptions {
    from: self_contained_prescriptions_sim
    type: left_outer
    relationship: one_to_many
    sql_on: ${ndcs.ndc} = ${prescriptions.ndc} ;;
  }
  conditionally_filter: {
    filters: [ ndcs.therapeutic: "VITAMINS" ]
    unless: [ ndcs.disease ]
  }
}
