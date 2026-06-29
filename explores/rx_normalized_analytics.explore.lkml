include: "/views/rx_fact.view.lkml"
include: "/views/accounts.view.lkml"
include: "/views/age_groups.view.lkml"
include: "/views/dates.view.lkml"
include: "/views/spi_roots.view.lkml"
include: "/views/ndcs.view.lkml"
include: "/views/pharmacy.view.lkml"
include: "/views/county_census_dt.view.lkml"

explore: rx_normalized_analytics {
  label: "Prescription Analytics (Normalized)"
  group_label: "Google RX Project"
  view_name: rx_fact
  # sql_always_where:
  #   {% condition pharmacy.selected_state_filter %} 'All States & Territories' {% endcondition %}
  #   OR {% condition pharmacy.selected_state_filter %} ${pharmacy.state_full_name} {% endcondition %}
  # ;;

  join: accounts {
    view_label: "Accounts"
    type: left_outer
    relationship: many_to_one
    sql_on: ${rx_fact.account} = ${accounts.account_pk} ;;
  }

  join: age_groups {
    view_label: "Age Groups"
    type: left_outer
    relationship: many_to_one
    sql_on: ${rx_fact.age_group} = ${age_groups.age_group_pk} ;;
  }

  join: dates {
    view_label: "Fulfillment Date"
    type: left_outer
    relationship: many_to_one
    sql_on: ${rx_fact.date_key} = ${dates.dates_pk} ;;
  }

  join: ndcs {
    view_label: "Medications"
    type: left_outer
    relationship: many_to_one
    sql_on: ${rx_fact.ndc} = ${ndcs.ndc_pk} ;;
  }

  join: pharmacy {
    view_label: "Pharmacy"
    type: left_outer
    relationship: many_to_one
    sql_on: ${rx_fact.pharmacy} = ${pharmacy.pharmacy_pk} ;;
  }

  join: spi_roots {
    view_label: "Prescribers"
    type: left_outer
    relationship: many_to_one
    sql_on: ${rx_fact.doctor} = ${spi_roots.spi_root_pk} ;;
  }

  # Join the County Census DT on the Prescriber's (Doctor's) County and State
  join: county_census_dt {
    type: left_outer
    relationship: many_to_one
    sql_on: UPPER(${spi_roots.county}) = ${county_census_dt.clean_county_name}
        AND ${spi_roots.state} = ${county_census_dt.state} ;;
  }
}
