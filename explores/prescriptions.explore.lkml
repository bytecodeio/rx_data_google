include: "/views/prescriptions.view.lkml"
include: "/views/pharmacy.view.lkml"
include: "/views/ndcs.view.lkml"
include: "/views/spi_roots.view.lkml"
include: "/views/county_census_dt.view.lkml"

explore: prescriptions {
  group_label: "Google RX Project"
  label: "Prescriptions"

  join: pharmacy {
    view_label: "Pharmacy"
    type: left_outer
    relationship: many_to_one
    sql_on: ${prescriptions.ncpdpid} = ${pharmacy.ncpdpid} ;;
  }

  join: ndcs {
    view_label: "NDC"
    type: left_outer
    relationship: many_to_one
    sql_on: ${prescriptions.ndc} = ${ndcs.ndc} ;;
  }

  join: spi_roots {
    view_label: "SPI Root"
    type: left_outer
    relationship: many_to_one
    sql_on: ${prescriptions.spi_root} = ${spi_roots.spi_root} ;;
  }

  join: county_census_dt {
    type: left_outer
    relationship: many_to_one
    sql_on: UPPER(${prescriptions.patient_county}) = ${county_census_dt.clean_county_name}
      AND ${prescriptions.patient_state} = ${county_census_dt.state} ;;
  }



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
