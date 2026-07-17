include: "/views/ge_prescriptions.view.lkml"
include: "/views/pharmacy.view.lkml"
include: "/views/ndcs.view.lkml"
include: "/views/spi_roots.view.lkml"
include: "/views/county_census_dt.view.lkml"
include: "/views/station_mapping_dt.view.lkml"
include: "/views/weather_dt.view.lkml"


explore: prescriptions {
  from:  ge_prescriptions
   description: "Unified epidemiological explore linking patient prescription patterns to localized, daily NOAA GSOD weather metrics."
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

  # --- NOAA WEATHER GEOGRAPHIC JOIN ---
  # Maps each patient's residency ZIP code to their single closest weather station node
  join: station_mapping_dt {
    view_label: "Weather Station Mapping"
    type: left_outer
    relationship: many_to_one
    sql_on: ${prescriptions.patient_zip} = ${station_mapping_dt.zip_code} ;;
  }

  # --- NOAA WEATHER TEMPORAL JOIN ---
  # Links daily weather observations recorded at that station on the exact day of prescription fulfillment
  join: weather_dt {
    view_label: "Daily Weather Records"
    type: left_outer
    relationship: many_to_one
    sql_on: ${station_mapping_dt.station_key} = ${weather_dt.station_key}
      AND ${prescriptions.rx_date} = ${weather_dt.weather_record_date} ;;
  }
}
