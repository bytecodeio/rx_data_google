include: "/views/self_contained_prescriptions_sim.view.lkml"
include: "/views/spi_roots.view.lkml"
include: "/views/county_census_dt.view.lkml"

explore: spi_roots {
  label: "Doctors Explore"
  description: "This explore focuses on the prescribers' or doctors' grain and contains details regarding their national ID, clinic location (state, zip), category and specialization of practice, along with statuses on certifications."
  group_label: "Google RX Project"
  view_label: "Doctors"
  join: prescriptions {
    from: self_contained_prescriptions_sim
    type: left_outer
    relationship: one_to_many
    sql_on: ${spi_roots.spi_root} = ${prescriptions.spi_root} ;;
  }

  join: county_census_dt {
    type: left_outer
    relationship: many_to_one
    sql_on: UPPER(${spi_roots.county}) = ${county_census_dt.clean_county_name}
      AND ${spi_roots.state} = ${county_census_dt.state} ;;
  }

  conditionally_filter: {
    filters: [ spi_roots.state: "NY" ]
    unless: [ spi_roots.city, spi_roots.county, spi_roots.zip ]
  }
}
