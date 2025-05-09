# Define the database connection to be used for this model.
connection: "sales_demo_the_look"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: rx_data_google_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: rx_data_google_default_datagroup

explore: dates {}

explore: age_groups {}

explore: ndcs {}

explore: pharmacy {}

explore: accounts {}

explore: rx_fact {}

explore: zip_codes {}

explore: spi_roots {}
