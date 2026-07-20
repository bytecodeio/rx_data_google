---
- dashboard: public_health__weatherrx_epidemiological_intelligence
  title: Public Health & Weather-Rx Epidemiological Intelligence
  description: Strategic public health dashboard correlating regional NOAA meteorological
    data with pharmaceutical dispensing patterns and socio-economic census factors.
  preferred_slug: TTYnEbJvNhUVkQ88kc5jjt
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - name: 'Tab 1: Regional Climate & Clinical Vulnerability Command'
    type: text
    title_text: 'Tab 1: Regional Climate & Clinical Vulnerability Command'
    subtitle_text: High-level overview mapping vulnerable populations, national prescription
      volume, and macro-climatic changes.
    row: 0
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Total Census Population
    name: Total Census Population
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [county_census_dt.total_population]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 4
    col: 0
    width: 18
    height: 8
    tab_name: ''
  - title: Total Prescriptions Filled
    name: Total Prescriptions Filled
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.number_of_prescriptions]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 4
    col: 18
    width: 18
    height: 8
    tab_name: ''
  - title: Total Prescribing Providers
    name: Total Prescribing Providers
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.number_of_providers]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 4
    col: 36
    width: 18
    height: 8
    tab_name: ''
  - title: ePA Activation Rate (MDs)
    name: ePA Activation Rate (MDs)
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [spi_roots.epa_activation_rate]
    filters:
      spi_roots.title: MD
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 4
    col: 54
    width: 18
    height: 8
    tab_name: ''
  - title: Prescription Volume by Patient State
    name: Prescription Volume by Patient State
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [prescriptions.patient_state, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 12
    col: 48
    width: 24
    height: 8
    tab_name: ''
  - title: Monthly Mean Temperature vs Prescription Volume
    name: Monthly Mean Temperature vs Prescription Volume
    model: rx_data_google
    explore: prescriptions
    type: looker_line
    fields: [weather_dt.weather_record_month, weather_dt.daily_temp, prescriptions.number_of_prescriptions]
    sorts: [weather_dt.weather_record_month desc]
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    y_axes: [{label: !!null '', orientation: left, series: [{axisId: prescriptions.number_of_prescriptions,
            id: prescriptions.number_of_prescriptions, name: Number of Prescriptions}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}, {label: '', orientation: right, series: [
          {axisId: weather_dt.daily_temp, id: weather_dt.daily_temp, name: Daily Median
              Temperature}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 12
    col: 24
    width: 24
    height: 10
    tab_name: ''
  - title: Rx Vol Share by Weather Severity
    name: Rx Vol Share by Weather Severity
    model: rx_data_google
    explore: prescriptions
    type: looker_pie
    fields: [weather_dt.weather_severity_category, prescriptions.number_of_prescriptions]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 20
    col: 48
    width: 24
    height: 13
    tab_name: ''
  - title: Average Median Income vs Prescription Volume
    name: Average Median Income vs Prescription Volume
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.average_median_income,
      prescriptions.number_of_prescriptions]
    filters:
      county_census_dt.clean_county_name: "-NULL"
    sorts: [county_census_dt.average_median_income desc 0]
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
    show_null_points: true
    hidden_fields: []
    y_axes: [{label: '', orientation: left, series: [{axisId: county_census_dt.average_median_income,
            id: county_census_dt.average_median_income, name: Average Median Income}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}, {label: !!null '', orientation: right, series: [
          {axisId: prescriptions.number_of_prescriptions, id: prescriptions.number_of_prescriptions,
            name: Number of Prescriptions}], showLabels: true, showValues: true, tickDensity: default,
        tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 22
    col: 24
    width: 24
    height: 11
    tab_name: ''
  - title: Social Vulnerability and Poverty Class Analysis
    name: Social Vulnerability and Poverty Class Analysis
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [county_census_dt.state, county_census_dt.clean_county_name, county_census_dt.poverty_tier,
      prescriptions.number_of_prescriptions, county_census_dt.total_population]
    filters:
      county_census_dt.clean_county_name: "-NULL"
    limit: 5000
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
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 12
    col: 0
    width: 24
    height: 21
    tab_name: ''
  - name: 'Tab 2: Epidemiological Weather-Rx Correlation & Adherence'
    type: text
    title_text: 'Tab 2: Epidemiological Weather-Rx Correlation & Adherence'
    subtitle_text: Deeper clinical look at temperature swings, precipitation peaks,
      and therapeutic responses.
    row: 33
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Average Days of Supply
    name: Average Days of Supply
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.avg_days_supply]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 37
    col: 0
    width: 18
    height: 8
    tab_name: ''
  - title: New Therapy (NBRx) Rate
    name: New Therapy (NBRx) Rate
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.new_rx_ratio]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 37
    col: 18
    width: 18
    height: 8
    tab_name: ''
  - title: New starts (NBRx) vs Total fills by Temp Tier
    name: New starts (NBRx) vs Total fills by Temp Tier
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [weather_dt.temperature_tier, prescriptions.number_of_new_prescriptions,
      prescriptions.number_of_prescriptions]
    sorts: [weather_dt.temperature_tier]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: NOT(is_null(${weather_dt.temperature_tier}))
      label: Test
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: test
      _type_hint: yesno
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
    hidden_points_if_no: [test]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 37
    col: 36
    width: 36
    height: 8
    tab_name: ''
  - title: Climate-Sensitive Disease Cohort Volumes
    name: Climate-Sensitive Disease Cohort Volumes
    model: rx_data_google
    explore: prescriptions
    type: looker_bar
    fields: [ndcs.weather_sensitive_disease_cohort, prescriptions.number_of_prescriptions]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 45
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Weekly Rain Levels vs Antihistamine Volume
    name: Weekly Rain Levels vs Antihistamine Volume
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [weather_dt.weather_record_week, weather_dt.total_precipitation, prescriptions.number_of_prescriptions]
    filters:
      ndcs.therapeutic: ANTIHISTAMINES FOR SYSTEMIC USE
      weather_dt.weather_record_week: NOT NULL
    sorts: [weather_dt.weather_record_week desc]
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
    hidden_fields: []
    y_axes: [{label: '', orientation: left, series: [{axisId: weather_dt.total_precipitation,
            id: weather_dt.total_precipitation, name: Total Precipitation}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: !!null '', orientation: right, series: [{axisId: prescriptions.number_of_prescriptions,
            id: prescriptions.number_of_prescriptions, name: Number of Prescriptions}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 45
    col: 24
    width: 24
    height: 8
    tab_name: ''
  - title: Median Snow Depth vs Asthma/COPD Medication Demand
    name: Median Snow Depth vs Asthma/COPD Medication Demand
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [weather_dt.weather_record_date, weather_dt.median_snow_depth, prescriptions.number_of_prescriptions]
    filters:
      ndcs.disease: "%ASTHMA%,%COPD%"
    sorts: [weather_dt.weather_record_date desc]
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
    show_null_points: true
    hidden_fields: []
    y_axes: [{label: '', orientation: left, series: [{axisId: weather_dt.median_snow_depth,
            id: weather_dt.median_snow_depth, name: Median Snow Depth}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: !!null '', orientation: right, series: [{axisId: prescriptions.number_of_prescriptions,
            id: prescriptions.number_of_prescriptions, name: Number of Prescriptions}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 45
    col: 48
    width: 24
    height: 8
    tab_name: ''
  - title: Prescription Vol PoP Change % vs Daily Mean Temp
    name: Prescription Vol PoP Change % vs Daily Mean Temp
    model: rx_data_google
    explore: prescriptions
    type: looker_line
    fields: [prescriptions.rx_month, prescriptions.prescriptions_pop_change_pct, weather_dt.daily_temp]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 53
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Patient Age Profiles across Temperature Tiers
    name: Patient Age Profiles across Temperature Tiers
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [prescriptions.age_group, weather_dt.temperature_tier, prescriptions.number_of_prescriptions]
    pivots: [prescriptions.age_group]
    sorts: [prescriptions.age_group, weather_dt.temperature_tier]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: NOT(is_null(${weather_dt.temperature_tier}))
      label: NullCat
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: nullcat
      _type_hint: yesno
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
    hidden_pivots: {}
    hidden_points_if_no: [nullcat]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 53
    col: 24
    width: 24
    height: 8
    tab_name: ''
  - title: 'Epidemiological Lag Matrix: Weekly Weather vs Acute Starts'
    name: 'Epidemiological Lag Matrix: Weekly Weather vs Acute Starts'
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [weather_dt.weather_record_week, weather_dt.weather_severity_category,
      prescriptions.number_of_new_prescriptions, weather_dt.rainy_days_count, weather_dt.snowy_days_count]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 53
    col: 48
    width: 24
    height: 8
    tab_name: ''
  - name: 'Tab 3: Public Health Resource & Pharmacy Dispensing Operations'
    type: text
    title_text: 'Tab 3: Public Health Resource & Pharmacy Dispensing Operations'
    subtitle_text: Operational footprint across regional physical pharmacies and dispensing
      structures.
    row: 61
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Operational Pharmacies
    name: Operational Pharmacies
    model: rx_data_google
    explore: pharmacy
    type: single_value
    fields: [pharmacy.number_of_pharmacies]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Prescription Date: prescriptions.rx_date
    row: 65
    col: 0
    width: 18
    height: 8
    tab_name: ''
  - title: F1 Avg Days Supply (First Period)
    name: F1 Avg Days Supply (First Period)
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.avg_days_supply_in_first_period]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 65
    col: 18
    width: 18
    height: 8
    tab_name: ''
  - title: Dispenser Classes in High Vulnerability Areas
    name: Dispenser Classes in High Vulnerability Areas
    model: rx_data_google
    explore: prescriptions
    type: looker_bar
    fields: [pharmacy.dispenser_class, prescriptions.number_of_prescriptions]
    filters:
      county_census_dt.geographic_vulnerability_index: High Social & Mobility Vulnerability
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 65
    col: 36
    width: 36
    height: 8
    tab_name: ''
  - title: Pharmacy Vol Summary by City and Month
    name: Pharmacy Vol Summary by City and Month
    model: rx_data_google
    explore: pharmacy
    type: looker_grid
    fields: [pharmacy.city, prescriptions.rx_month, prescriptions.number_of_prescriptions]
    pivots: [prescriptions.rx_month]
    fill_fields: [prescriptions.rx_month]
    filters:
      pharmacy.state: NY
    sorts: [prescriptions.rx_month desc, prescriptions.number_of_prescriptions desc
        0]
    limit: 5000
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels: {}
    series_cell_visualizations:
      prescriptions.number_of_prescriptions:
        is_active: false
    table_show_footer: false
    table_enable_pagination: false
    table_page_size_options: 20, 50, 100
    table_column_hover_highlight_enable: false
    table_show_headers: true
    header_font_bold: false
    header_font_italic: false
    cell_font_weight: ''
    cell_font_style: ''
    cell_text_alignment: ''
    table_custom_border_enable: false
    table_custom_border_width:
    table_custom_border_style: solid
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
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    hidden_pivots: {}
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Prescription Date: prescriptions.rx_date
    row: 73
    col: 24
    width: 24
    height: 8
    tab_name: ''
  - title: Severe Weather Impact on Dispensing Channels
    name: Severe Weather Impact on Dispensing Channels
    model: rx_data_google
    explore: prescriptions
    type: looker_line
    fields: [weather_dt.weather_record_week, pharmacy.dispenser_class, prescriptions.number_of_prescriptions]
    filters:
      weather_dt.weather_severity_category: "-Clear/No Severe Weather Recorded"
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 73
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Cold/Flu Active Ingredients Volume Mix
    name: Cold/Flu Active Ingredients Volume Mix
    model: rx_data_google
    explore: ndcs
    type: looker_grid
    fields: [ndcs.generic_name, prescriptions.number_of_prescriptions]
    filters:
      ndcs.therapeutic: COUGH AND COLD PREPARATIONS
    sorts: [prescriptions.number_of_prescriptions desc 0]
    limit: 5000
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
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Patient Age Group: prescriptions.age_group
      Is Primary Care Provider: prescriptions.primary_care
      Prescription Date: prescriptions.rx_date
    row: 81
    col: 0
    width: 35
    height: 8
    tab_name: ''
  - title: 50 Nearest Weather Station Distance vs Local Dispensing Volume
    name: 50 Nearest Weather Station Distance vs Local Dispensing Volume
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [station_mapping_dt.station_name, station_mapping_dt.avg_distance, prescriptions.number_of_prescriptions]
    sorts: [station_mapping_dt.avg_distance desc 0]
    limit: 50
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
    hidden_fields: []
    y_axes: [{label: '', orientation: left, series: [{axisId: station_mapping_dt.avg_distance,
            id: station_mapping_dt.avg_distance, name: Average Distance}], showLabels: true,
        showValues: true, tickDensity: default, tickDensityCustom: 5, type: linear,
        unpinAxis: false}, {label: !!null '', orientation: right, series: [{axisId: prescriptions.number_of_prescriptions,
            id: prescriptions.number_of_prescriptions, name: Number of Prescriptions}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    cluster_points: false
    quadrants_enabled: false
    quadrant_properties:
      '0':
        color: ''
        label: Quadrant 1
      '1':
        color: ''
        label: Quadrant 2
      '2':
        color: ''
        label: Quadrant 3
      '3':
        color: ''
        label: Quadrant 4
    custom_quadrant_point_x: 5
    custom_quadrant_point_y: 5
    custom_x_column: ''
    custom_y_column: ''
    custom_value_label_column: ''
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 73
    col: 48
    width: 24
    height: 8
    tab_name: ''
  - title: 'Dispensing Warnings: Heavy Storm & Foot-Traffic Alert Log'
    name: 'Dispensing Warnings: Heavy Storm & Foot-Traffic Alert Log'
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [pharmacy.ncpdpid, pharmacy.city, pharmacy.state, weather_dt.weather_severity_category,
      prescriptions.number_of_prescriptions, weather_dt.total_precipitation]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 81
    col: 35
    width: 36
    height: 8
    tab_name: ''
  - title: Refill Ratios (New Rx Rate) by Pharmacy ZIP
    name: Refill Ratios (New Rx Rate) by Pharmacy ZIP
    model: rx_data_google
    explore: pharmacy
    type: looker_google_map
    fields: [pharmacy.zip, prescriptions.new_rx_ratio]
    filters:
      pharmacy.state: ''
    sorts: [prescriptions.new_rx_ratio desc 0]
    limit: 5000
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
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Prescription Date: prescriptions.rx_date
    row: 89
    col: 0
    width: 72
    height: 18
    tab_name: ''
  - name: 'Tab 4: Clinician Behavior & Socio-Economic Census Analytics'
    type: text
    title_text: 'Tab 4: Clinician Behavior & Socio-Economic Census Analytics'
    subtitle_text: Deep epidemiological drill-down into medical provider patterns
      and regional demographic constraints.
    row: 107
    col: 0
    width: 72
    height: 4
    tab_name: ''
  - title: Total Licensed Clinical Providers
    name: Total Licensed Clinical Providers
    model: rx_data_google
    explore: spi_roots
    type: single_value
    fields: [spi_roots.number_of_doctors]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 111
    col: 0
    width: 24
    height: 8
    tab_name: ''
  - title: Physician ePA Activation Rate
    name: Physician ePA Activation Rate
    model: rx_data_google
    explore: spi_roots
    type: single_value
    fields: [spi_roots.epa_activation_rate]
    filters:
      spi_roots.state: ''
      spi_roots.is_physician: PHYSICIAN
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 111
    col: 24
    width: 24
    height: 8
    tab_name: ''
  - title: Evolution from Student to Physician Specialty Mix
    name: Evolution from Student to Physician Specialty Mix
    model: rx_data_google
    explore: spi_roots
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [spi_roots.specialty_cm_1, spi_roots.specialty_cy, spi_roots.number_of_doctors]
    filters:
      spi_roots.state: NY
      spi_roots.specialty_cm_1: STUDENT IN AN ORGANIZED HEALTH CARE EDUCATION/TRAINING
        PROGRAM
    sorts: [specialization_change desc]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: "${spi_roots.specialty_cm_1} != ${spi_roots.specialty_cy}"
      label: Specialization Change
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: specialization_change
      _type_hint: yesno
    hidden_fields: []
    hidden_points_if_no: [specialization_change]
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
    show_null_points: true
    interpolation: linear
    defaults_version: 0
    hidden_pivots: {}
    color_range: ["#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3", "#36c1b3",
      "#b57052", "#ed69af"]
    label_type: name
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 135
    col: 1
    width: 71
    height: 24
    tab_name: ''
  - title: Household Income vs Practicing Doctor Density
    name: Household Income vs Practicing Doctor Density
    model: rx_data_google
    explore: spi_roots
    type: looker_scatter
    fields: [spi_roots.city, spi_roots.spiroot_zip_income_per_household, spi_roots.number_of_doctors]
    filters:
      spi_roots.state: NY
      spi_roots.spiroot_zip_income_per_household: NOT NULL
    sorts: [spi_roots.number_of_doctors desc 0]
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
    show_null_points: true
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 119
    col: 24
    width: 24
    height: 8
    tab_name: ''
  - title: RTPB Benefit Tier Volume by Income Tier
    name: RTPB Benefit Tier Volume by Income Tier
    model: rx_data_google
    explore: spi_roots
    type: looker_column
    fields: [spi_roots.decile_rtpb, county_census_dt.income_tier, spi_roots.number_of_doctors]
    pivots: [spi_roots.decile_rtpb]
    fill_fields: [county_census_dt.income_tier]
    filters:
      spi_roots.state: NY
    sorts: [spi_roots.decile_rtpb, county_census_dt.income_tier]
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
    hidden_pivots: {}
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 119
    col: 48
    width: 24
    height: 8
    tab_name: ''
  - title: Provider Clinical Credentials Mix (Title CY)
    name: Provider Clinical Credentials Mix (Title CY)
    model: rx_data_google
    explore: spi_roots
    type: looker_pie
    fields: [spi_roots.title_cy, spi_roots.number_of_doctors]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 119
    col: 0
    width: 24
    height: 16
    tab_name: ''
  - title: 'Epidemiological Alert: Social & Mobility Adherence Risk by County'
    name: 'Epidemiological Alert: Social & Mobility Adherence Risk by County'
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [county_census_dt.state, county_census_dt.clean_county_name, county_census_dt.geographic_vulnerability_index,
      county_census_dt.average_poverty_rate, county_census_dt.total_households_no_cars,
      prescriptions.avg_days_supply]
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 127
    col: 24
    width: 48
    height: 8
    tab_name: ''
  - title: Primary Care (PCP) vs Specialist Climate-Sensitive Fills
    name: Primary Care (PCP) vs Specialist Climate-Sensitive Fills
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [prescriptions.primary_care, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc 0]
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
    hidden_fields: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      prescriptions.number_of_prescriptions: "#ffd166"
    defaults_version: 1
    listen:
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      Therapeutic Class: ndcs.therapeutic
      Disease Target: ndcs.disease
      Weather Severity Category: weather_dt.weather_severity_category
      Temperature Tier: weather_dt.temperature_tier
      Was Precipitation Reported: weather_dt.was_precipitation_reported
      Patient Age Group: prescriptions.age_group
      Poverty Tier: county_census_dt.poverty_tier
      Pharmacy Dispenser Class: pharmacy.dispenser_class
      Pharmacy State: pharmacy.selected_state_filter
      Is Primary Care Provider: prescriptions.primary_care
      Geo Vulnerability Index: county_census_dt.geographic_vulnerability_index
      Prescription Date: prescriptions.rx_date
    row: 111
    col: 48
    width: 24
    height: 8
    tab_name: ''
  filters:
  - name: Prescription Date
    title: Prescription Date
    type: date_filter
    default_value: this year to second
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
  - name: Patient State
    title: Patient State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
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
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: prescriptions.patient_county
  - name: Therapeutic Class
    title: Therapeutic Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: ndcs.therapeutic
  - name: Disease Target
    title: Disease Target
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: ndcs.disease
  - name: Weather Severity Category
    title: Weather Severity Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: weather_dt.weather_severity_category
  - name: Temperature Tier
    title: Temperature Tier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: weather_dt.temperature_tier
  - name: Was Precipitation Reported
    title: Was Precipitation Reported
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: weather_dt.was_precipitation_reported
  - name: Patient Age Group
    title: Patient Age Group
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: prescriptions.age_group
  - name: Poverty Tier
    title: Poverty Tier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: county_census_dt.poverty_tier
  - name: Pharmacy Dispenser Class
    title: Pharmacy Dispenser Class
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: pharmacy.dispenser_class
  - name: Pharmacy State
    title: Pharmacy State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: pharmacy
    listens_to_filters: []
    field: pharmacy.selected_state_filter
  - name: Is Primary Care Provider
    title: Is Primary Care Provider
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: prescriptions.primary_care
  - name: Geo Vulnerability Index
    title: Geo Vulnerability Index
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: county_census_dt.geographic_vulnerability_index
