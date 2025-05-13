include: "/views/prescriptions.view.lkml"
include: "/views/spi_roots.view.lkml"

explore: spi_roots {
  label: "Doctors Explore"
  group_label: "Google RX Project"
  view_label: "Doctors"
  join: prescriptions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${spi_roots.spi_root} = ${prescriptions.spi_root} ;;
  }
  conditionally_filter: {
    filters: [ spi_roots.state: "'NY'" ]
    unless: [ spi_roots.city, spi_roots.county, spi_roots.zip ]
  }
}
