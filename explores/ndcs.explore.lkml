include: "/views/ndcs.view.lkml"
include: "/views/prescriptions.view.lkml"

explore: ndcs {
  label: "Medication Explore"
  join: prescriptions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${ndcs.ndc} = ${prescriptions.ndc} ;;
  }
}
