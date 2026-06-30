---
- dashboard: chronic_care_vs_socioeconomic_indicators
  title: Chronic Care vs Socioeconomic Indicators
  preferred_viewer: dashboards-next
  description: This advanced dashboard investigates the correlation between socioeconomic
    factors (income, poverty, education, unemployment) and long-term chronic healthcare
    utilization, RTPB adoption rates, and provider accessibility.
  preferred_slug: luKlLIsnyNBWiEe4QYUmur
  theme_name: ''
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: Total Prescription Volume
    name: Total Prescription Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 0
    col: 0
    width: 6
    height: 4
    tab_name: ''
  - title: New Prescription Rate
    name: New Prescription Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.new_rx_ratio]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 0
    col: 6
    width: 6
    height: 4
    tab_name: ''
  - title: Long-Term Care Share (61+ Days Supply)
    name: Long-Term Care Share (61+ Days Supply)
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    filters:
      rx_fact.days_supply_tier: 4. Maintenance (61+ Days)
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 0
    col: 12
    width: 6
    height: 4
    tab_name: ''
  - title: Avg Household Income of Served Areas
    name: Avg Household Income of Served Areas
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [county_census_dt.average_median_income]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 0
    col: 18
    width: 6
    height: 4
    tab_name: ''
  - title: Monthly Prescription Volume Trend by County Income Tier
    name: Monthly Prescription Volume Trend by County Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_area
    fields: [dates.date_month, county_census_dt.income_tier, rx_fact.count]
    pivots: [county_census_dt.income_tier]
    sorts: [dates.date_month asc]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 4
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: New Rx Start Rate Trend by County Poverty Level
    name: New Rx Start Rate Trend by County Poverty Level
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, county_census_dt.poverty_tier, rx_fact.new_rx_ratio]
    pivots: [county_census_dt.poverty_tier]
    sorts: [dates.date_month asc]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 4
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Top Chronic Diseases in Low-Income Counties
    name: Top Chronic Diseases in Low-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, rx_fact.count]
    filters:
      county_census_dt.income_tier: Low
    sorts: [rx_fact.count desc]
    limit: 10
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 12
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Top Chronic Diseases in High-Income Counties
    name: Top Chronic Diseases in High-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, rx_fact.count]
    filters:
      county_census_dt.income_tier: High
    sorts: [rx_fact.count desc]
    limit: 10
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 12
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Maintenance vs Acute Supply Tier by Target Disease
    name: Maintenance vs Acute Supply Tier by Target Disease
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [ndcs.disease, rx_fact.days_supply_tier, rx_fact.count]
    pivots: [rx_fact.days_supply_tier]
    sorts: [rx_fact.count desc]
    limit: 10
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 20
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Standard Therapy Prescriptions Over Time by Prescriber Specialty
    name: Standard Therapy Prescriptions Over Time by Prescriber Specialty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, spi_roots.specialty, rx_fact.count]
    pivots: [spi_roots.specialty]
    filters:
      rx_fact.days_supply_tier: 2. Standard Retail (16-30 Days)
    sorts: [dates.date_month asc]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 20
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Distribution of Days Supply across Therapeutic Classes
    name: Distribution of Days Supply across Therapeutic Classes
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [ndcs.therapeutic, rx_fact.average_days_supply]
    sorts: [rx_fact.average_days_supply desc]
    limit: 15
    column_limit: 50
    value_labels: legend
    label_type: labPer
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 28
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: RTPB Adoption Rate for Top Chronic Diseases
    name: RTPB Adoption Rate for Top Chronic Diseases
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [ndcs.disease, rx_fact.rtpb_adoption_rate]
    sorts: [rx_fact.rtpb_adoption_rate desc]
    limit: 15
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 28
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Most Prevalent Chronic Disease
    name: Most Prevalent Chronic Disease
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [ndcs.disease, rx_fact.count]
    sorts: [rx_fact.count desc]
    limit: 1
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 36
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Long-Term Care Share by Therapeutic Drug Class
    name: Long-Term Care Share by Therapeutic Drug Class
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [ndcs.therapeutic, rx_fact.count]
    filters:
      rx_fact.days_supply_tier: ''
    sorts: [rx_fact.count desc]
    limit: 8
    column_limit: 50
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 36
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Total Prescriptions Filled by County Poverty Level
    name: Total Prescriptions Filled by County Poverty Level
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [county_census_dt.poverty_tier, prescriptions.number_of_prescriptions]
    sorts: [county_census_dt.poverty_tier asc]
    limit: 5000
    column_limit: 50
    listen:
      Fulfillment Date: prescriptions.rx_date
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: prescriptions.therapeutic
      Targeted Disease: prescriptions.disease
      Brand Name: prescriptions.brand_name
    row: 44
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: County Correlation - RTPB Adoption Rate vs Poverty Rate
    name: County Correlation - RTPB Adoption Rate vs Poverty Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [county_census_dt.clean_county_name, county_census_dt.poverty_rate, rx_fact.rtpb_adoption_rate]
    sorts: [county_census_dt.poverty_rate desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    defaults_version: 1
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 52
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Top 10 States by Prescription Volume
    name: Top 10 States by Prescription Volume
    model: rx_data_google
    explore: prescriptions
    type: looker_google_map
    fields: [prescriptions.patient_state, prescriptions.patient_county, prescriptions.number_of_prescriptions]
    filters:
      prescriptions.therapeutic: ''
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 10
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 0
    hidden_pivots: {}
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    value_labels: legend
    label_type: labPer
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Fulfillment Date: prescriptions.rx_date
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: prescriptions.therapeutic
      Targeted Disease: prescriptions.disease
      Brand Name: prescriptions.brand_name
    row: 44
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Prescription Share by County Unemployment Tier
    name: Prescription Share by County Unemployment Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [county_census_dt.unemployment_tier, rx_fact.count]
    sorts: [rx_fact.count desc]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 52
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Vulnerable Counties Served Count
    name: Vulnerable Counties Served Count
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [county_census_dt.count]
    filters:
      county_census_dt.poverty_tier: High
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 60
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Top 10 Prescribing Specialties in Low-Income Counties
    name: Top 10 Prescribing Specialties in Low-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.specialty, rx_fact.count]
    filters:
      county_census_dt.income_tier: Low
    sorts: [rx_fact.count desc]
    limit: 10
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 60
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Top 10 Prescribing Specialties in High-Income Counties
    name: Top 10 Prescribing Specialties in High-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.specialty, rx_fact.count]
    filters:
      county_census_dt.income_tier: High
    sorts: [rx_fact.count desc]
    limit: 10
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 68
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: RTPB Adoption by Prescriber Decile and County Income Tier
    name: RTPB Adoption by Prescriber Decile and County Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [county_census_dt.income_tier, rx_fact.rtpb_adoption_rate, spi_roots.decile_routing]
    pivots: [county_census_dt.income_tier]
    sorts: [county_census_dt.income_tier, spi_roots.decile_routing]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 68
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: County Correlation - Provider Access vs Median Household Income
    name: County Correlation - Provider Access vs Median Household Income
    model: rx_data_google
    explore: spi_roots
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.average_median_income,
      spi_roots.number_of_doctors]
    sorts: [county_census_dt.average_median_income desc]
    limit: 500
    listen:
      Fulfillment Date: prescriptions.rx_date
      Patient State: spi_roots.state
      Patient County: spi_roots.county
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: prescriptions.therapeutic
      Targeted Disease: prescriptions.disease
      Brand Name: prescriptions.brand_name
      Prescriber Specialty: spi_roots.specialty
    row: 76
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: High-Volume Prescribers in Under-Served Counties (Low Income)
    name: High-Volume Prescribers in Under-Served Counties (Low Income)
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.primary_common_name, spi_roots.specialty, rx_fact.count, rx_fact.average_days_supply]
    filters:
      county_census_dt.income_tier: Low
    sorts: [rx_fact.count desc]
    limit: 15
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 76
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Active Providers in High-Poverty Counties
    name: Active Providers in High-Poverty Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [spi_roots.number_of_doctors]
    filters:
      county_census_dt.poverty_tier: High
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 84
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Prior Authorization (ePA) Activation Share in Low-Income Counties
    name: Prior Authorization (ePA) Activation Share in Low-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [rx_fact.count, spi_roots.is_epa_activated_current_jan]
    filters:
      county_census_dt.income_tier: Under 35k
    sorts: [rx_fact.count desc]
    limit: 5000
    column_limit: 50
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 84
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Geographical Heatmap - Long-Term Chronic Care Volume by State
    name: Geographical Heatmap - Long-Term Chronic Care Volume by State
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_google_map
    fields: [pharmacy.state, rx_fact.count]
    filters:
      rx_fact.days_supply_tier: ''
    sorts: [rx_fact.count desc]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    map: auto
    map_projection: ''
    quantize_colors: false
    defaults_version: 0
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 92
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Age Group Volume Distribution across County Income Tiers
    name: Age Group Volume Distribution across County Income Tiers
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, county_census_dt.income_tier, rx_fact.count]
    pivots: [county_census_dt.income_tier]
    sorts: [age_groups.age_group asc]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 92
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: Pharmacy Dispenser Class Share in High-Poverty Counties
    name: Pharmacy Dispenser Class Share in High-Poverty Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [pharmacy.dispenser_class, rx_fact.count]
    filters:
      county_census_dt.poverty_tier: High
    sorts: [rx_fact.count desc]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 100
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: RTPB Adoption by Patient Age Group and County Poverty Level
    name: RTPB Adoption by Patient Age Group and County Poverty Level
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, county_census_dt.poverty_tier, rx_fact.rtpb_adoption_rate]
    pivots: [county_census_dt.poverty_tier]
    sorts: [county_census_dt.poverty_tier, age_groups.age_group]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 100
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: State-by-State New Rx Start Rate by Income Tier
    name: State-by-State New Rx Start Rate by Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [pharmacy.state, county_census_dt.income_tier, rx_fact.new_rx_ratio]
    pivots: [county_census_dt.income_tier]
    sorts: [pharmacy.state asc]
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 108
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Vulnerable Regions Audit - High Poverty & High Volume of Prescriptions
    name: Vulnerable Regions Audit - High Poverty & High Volume of Prescriptions
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [county_census_dt.state, county_census_dt.clean_county_name, county_census_dt.poverty_rate,
      rx_fact.count]
    filters:
      rx_fact.days_supply_tier: ''
      county_census_dt.poverty_tier: ''
    sorts: [rx_fact.count desc, county_census_dt.poverty_rate desc]
    limit: 50
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    color_application:
      collection_id: sales-demo
      palette_id: sales-demo-categorical-0
      options:
        steps: 5
        reverse: false
    smoothedBars: false
    isStepped: false
    orientation: automatic
    labelPosition: left
    labelOverlap: false
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    hidden_pivots: {}
    bin_type: bins
    bin_style: simple_hist
    winsorization: false
    color_col: "#1A73E8"
    color_on_hover: "#338bff"
    x_axis_override: ''
    x_grids: true
    x_axis_title_font_size: 16
    x_axis_label_font_size: 12
    x_axis_label_angle: 0
    x_label_separation: 100
    y_axis_override: ''
    y_grids: true
    y_axis_title_font_size: 16
    y_axis_label_font_size: 12
    y_axis_label_angle: 0
    y_label_separation: 100
    x_axis_value_format: ''
    up_color: false
    down_color: false
    total_color: false
    show_value_labels: false
    show_x_axis_ticks: true
    show_x_axis_label: true
    x_axis_scale: auto
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_gridlines: true
    groupByMeasure: false
    hideTopHeaderRow: false
    hideDimensionHeader: false
    bodyStyle: "'Roboto', sans-serif;"
    headerColor: ["#ffffff", "#efefef", "#00363d", "#17494d", "#498283", "#bdd9d7",
      "#aecfc2", "#d1e8df", "#edf8f4", "#f5fcfc"]
    headerFontColor: "#212529"
    fixedHeight: false
    unsetTable: false
    stripe: false
    verticalStripe: false
    odd: ''
    weightHeader: '500'
    weightTable: '300'
    fontColor: "#212529"
    wrapText: false
    tableFontSize: 12px
    headFontSize: 14px
    headBorder: false
    color_with_children: "#36c1b3"
    color_empty: "#fff"
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 108
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - title: County Correlation - Population Size vs Average Days Supply
    name: County Correlation - Population Size vs Average Days Supply
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.total_population,
      rx_fact.average_days_supply]
    sorts: [county_census_dt.total_population desc]
    limit: 500
    listen:
      Fulfillment Date: dates.date_date
      Patient State: county_census_dt.state
      Patient County: county_census_dt.clean_county_name
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: age_groups.age_group
      Dispenser Class: pharmacy.dispenser_class
      Prescriber Specialty: spi_roots.specialty
    row: 116
    col: 0
    width: 24
    height: 8
    tab_name: ''
  filters:
  - name: Fulfillment Date
    title: Fulfillment Date
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: dates.date_date
  - name: Brand Name
    title: Brand Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: ndcs.brand_name
  - name: Patient State
    title: Patient State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: prescriptions.patient_state
  - name: Patient County
    title: Patient County
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: prescriptions.patient_county
  - name: County Income Tier
    title: County Income Tier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: county_census_dt.income_tier
  - name: County Poverty Tier
    title: County Poverty Tier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: county_census_dt.poverty_tier
  - name: Drug Class
    title: Drug Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: ndcs.therapeutic
  - name: Targeted Disease
    title: Targeted Disease
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: ndcs.disease
  - name: Days Supply
    title: Days Supply
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: popover
      options:
        min: 0
        max: 30
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: rx_fact.days_supply
  - name: Age Group
    title: Age Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: age_groups.age_group
  - name: Dispenser Class
    title: Dispenser Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: pharmacy.dispenser_class
  - name: Prescriber Specialty
    title: Prescriber Specialty
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: spi_roots.specialty
  - name: Medication Generic Name
    title: Medication Generic Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: ndcs.generic_name
