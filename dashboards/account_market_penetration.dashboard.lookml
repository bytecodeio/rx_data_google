- dashboard: account_market_penetration
  title: Account & Market Penetration
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:
  - name: account_name
    title: Account Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: accounts.account_name

  - name: vendor_name
    title: Vendor Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: accounts.vendor_name

  - name: rollup_name
    title: Rollup Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: accounts.rollup_name

  - name: pharmacy_state
    title: Pharmacy State
    type: field_filter
    default_value: 'NY'
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: pharmacy.state

  - name: drug_class
    title: Drug Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: ndcs.therapeutic

  - name: fill_date
    title: Fill Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    field: dates.date_date

  - name: age_group
    title: Age Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: age_groups.age_group

  - name: new_rx
    title: New Rx
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: rx_fact.new_rx

  - name: rtpb
    title: RTPB
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: rx_fact.rtpb

  - name: days_supply
    title: Days Supply
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    field: rx_fact.days_supply

  - name: dispenser_type
    title: Dispenser Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: inline
    model: rx_data_google
    explore: rx_normalized_analytics
    field: pharmacy.dispenser_type

  elements:
  # Row 0: KPI Cards (y: 0, height: 4)
  - name: kpi_total_volume
    title: Total Rx Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    x: 0
    y: 0
    width: 4
    height: 4
    listen: &standard_listen
      account_name: accounts.account_name
      vendor_name: accounts.vendor_name
      rollup_name: accounts.rollup_name
      pharmacy_state: pharmacy.state
      drug_class: ndcs.therapeutic
      fill_date: dates.date_date
      age_group: age_groups.age_group
      new_rx: rx_fact.new_rx
      rtpb: rx_fact.rtpb
      days_supply: rx_fact.days_supply
      dispenser_type: pharmacy.dispenser_type

  - name: kpi_new_rx_ratio
    title: New Prescription Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.new_rx_ratio]
    x: 4
    y: 0
    width: 4
    height: 4
    listen: *standard_listen

  - name: kpi_rtpb_adoption
    title: RTPB Adoption Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.rtpb_adoption_rate]
    x: 8
    y: 0
    width: 4
    height: 4
    listen: *standard_listen

  - name: kpi_average_days_supply
    title: Average Days Supply
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.average_days_supply]
    x: 12
    y: 0
    width: 4
    height: 4
    listen: *standard_listen

  - name: kpi_unique_accounts
    title: Total Accounts Count
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [accounts.count]
    x: 16
    y: 0
    width: 4
    height: 4
    listen: *standard_listen

  - name: kpi_unique_medications
    title: Total Medications
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [ndcs.number_of_medications]
    x: 20
    y: 0
    width: 4
    height: 4
    listen: *standard_listen

  # Row 1: Payer Shares (y: 4, height: 8)
  - name: volume_by_account
    title: Top 10 Rx Volume by Account
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [accounts.account_name, rx_fact.count]
    limit: 10
    x: 0
    y: 4
    width: 8
    height: 8
    listen: *standard_listen

  - name: volume_by_vendor
    title: Top 10 Rx Volume by Vendor
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [accounts.vendor_name, rx_fact.count]
    limit: 10
    x: 8
    y: 4
    width: 8
    height: 8
    listen: *standard_listen

  - name: volume_by_rollup
    title: Top 10 Rx Volume by Rollup
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [accounts.rollup_name, rx_fact.count]
    limit: 10
    x: 16
    y: 4
    width: 8
    height: 8
    listen: *standard_listen

  # Row 2: Geographic & Dispenser Performance (y: 12, height: 8)
  - name: state_volume_map
    title: Geographic Volume Heatmap
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_geo_choropleth
    fields: [pharmacy.state, rx_fact.count]
    x: 0
    y: 12
    width: 8
    height: 8
    listen: *standard_listen

  - name: volume_by_dispenser_class
    title: Volume by Dispenser Class
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [pharmacy.dispenser_class, rx_fact.count]
    x: 8
    y: 12
    width: 8
    height: 8
    listen: *standard_listen

  - name: volume_by_dispenser_type
    title: Volume by Dispenser Type
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [pharmacy.dispenser_type, rx_fact.count]
    x: 16
    y: 12
    width: 8
    height: 8
    listen: *standard_listen

  # Row 3: Utilization Tiers & Age Groups (y: 20, height: 8)
  - name: days_supply_distribution
    title: Days Supply Tier Distribution
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [rx_fact.days_supply_tier, rx_fact.count]
    x: 0
    y: 20
    width: 8
    height: 8
    listen: *standard_listen

  - name: volume_by_age_group
    title: Patient Volume by Age Group
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, rx_fact.count]
    x: 8
    y: 20
    width: 8
    height: 8
    listen: *standard_listen

  - name: rtpb_adoption_by_age
    title: RTPB Adoption Rate by Age Group
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, rx_fact.rtpb_adoption_rate]
    x: 16
    y: 20
    width: 8
    height: 8
    listen: *standard_listen

  # Row 4: Longitudinal Trends (y: 28, height: 8)
  - name: monthly_volume_trend
    title: Monthly Volume Trend
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, rx_fact.count]
    x: 0
    y: 28
    width: 12
    height: 8
    listen: *standard_listen

  - name: monthly_new_rx_ratio_trend
    title: Monthly New Rx Rate Trend
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, rx_fact.new_rx_ratio]
    x: 12
    y: 28
    width: 12
    height: 8
    listen: *standard_listen

  # Row 5: Detailed Audits & Tables (y: 36, height: 8)
  - name: top_ndc_outliers
    title: High-Utilization NDCs
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [ndcs.brand_name, ndcs.generic_name, rx_fact.count]
    x: 0
    y: 36
    width: 12
    height: 8
    listen: *standard_listen

  - name: top_prescribers_by_payer
    title: Top Prescribers by Transaction Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.spi_root, spi_roots.primary_common_name, rx_fact.count]
    x: 12
    y: 36
    width: 12
    height: 8
    listen: *standard_listen

  # Row 6: KPI Cards Set 2 (y: 44, height: 4)
  - name: kpi_total_new_rx
    title: Total New Prescriptions
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.number_of_new_prescriptions]
    x: 0
    y: 44
    width: 6
    height: 4
    listen: *standard_listen

  - name: kpi_ny_volume
    title: State Transaction Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [pharmacy.state_volume_kpi_card, pharmacy.selected_state, rx_fact.count]
    show_single_value_title: false
    x: 6
    y: 44
    width: 6
    height: 4
    listen: *standard_listen

  - name: kpi_rtpb_volume
    title: Total RTPB Check Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    filters:
      rx_fact.rtpb: '>0'
    x: 12
    y: 44
    width: 6
    height: 4
    listen: *standard_listen

  - name: kpi_pharmacy_count
    title: Total Dispatch Pharmacies
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [pharmacy.number_of_pharmacies]
    x: 18
    y: 44
    width: 6
    height: 4
    listen: *standard_listen

  # Row 7: Therapeutic & Disease Insights (y: 48, height: 8)
  - name: volume_by_therapeutic
    title: Volume by Therapeutic Class
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [ndcs.therapeutic, rx_fact.count]
    x: 0
    y: 48
    width: 12
    height: 8
    listen: *standard_listen

  - name: volume_by_disease
    title: Volume by Targeted Disease
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, rx_fact.count]
    x: 12
    y: 48
    width: 12
    height: 8
    listen: *standard_listen

  # Row 8: Payer Specific Breakdowns (y: 56, height: 8)
  - name: rtpb_adoption_by_payer
    title: RTPB Adoption Rate by Payer/Account
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [accounts.account_name, rx_fact.rtpb_adoption_rate]
    x: 0
    y: 56
    width: 12
    height: 8
    listen: *standard_listen

  - name: new_rx_ratio_by_payer
    title: New Prescription Rate by Payer/Account
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [accounts.account_name, rx_fact.new_rx_ratio]
    x: 12
    y: 56
    width: 12
    height: 8
    listen: *standard_listen

  # Row 9: Specialized Operations (y: 64, height: 8)
  - name: volume_by_prescriber_specialty
    title: Prescribing Volume by Specialty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [spi_roots.specialty, rx_fact.count]
    x: 0
    y: 64
    width: 12
    height: 8
    listen: *standard_listen

  - name: avg_days_supply_by_specialty
    title: Average Days Supply by Specialty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [spi_roots.specialty, rx_fact.average_days_supply]
    x: 12
    y: 64
    width: 12
    height: 8
    listen: *standard_listen

  # Row 10: Dates Breakdowns (y: 72, height: 8)
  - name: volume_by_day_of_week
    title: Volume by Day of Week
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [dates.date_day_of_week, rx_fact.count]
    x: 0
    y: 72
    width: 12
    height: 8
    listen: *standard_listen

  - name: volume_by_quarter
    title: Volume by Calendar Quarter
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [dates.date_quarter, rx_fact.count]
    x: 12
    y: 72
    width: 12
    height: 8
    listen: *standard_listen

  # Row 11: Regional Breakdowns (y: 80, height: 8)
  - name: volume_by_pharmacy_city
    title: Volume by Pharmacy City
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [pharmacy.selected_state, pharmacy.city, rx_fact.count]
    x: 0
    y: 80
    width: 12
    height: 8
    listen: *standard_listen

  - name: volume_by_patient_zip
    title: Volume by Patient ZIP
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [pharmacy.selected_state, rx_fact.zipcode, rx_fact.count]
    x: 12
    y: 80
    width: 12
    height: 8
    listen: *standard_listen

  # Row 12: Prescriber Performance (y: 88, height: 8)
  - name: top_providers_rtpb_adoption
    title: Top Providers by RTPB Adoption
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.spi_root, spi_roots.primary_common_name, rx_fact.rtpb_adoption_rate]
    x: 0
    y: 88
    width: 12
    height: 8
    listen: *standard_listen

  - name: top_providers_days_supply
    title: Top Providers by Avg Days Supply
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.spi_root, spi_roots.primary_common_name, rx_fact.average_days_supply]
    x: 12
    y: 88
    width: 12
    height: 8
    listen: *standard_listen

  # Row 13: Details Table and Audits (y: 96, height: 12)
  - name: detailed_payer_ndc_transaction_table
    title: Payer NDC Transaction Audit
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [accounts.account_name, ndcs.brand_name, rx_fact.count, rx_fact.new_rx_ratio, rx_fact.rtpb_adoption_rate]
    x: 0
    y: 96
    width: 24
    height: 12
    listen: *standard_listen

  # Row 14: Details Table 2 (y: 108, height: 12)
  - name: detailed_provider_pharmacy_loyalty
    title: Prescriber to Pharmacy Linkage Audit
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.primary_common_name, pharmacy.ncpdpid, rx_fact.count, rx_fact.average_days_supply]
    x: 0
    y: 108
    width: 24
    height: 12
    listen: *standard_listen

  # Row 15: Last Row of KPIs & Totals (y: 120, height: 4)
  - name: kpi_average_rtpb_adoption
    title: Overall RTPB Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.rtpb_adoption_rate]
    x: 0
    y: 120
    width: 8
    height: 4
    listen: *standard_listen

  - name: kpi_average_new_rx_rate
    title: Overall New Rx Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.new_rx_ratio]
    x: 8
    y: 120
    width: 8
    height: 4
    listen: *standard_listen

  - name: kpi_total_claims
    title: Total Claims Filled
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    x: 16
    y: 120
    width: 8
    height: 4
    listen: *standard_listen
