include: "/views/station_mapping_dt.view.lkml"
include: "/views/weather_dt.view.lkml"

explore: station_mapping_dt {
  label: "Daily Weather Summary"
  description: "Standalone explore to analyze weather across zip codes, states, or stations."

  join: weather_dt {
    type: left_outer
    sql_on: ${station_mapping_dt.station_key} = ${weather_dt.station_key} ;;
    relationship: one_to_many
    view_label: "Daily Weather Records"
  }
}
