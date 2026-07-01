---
- dashboard: marketing_brand_engagement_and_pop
  title: "Brand Performance and Provider Period-over-Period Engagement Command Center"
  description: "Executive Marketing Dashboard displaying native PoP metrics across patient journeys and provider targeting explores"
  layout: newspaper
  preferred_viewer: dashboards-next
  embed_style:
    background_color: "#f8f9fa"
    show_title: true
    title_color: "#1f2937"
    show_filters_bar: true
    tile_text_color: "#374151"
  filters:
  - name: date_range
    title: "Prescription Date Range"
    type: date_filter
    default_value: "last 30 days"

  - name: patient_state
    title: "Patient State"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.patient_state
    default_value: ""

  - name: brand_name
    title: "Brand Name"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.brand_name
    default_value: ""

  - name: disease_category
    title: "Disease Category"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.disease
    default_value: ""

  - name: therapeutic_class
    title: "Therapeutic Class"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.therapeutic
    default_value: ""

  - name: provider_specialty
    title: "Provider Specialty"
    type: field_filter
    model: rx_data_google
    explore: spi_roots
    field: spi_roots.specialty
    default_value: ""

  - name: pharmacy_state
    title: "Pharmacy State"
    type: field_filter
    model: rx_data_google
    explore: pharmacy
    field: pharmacy.state
    default_value: ""

  - name: pharmacy_dispenser
    title: "Dispenser Class"
    type: field_filter
    model: rx_data_google
    explore: pharmacy
    field: pharmacy.dispenser_class
    default_value: ""

  - name: account_rollup
    title: "Account Rollup"
    type: field_filter
    model: rx_data_google
    explore: rx_normalized_analytics
    field: accounts.rollup_name
    default_value: ""

  - name: census_county
    title: "Census County"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: county_census_dt.clean_county_name
    default_value: ""
  elements:
  # -------------------- SECTION 1: EXECUTIVE KPI SUMMARY (TILES 1-6) --------------------
  - name: sec_1_header
    type: text
    title_text: "I Executive KPI Summary - Native Period-over-Period Performance"
    body_text: "High level summary of prescription volumes and new treatment starts compared against previous monthly boundaries"
    row: 0
    col: 0
    width: 24
    height: 2

  - name: tile_1_total_prescriptions
    title: "Total Prescriptions Count"
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.number_of_prescriptions]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
    row: 2
    col: 0
    width: 4
    height: 4

  - name: tile_2_prior_prescriptions
    title: "Prior Period Prescriptions"
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.prescriptions_prior_period]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
    row: 2
    col: 4
    width: 4
    height: 4

  - name: tile_3_prescription_change_pct
    title: "Prescription PoP Change Percent"
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.prescriptions_pop_change_pct]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
    row: 2
    col: 8
    width: 4
    height: 4

  - name: tile_4_new_prescriptions
    title: "New Prescriptions Volume"
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.number_of_new_prescriptions]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
    row: 2
    col: 12
    width: 4
    height: 4

  - name: tile_5_new_prescription_pop_change
    title: "New Rx PoP Change Percent"
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.new_prescriptions_pop_pct_change]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
    row: 2
    col: 16
    width: 4
    height: 4

  - name: tile_6_avg_days_supply
    title: "Average Days Supply Trend"
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.avg_days_supply]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
    row: 2
    col: 20
    width: 4
    height: 4

  # -------------------- SECTION 2: BRAND PERFORMANCE & MARKET SHARE (TILES 7-12) --------------------
  - name: sec_2_header
    type: text
    title_text: "II Brand Performance and Market Share Analytics"
    body_text: "Visual breakdown of drug brand volumes and therapeutic class distributions over time"
    row: 6
    col: 0
    width: 24
    height: 2

  - name: tile_7_brand_share_pie
    title: "Brand Volume Distribution"
    model: rx_data_google
    explore: prescriptions
    type: looker_pie
    fields: [prescriptions.brand_name, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 5
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
    row: 8
    col: 0
    width: 8
    height: 6

  - name: tile_8_brand_volume_mom_line
    title: "Brand Prescriptions Monthly Trend"
    model: rx_data_google
    explore: prescriptions
    type: looker_line
    fields: [prescriptions.rx_month, prescriptions.brand_name, prescriptions.number_of_prescriptions]
    pivots: [prescriptions.brand_name]
    sorts: [prescriptions.rx_month asc]
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
    row: 8
    col: 8
    width: 8
    height: 6

  - name: tile_9_brand_performance_heatmap
    title: "Brand Performance Heatmap Matrix"
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [prescriptions.brand_name, prescriptions.number_of_prescriptions, prescriptions.number_of_new_prescriptions, prescriptions.new_rx_ratio]
    sorts: [prescriptions.number_of_prescriptions desc]
    show_row_numbers: true
    conditional_formatting: [{
      type: "along_columns",
      value_format_name: decimal_0,
      background_color: "#3EB0D5",
      color_application: {theme_id: "default", palette_id: "blue_orange"}
    }]
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
    row: 8
    col: 16
    width: 8
    height: 6

  - name: tile_10_new_vs_refill_stacked
    title: "New vs Refill Volume by Brand"
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [prescriptions.brand_name, prescriptions.number_of_new_prescriptions, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    is_stacked: true
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
    row: 14
    col: 0
    width: 8
    height: 8

  - name: tile_11_therapeutic_donut
    title: "Therapeutic Class Market Share"
    model: rx_data_google
    explore: prescriptions
    type: looker_donut
    fields: [prescriptions.therapeutic, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    listen:
      date_range: prescriptions.rx_date
      therapeutic_class: prescriptions.therapeutic
    row: 14
    col: 8
    width: 8
    height: 8

  - name: tile_12_pivoted_state_area
    title: "Prescriptions Pivoted by State and Brand"
    model: rx_data_google
    explore: prescriptions
    type: looker_area
    fields: [prescriptions.patient_state, prescriptions.brand_name, prescriptions.number_of_prescriptions]
    pivots: [prescriptions.brand_name]
    sorts: [prescriptions.patient_state asc]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
    row: 14
    col: 16
    width: 8
    height: 8

  # -------------------- SECTION 3: GEOGRAPHIC & SOCIOECONOMIC TARGETING (TILES 13-17) --------------------
  - name: sec_3_header
    type: text
    title_text: "III Geographic and Socioeconomic Targeting - Census Overlay"
    body_text: "Targeting high growth territories by overlaying patient demographics and county level socioeconomic indices"
    row: 22
    col: 0
    width: 24
    height: 2

  - name: tile_13_volume_vs_income_scatter
    title: "Prescription Volume vs Median Household Income"
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.median_income_raw, prescriptions.number_of_prescriptions]
    sorts: [county_census_dt.median_income_raw desc]
    listen:
      census_county: county_census_dt.clean_county_name
    row: 24
    col: 0
    width: 8
    height: 6

  - name: tile_14_poverty_vs_rtpb_bubble
    title: "Poverty Rate vs RTPB Adoption Rate"
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.poverty, prescriptions.rtpb1_rate]
    sorts: [county_census_dt.poverty desc]
    listen:
      census_county: county_census_dt.clean_county_name
    row: 24
    col: 8
    width: 8
    height: 6

  - name: tile_15_top_counties_growth
    title: "Top Counties by Prescription Growth Volume"
    model: rx_data_google
    explore: prescriptions
    type: looker_bar
    fields: [county_census_dt.clean_county_name, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 15
    listen:
      census_county: county_census_dt.clean_county_name
    row: 24
    col: 16
    width: 8
    height: 6

  - name: tile_16_regional_census_heatmap
    title: "Regional Census Socioeconomic Heatmap"
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [county_census_dt.clean_county_name, county_census_dt.total_population, county_census_dt.median_age_raw, county_census_dt.median_income_raw, county_census_dt.unemployed_pop_raw, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    conditional_formatting: [{
      type: "along_columns",
      background_color: "#12B5CB",
      color_application: {theme_id: "default", palette_id: "red_green"}
    }]
    listen:
      census_county: county_census_dt.clean_county_name
    row: 30
    col: 0
    width: 12
    height: 8

  - name: tile_17_decile_vs_income_pivoted
    title: "Physician Decile Routing vs Zip Code Income"
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [spi_roots.decile_routing, spi_roots.zip_income_tier, spi_roots.number_of_doctors]
    pivots: [spi_roots.zip_income_tier]
    sorts: [spi_roots.decile_routing asc]
    listen:
      provider_specialty: spi_roots.specialty
    row: 30
    col: 12
    width: 12
    height: 8

  # -------------------- SECTION 4: FUNNELS, TIMELINES & SPECIALTY CHARTS (TILES 18-22) --------------------
  - name: sec_4_header
    type: text
    title_text: "IV Specialty Visualizations - Funnels Timelines and Distribution Box Plots"
    body_text: "Tracking doctor engagement progression, therapy durations, and medication supply distributions"
    row: 38
    col: 0
    width: 24
    height: 2

  - name: tile_18_doctor_decile_funnel
    title: "Doctor Decile to Prescribing Funnel"
    model: rx_data_google
    explore: spi_roots
    type: looker_funnel
    fields: [spi_roots.decile_routing, spi_roots.number_of_doctors]
    sorts: [spi_roots.decile_routing desc]
    listen:
      provider_specialty: spi_roots.specialty
    row: 40
    col: 0
    width: 8
    height: 8

  - name: tile_19_days_supply_boxplot
    title: "Days Supply Distribution across Therapeutics"
    model: rx_data_google
    explore: prescriptions
    type: looker_boxplot
    fields: [
      prescriptions.therapeutic,
      prescriptions.days_supply_p5,
      prescriptions.days_supply_p25,
      prescriptions.days_supply_p50,
      prescriptions.days_supply_p75,
      prescriptions.days_supply_p95
    ]
    sorts: [prescriptions.therapeutic asc]
    limit: 10
    listen:
      therapeutic_class: prescriptions.therapeutic
    row: 40
    col: 8
    width: 8
    height: 8

  - name: tile_20_treatment_duration_timeline
    title: "Treatment Duration Overlap"
    model: rx_data_google
    explore: prescriptions
    type: looker_timeline
    fields: [prescriptions.generic_name, prescriptions.treatment_start_date, prescriptions.treatment_end_date]
    sorts: [prescriptions.treatment_start_date asc]
    limit: 15
    listen:
      brand_name: prescriptions.brand_name
    row: 40
    col: 16
    width: 8
    height: 8

  - name: tile_21_decile_distribution_specialty
    title: "Prescriber Decile Distribution by Specialty"
    model: rx_data_google
    explore: spi_roots
    type: looker_bar
    fields: [spi_roots.specialty, spi_roots.decile_routing, spi_roots.number_of_doctors]
    pivots: [spi_roots.decile_routing]
    sorts: [spi_roots.number_of_doctors desc]
    limit: 10
    listen:
      provider_specialty: spi_roots.specialty
    row: 48
    col: 0
    width: 12
    height: 6

  - name: tile_22_rtpb_adoption_area
    title: "RTPB Adoption Rate Trend"
    model: rx_data_google
    explore: prescriptions
    type: looker_area
    fields: [prescriptions.rx_month, prescriptions.rtpb1_rate]
    sorts: [prescriptions.rx_month asc]
    listen:
      date_range: prescriptions.rx_date
    row: 48
    col: 12
    width: 12
    height: 6

  # -------------------- SECTION 5: PROVIDER & PHARMACY DEEP-DIVE (TILES 23-27) --------------------
  - name: sec_5_header
    type: text
    title_text: "V Provider and Pharmacy Deep-Dive Performance"
    body_text: "Analyzing high performing pharmacies and top prescribing physicians across marketing targets"
    row: 54
    col: 0
    width: 24
    height: 2

  - name: tile_23_top_prescribers
    title: "Top 10 Prescribers by Volume"
    model: rx_data_google
    explore: spi_roots
    type: looker_grid
    fields: [spi_roots.primary_common_name, spi_roots.specialty, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 10
    listen:
      provider_specialty: spi_roots.specialty
    row: 56
    col: 0
    width: 8
    height: 6

  - name: tile_24_top_pharmacies
    title: "Top 10 Pharmacies by New Rx Volume"
    model: rx_data_google
    explore: pharmacy
    type: looker_grid
    fields: [pharmacy.city, pharmacy.dispenser_class, prescriptions.number_of_new_prescriptions]
    sorts: [prescriptions.number_of_new_prescriptions desc]
    limit: 10
    listen:
      pharmacy_state: pharmacy.state
      pharmacy_dispenser: pharmacy.dispenser_class
    row: 56
    col: 8
    width: 8
    height: 6

  - name: tile_25_decile_vs_prescriptions
    title: "Provider Decile Routing vs Actual Prescriptions"
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [spi_roots.decile_routing, prescriptions.number_of_prescriptions]
    sorts: [spi_roots.decile_routing asc]
    listen:
      provider_specialty: spi_roots.specialty
    row: 56
    col: 16
    width: 8
    height: 6

  - name: tile_26_pharmacy_distribution_pivoted
    title: "Pharmacy State Distribution"
    model: rx_data_google
    explore: pharmacy
    type: looker_column
    fields: [pharmacy.state, pharmacy.dispenser_class, pharmacy.number_of_pharmacies]
    pivots: [pharmacy.dispenser_class]
    sorts: [pharmacy.number_of_pharmacies desc]
    listen:
      pharmacy_state: pharmacy.state
      pharmacy_dispenser: pharmacy.dispenser_class
    row: 62
    col: 0
    width: 12
    height: 8

  - name: tile_27_days_supply_vs_new_ratio
    title: "Average Days Supply vs New Rx Ratio Scatter"
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [prescriptions.brand_name, prescriptions.avg_days_supply, prescriptions.new_rx_ratio]
    sorts: [prescriptions.avg_days_supply desc]
    listen:
      brand_name: prescriptions.brand_name
    row: 62
    col: 12
    width: 12
    height: 8

  # -------------------- SECTION 6: MERGED QUERY TILES & ADVANCED CAMPAIGN ANALYSIS (TILES 28-30) --------------------
  - name: sec_6_header
    type: text
    title_text: "VI Merged Query Tiles and Advanced Campaign Analysis"
    body_text: "Combining multidimensional explore datasets for targeted territory mapping and brand growth walk analysis"
    row: 70
    col: 0
    width: 24
    height: 2

  # - name: tile_28_merged_prescriber_census
  #   title: "Prescriber Census Overlay"
  #   type: merged_results
  #   query_mapping:
  #     - field_name: merged_zip
  #       join_fields:
  #         - field_name: spi_roots.zip
  #           source_field_name: query_spi_doctors
  #         - field_name: prescriptions.patient_zip
  #           source_field_name: query_prescriptions_volume
  #     - field_name: merged_state
  #       join_fields:
  #         - field_name: spi_roots.state
  #           source_field_name: query_spi_doctors
  #         - field_name: prescriptions.patient_state
  #           source_field_name: query_prescriptions_volume
  #   # Definition of underlying queries representing cross-explore merge
  #   merged_queries:
  #     - name: query_spi_doctors
  #       model: rx_data_google
  #       explore: spi_roots
  #       fields: [spi_roots.zip, spi_roots.state, spi_roots.number_of_doctors]
  #       sorts: [spi_roots.number_of_doctors desc]
  #     - name: query_prescriptions_volume
  #       model: rx_data_google
  #       explore: prescriptions
  #       fields: [prescriptions.patient_zip, prescriptions.patient_state, prescriptions.number_of_prescriptions, county_census_dt.average_median_income]
  #       sorts: [prescriptions.number_of_prescriptions desc]
  #   row: 72
  #   col: 0
  #   width: 12
  #   height: 6

  # - name: tile_29_merged_med_pharmacy
  #   title: "Medication and Pharmacy Co-occurrence"
  #   type: merged_results
  #   query_mapping:
  #     - field_name: merged_state
  #       join_fields:
  #         - field_name: prescriptions.patient_state
  #           source_field_name: query_ndc_sales
  #         - field_name: pharmacy.state
  #           source_field_name: query_pharm_reach
  #   merged_queries:
  #     - name: query_ndc_sales
  #       model: rx_data_google
  #       explore: ndcs
  #       fields: [prescriptions.patient_state, ndcs.therapeutic, ndcs.number_of_medications]
  #     - name: query_pharm_reach
  #       model: rx_data_google
  #       explore: pharmacy
  #       fields: [pharmacy.state, pharmacy.dispenser_type, pharmacy.number_of_pharmacies]
  #   row: 72
  #   col: 12
  #   width: 12
  #   height: 6

  - name: tile_30_brand_share_vs_socioeconomic_trend
    title: "Brand Share vs Socioeconomic Indicators Trend"
    model: rx_data_google
    explore: prescriptions
    type: looker_area
    fields: [prescriptions.rx_month, prescriptions.new_rx_ratio, county_census_dt.poverty]
    sorts: [prescriptions.rx_month asc]
    listen:
      date_range: prescriptions.rx_date
    row: 78
    col: 0
    width: 24
    height: 8
