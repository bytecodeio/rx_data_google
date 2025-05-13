include: "/views/prescriptions.view.lkml"
include: "/views/spi_roots.view.lkml"

explore: spi_roots {
  label: "Doctors Explore"
  group_label: "Google RX Project"
  join: prescriptions {
    type: left_outer
    relationship: one_to_many
    sql_on: ${spi_roots.spi_root} = ${prescriptions.spi_root} ;;
  }
  conditionally_filter: {
    filters: [
      spi_roots.state: "'NY'",
      prescriptions.rx_month: "this month"
    ]
    unless: [spi_roots.state, prescriptions.rx_month]
  }
}
