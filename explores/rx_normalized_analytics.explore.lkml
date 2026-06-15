include: "/views/rx_fact.view.lkml"
include: "/views/accounts.view.lkml"  
include: "/views/age_groups.view.lkml"
include: "/views/dates.view.lkml"
include: "/views/spi_roots.view.lkml"
include: "/views/ndcs.view.lkml"
include: "/views/pharmacy.view.lkml"

explore: rx_normalized_analytics {
  label: "Prescription Analytics (Normalized)"
  group_label: "Google RX Project"
  view_name: rx_fact
  sql_always_where: ${pharmacy.state} = {% parameter pharmacy.selected_state %} ;;

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
}

