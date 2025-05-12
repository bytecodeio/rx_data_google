include: "/views/pharmacy.view.lkml"
include: "/views/prescriptions.view.lkml"


#JR NOTE 05/12/25 DO MORE ANALYSIS ON THE BELOW EXPLORE TO DETERMINE IF I CAN REWORK THE JOIN
  explore: pharmacy {
    label: "Pharmacy Explore"
    join: prescriptions {
      type: left_outer
      relationship: one_to_many
      sql_on: ${pharmacy.ncpdpid} = ${prescriptions.ncpdpid} ;;
    }
    always_filter: {
     filters: [pharmacy.state: "NY"]
    }
  }
