include: "/views/prescriptions.view.lkml"
include: "/views/spi_roots.view.lkml"

explore: spi_roots {
  label: "Doctors Explore"
  join: prescriptions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${spi_roots.spi_root} = ${prescriptions.spi_root} ;;
  }
  conditionally_filter: {
    filters: [
      spi_roots.county: "WESTCHESTER"
    ]
    unless: [spi_roots.state]
  }
}
