# Define the database connection to be used for this model.
connection: "sales_demo_the_look"

# include explores and dashboards
include: "/explores/rx_normalized_analytics.explore.lkml"
include: "/explores/pharmacy.explore.lkml"
include: "/explores/ndcs.explore.lkml"
include: "/explores/prescriptions.explore.lkml"
include: "/explores/spi_roots.explore.lkml"
include: "/explores/county_census.explore.lkml"
include: "/explores/daily_weather_summary.explore.lkml"


include: "/dashboards/itc_vs_sei.dashboard.lookml"
include: "/dashboards/prescribed_medication_brand_and_market_insights.dashboard.lookml"
include: "/dashboards/pop_brand_engagement.dashboard.lookml"
include: "/dashboards/public_health_weather_intelligence.dashboard.lookml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: rx_data_google_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

datagroup: weather_daily_datagroup {
  sql_trigger: SELECT CURRENT_DATE() ;;
  max_cache_age: "24 hours"
  description: "Caches persistent derived tables and explores for weather observations which refresh daily at midnight."
}

# persist_with: rx_data_google_default_datagroup
