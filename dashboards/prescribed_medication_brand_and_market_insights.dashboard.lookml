---
- dashboard: prescribed_medication_brand_performance_and_market_access_insights
  title: Prescribed Medication Brand Performance and Market Access Insights
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: This dashboard provides a comprehensive view of prescription transaction
    performance, brand utilization, and market access metrics like Real-Time Prescription
    Benefit (RTPB) adoption. It enables deep-dive analytics to help align and optimize
    strategies.
  preferred_slug: Zy1gbDRj1Zd8Q4AImOXMmV
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: KPIs
    label: KPIs
  - name: Account & Prescriber Performance
    label: Account & Prescriber Performance
  - name: Pharmacy & Patient Demographics
    label: Pharmacy & Patient Demographics
  - name: Medications
    label: Medications
  - name: Detailed Tables
    label: Detailed Tables
  elements:
  - title: RTPB Adoption Rate
    name: RTPB Adoption Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.rtpb_adoption_rate]
    x: 8
    "y": 0
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 36
    width: 18
    height: 4
    tab_name: KPIs
  - title: Average Days Supply
    name: Average Days Supply
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.average_days_supply]
    x: 12
    "y": 0
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 54
    width: 18
    height: 4
    tab_name: KPIs
  - title: Monthly Volume Trend
    name: Monthly Volume Trend
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [rx_fact.count, dates.date_month_name, dates.date_year]
    pivots: [dates.date_year]
    fill_fields: [dates.date_year]
    sorts: [dates.date_year, dates.date_month_name]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: true,
        valueFormat: ''}]
    x_axis_zoom: true
    y_axis_zoom: true
    x_axis_datetime_label: "%b %y"
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000"}]
    show_dropoff: false
    x: 0
    "y": 28
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
    row: 4
    col: 36
    width: 36
    height: 16
    tab_name: KPIs
  - title: Monthly New Rx Rate Trend
    name: Monthly New Rx Rate Trend
    model: rx_data_google
    explore: rx_normalized_analytics
    type: marketplace_viz_calendar_heatmap::calendar_heatmap-marketplace
    fields: [dates.date_month, rx_fact.new_rx_ratio]
    sorts: [dates.date_month desc]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    color_picker: ["#7FCDAE", "#7ED09C", "#7DD389", "#85D67C", "#9AD97B", "#B1DB7A",
      "#CADF79", "#E2DF78", "#E5C877", "#E7AF75", "#EB9474", "#EE7772"]
    formatting_override: ''
    rounded: false
    outline: month
    label_year: 'true'
    label_month: 'false'
    viz_show_legend: 'true'
    focus_tooltip: 'true'
    outline_weight: 1
    cell_color: "#fff"
    outline_color: "#000"
    cell_reducer: 1
    axis_label_color: "#282828"
    x: 12
    "y": 28
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
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
    row: 20
    col: 36
    width: 36
    height: 20
    tab_name: KPIs
  - title: New Prescriptions
    name: New Prescriptions
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.number_of_new_prescriptions]
    limit: 5000
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: progress
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    smart_single_value_size: true
    comparison_label: New Prescriptions Compared to Previous Year
    x: 0
    "y": 44
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 0
    width: 18
    height: 4
    tab_name: KPIs
  - title: RTPB Check Volume
    name: RTPB Check Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    filters:
      rx_fact.rtpb: ">0"
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
    x: 12
    "y": 44
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 18
    width: 18
    height: 4
    tab_name: KPIs
  - title: Volume Distribution by Day of Week
    name: Volume Distribution by Day of Week
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [dates.date_day_of_week, rx_fact.count, dates.date_year]
    pivots: [dates.date_year]
    fill_fields: [dates.date_year]
    sorts: [dates.date_year, dates.date_day_of_week]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    x: 0
    "y": 72
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
    row: 20
    col: 0
    width: 36
    height: 20
    tab_name: KPIs
  - title: 180 Day Volume Lookback
    name: 180 Day Volume Lookback
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [rx_fact.count, dates.date_date, rx_fact.new_rx]
    pivots: [rx_fact.new_rx]
    sorts: [rx_fact.new_rx, dates.date_date desc]
    limit: 180
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: false
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: rx_fact.count, id: 1
              - rx_fact.count, name: '1'}, {axisId: rx_fact.count, id: 2 - rx_fact.count,
            name: '2'}, {axisId: rx_fact.count, id: 3 - rx_fact.count, name: '3'}],
        showLabels: false, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: true}]
    x_axis_zoom: true
    y_axis_zoom: true
    font_size: '12'
    series_labels: {}
    advanced_vis_config: |-
      {
        "legend": {
          "title": {
            "text": "New Prescription Status"
          }
        },
        "series": []
      }
    x: 12
    "y": 72
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
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
    groupBars: true
    labelSize: 10pt
    showLegend: true
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    stroke: ["#353b49"]
    strokeWidth: 3
    headerFontSize: 32
    comparisonFontSize: 18
    precision: 2
    units: ''
    hidden_pivots: {}
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
    row: 4
    col: 0
    width: 36
    height: 16
    tab_name: KPIs
  - title: Accounts
    name: Accounts
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [accounts.count]
    x: 16
    "y": 0
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 0
    width: 6
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Top 10 Vendors
    name: Top 10 Vendors
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [accounts.vendor_name, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 10
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x: 8
    "y": 4
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 14
    col: 6
    width: 30
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Top 10 Accounts
    name: Top 10 Accounts
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [accounts.rollup_name, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    x: 16
    "y": 4
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 6
    width: 30
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Top 10 Prescribers
    name: Top 10 Prescribers
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.primary_common_name, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Rx Fact Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    x: 12
    "y": 36
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 32
    col: 6
    width: 30
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Specialty Quadrants - Avg Days Supply vs Rx Volume
    name: Specialty Quadrants - Avg Days Supply vs Rx Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_scatter
    fields: [spi_roots.specialty, rx_fact.average_days_supply, rx_fact.count]
    sorts: [rx_fact.average_days_supply desc 0]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: rx_fact.average_days_supply,
            id: rx_fact.average_days_supply, name: Rx Fact Average Days Supply}],
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}, {label: !!null '', orientation: right, series: [
          {axisId: rx_fact.count, id: rx_fact.count, name: Rx Fact Prescription Transaction
              Count}], showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false}]
    size_by_field: ''
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      rx_fact.count: "#06d6a0"
    series_labels:
      rx_fact.average_days_supply: Avg Days Supply
      rx_fact.count: RX Transaction Count
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
    x: 12
    "y": 64
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 60
    col: 0
    width: 72
    height: 20
    tab_name: Account & Prescriber Performance
  - name: " (Copy 3)"
    type: text
    title_text: " (Copy 3)"
    body_text: '[{"type":"h1","children":[{"text":"Prescribers"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 28
    col: 0
    width: 72
    height: 4
    tab_name: Account & Prescriber Performance
  - title: Prescribers
    name: Prescribers
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [spi_roots.number_of_doctors]
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
    x: 18
    "y": 44
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 32
    col: 0
    width: 6
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Top 10 Specialties
    name: Top 10 Specialties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [rx_fact.count, spi_roots.specialty]
    filters:
      spi_roots.specialty: ''
    sorts: [rx_fact.count desc 0]
    limit: 10
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Rx Fact Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    x: 12
    "y": 36
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 46
    col: 6
    width: 30
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Bottom 10 Accounts
    name: Bottom 10 Accounts
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [accounts.rollup_name, rx_fact.count]
    sorts: [rx_fact.count]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      rx_fact.count: "#f78c6b"
    x: 16
    "y": 4
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 36
    width: 36
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Bottom 10 Vendors
    name: Bottom 10 Vendors
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [accounts.vendor_name, rx_fact.count]
    sorts: [rx_fact.count]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      rx_fact.count: "#f78c6b"
    value_labels: legend
    label_type: labPer
    x: 8
    "y": 4
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 14
    col: 36
    width: 36
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Vendors
    name: Vendors
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [count_of_vendor_name]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: accounts.vendor_name
      expression: ''
      label: Count of Vendor Name
      measure: count_of_vendor_name
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x: 16
    "y": 0
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 14
    col: 0
    width: 6
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Specialties
    name: Specialties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [count_of_specialty]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: spi_roots.specialty
      expression: ''
      label: Count of Specialty
      measure: count_of_specialty
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x: 18
    "y": 44
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 46
    col: 0
    width: 6
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Botton 10 Prescribers
    name: Botton 10 Prescribers
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.primary_common_name, rx_fact.count]
    sorts: [rx_fact.count]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Rx Fact Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      rx_fact.count: "#f78c6b"
    series_labels: {}
    x: 12
    "y": 36
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 32
    col: 36
    width: 36
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Bottom 10 Specialties
    name: Bottom 10 Specialties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [rx_fact.count, spi_roots.specialty]
    filters:
      spi_roots.specialty: ''
    sorts: [rx_fact.count]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Rx Fact Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      rx_fact.count: "#f78c6b"
    series_labels: {}
    x: 12
    "y": 36
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 46
    col: 36
    width: 36
    height: 14
    tab_name: Account & Prescriber Performance
  - title: Geographic Volume Heatmap
    name: Geographic Volume Heatmap
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_geo_choropleth
    fields: [pharmacy.state, rx_fact.count]
    x: 0
    "y": 12
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 20
    col: 0
    width: 36
    height: 16
    tab_name: Pharmacy & Patient Demographics
  - title: Volume by Dispenser Class
    name: Volume by Dispenser Class
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_boxplot
    fields: [pharmacy.dispenser_class, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 5000
    column_limit: 50
    total: true
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      args:
      - rx_fact.count
      based_on: rx_fact.count
      calculation_type: percent_of_column_sum
      category: table_calculation
      label: Percent of Rx Fact Prescription Transaction Count
      source_field: rx_fact.count
      table_calculation: percent_of_rx_fact_prescription_transaction_count
      value_format:
      value_format_name: percent_0
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
    x_axis_zoom: true
    y_axis_zoom: true
    textTitle: CHAIN,INDEPENDENT,MEDICAL DEVICE MANUFACTURER,GOVERNMENT/FEDERAL,FRANCHISE
    backgroundViz: ["#06f", "#00363d", "#17494d", "#498283", "#bdd9d7", "#aecfc2",
      "#d1e8df", "#edf8f4", "#f5fcfc"]
    color_title: ["#fff", "#06f", "#00363d", "#17494d", "#498283", "#bdd9d7", "#aecfc2",
      "#d1e8df", "#edf8f4", "#f5fcfc"]
    titleColor: "#fff"
    writeTitle: ''
    fontColor: "#000"
    topFont: 19px
    bottomFont: 24px
    fixedHeight: false
    hidePag: false
    unsetTable: true
    removeScroll: false
    border: false
    bodyStyle: "'Roboto', sans-serif;"
    hideTitle: false
    columnsToHide: ''
    bin_type: steps
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
    x: 8
    "y": 12
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    color_range: ["#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3", "#36c1b3",
      "#b57052", "#ed69af"]
    show_null_points: true
    font_size: large
    titleText: Dead Stage
    titleFontSize: 20px
    legendDotSize: 16px
    legendFontSize: 16px
    legendNumberFontSize: 16px
    legendDotRightMargin: 10px
    legendLabelMarginBottom: ".5em"
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 20
    col: 36
    width: 36
    height: 16
    tab_name: Pharmacy & Patient Demographics
  - title: Volume by Dispenser Type
    name: Volume by Dispenser Type
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [pharmacy.dispenser_type, rx_fact.count, pharmacy.dispenser_class]
    pivots: [pharmacy.dispenser_class]
    sorts: [pharmacy.dispenser_class, rx_fact.count desc 5]
    limit: 5000
    column_limit: 50
    row_total: right
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
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
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: true,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    show_null_points: true
    interpolation: linear
    x: 16
    "y": 12
    defaults_version: 1
    value_labels: legend
    label_type: labPer
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
    hidden_pivots:
      "$$$_row_total_$$$":
        is_entire_pivot_hidden: true
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 36
    col: 0
    width: 72
    height: 16
    tab_name: Pharmacy & Patient Demographics
  - title: Patient Volume by Age Group
    name: Patient Volume by Age Group
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, rx_fact.count]
    sorts: [age_groups.age_group]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    x: 8
    "y": 20
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 56
    col: 0
    width: 36
    height: 16
    tab_name: Pharmacy & Patient Demographics
  - title: RTPB Adoption Rate by Age Group
    name: RTPB Adoption Rate by Age Group
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, rx_fact.rtpb_adoption_rate]
    sorts: [age_groups.age_group]
    limit: 5000
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: rx_fact.rtpb_adoption_rate,
            id: rx_fact.rtpb_adoption_rate, name: Rx Fact RTPB Adoption Rate}], showLabels: false,
        showValues: false, tickDensity: custom, tickDensityCustom: 5, type: linear,
        unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      rx_fact.rtpb_adoption_rate: "#06d6a0"
    series_labels: {}
    x: 16
    "y": 20
    bar_arm_length: 9
    bar_arm_weight: 48
    bar_spinner_length: 121
    bar_spinner_weight: 25
    bar_style: vertical
    bar_range_min: 0
    bar_range_max: 100.701
    bar_value_label_type: both
    bar_value_label_font: 8
    bar_value_label_padding: 45
    bar_target_source: 'off'
    bar_target_label_type: none
    bar_target_label_font: 3
    bar_label_font_size: 3
    bar_fill_color: "#0092E5"
    bar_background_color: "#CECECE"
    bar_spinner_color: "#282828"
    bar_range_color: "#282828"
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
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
    show_null_points: true
    interpolation: linear
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    smoothedBars: false
    orientation: automatic
    labelPosition: left
    percentType: total
    percentPosition: inline
    valuePosition: right
    labelColorEnabled: false
    labelColor: "#FFF"
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 56
    col: 36
    width: 36
    height: 16
    tab_name: Pharmacy & Patient Demographics
  - title: Total Dispatch Pharmacies
    name: Total Dispatch Pharmacies
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [pharmacy.number_of_pharmacies]
    x: 18
    "y": 44
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 4
    col: 0
    width: 36
    height: 4
    tab_name: Pharmacy & Patient Demographics
  - title: Top 10 Pharmacy Cities
    name: Top 10 Pharmacy Cities
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [pharmacy.city, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Rx Fact Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    series_labels: {}
    hidden_fields: []
    hidden_points_if_no: []
    x: 0
    "y": 80
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 8
    col: 0
    width: 36
    height: 12
    tab_name: Pharmacy & Patient Demographics
  - title: National Market Scale
    name: National Market Scale
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_google_map
    fields: [pharmacy.selected_state_value, rx_fact.zipcode, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    x: 12
    "y": 80
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
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 4
    col: 36
    width: 36
    height: 16
    tab_name: Pharmacy & Patient Demographics
  - name: " (Copy 2)"
    type: text
    title_text: " (Copy 2)"
    body_text: '[{"type":"h1","children":[{"text":"Pharmacy Demographics"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 0
    col: 0
    width: 72
    height: 4
    tab_name: Pharmacy & Patient Demographics
  - name: ''
    type: text
    title_text: ''
    body_text: '[{"type":"h1","children":[{"text":"Patient Demographics"}],"align":"center"}]'
    rich_content_json: '{"format":"slate"}'
    row: 52
    col: 0
    width: 72
    height: 4
    tab_name: Pharmacy & Patient Demographics
  - title: Medications
    name: Medications
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [ndcs.number_of_medications]
    x: 20
    "y": 0
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 0
    width: 18
    height: 4
    tab_name: Medications
  - title: Rx Flow - Therapeutic Class to State
    name: Rx Flow - Therapeutic Class to State
    model: rx_data_google
    explore: rx_normalized_analytics
    type: marketplace_viz_sankey::sankey-marketplace
    fields: [ndcs.therapeutic, pharmacy.city, rx_fact.count]
    sorts: [rx_fact.count desc]
    limit: 50
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    x: 0
    "y": 4
    defaults_version: 0
    color_range: ["#dd3333", "#80ce5d", "#f78131", "#369dc1", "#c572d3", "#36c1b3",
      "#b57052", "#ed69af"]
    label_type: name
    show_null_points: true
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 56
    col: 0
    width: 72
    height: 16
    tab_name: Medications
  - title: Days Supply Tier Distribution
    name: Days Supply Tier Distribution
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [rx_fact.days_supply_tier, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 5000
    column_limit: 50
    value_labels: legend
    label_type: labPer
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
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
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: row
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    font_size: 12
    point_style: none
    series_labels: {}
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    x: 0
    "y": 20
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
    hidden_fields: []
    hidden_points_if_no: []
    defaults_version: 1
    show_null_points: true
    interpolation: linear
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
    color_range: ["#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd", "#8c564b",
      "#e377c2", "#7f7f7f", "#bcbd22", "#17becf"]
    circle_radius: 5
    link_color: "#000000"
    linkDistance: 30
    edge_weight: sqrt
    font_color: "#000000"
    labels: all
    labelTypes: ''
    font_weight: normal
    highlight_selection: true
    tooltip: true
    tooltipFont: '11'
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 36
    col: 36
    width: 36
    height: 20
    tab_name: Medications
  - title: High-Utilization NDCs
    name: High-Utilization NDCs
    model: rx_data_google
    explore: rx_normalized_analytics
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [ndcs.brand_name, ndcs.generic_name, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    x: 0
    "y": 36
    defaults_version: 0
    theme: traditional
    customTheme: ''
    layout: fixed
    minWidthForIndexColumns: true
    headerFontSize: 12
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    rowSubtotals: false
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: pivots
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    columnOrder: {}
    label|ndcs.brand_name: Brand Name
    heading|ndcs.brand_name: ''
    hide|ndcs.brand_name: false
    label|ndcs.generic_name: Generic Name
    heading|ndcs.generic_name: ''
    hide|ndcs.generic_name: false
    subtotalDepth: '1'
    label|rx_fact.count: Prescription Transaction Count
    heading|rx_fact.count: ''
    style|rx_fact.count: normal
    reportIn|rx_fact.count: '1'
    unit|rx_fact.count: ''
    comparison|rx_fact.count: no_variance
    switch|rx_fact.count: false
    var_num|rx_fact.count: true
    var_pct|rx_fact.count: false
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 20
    col: 36
    width: 36
    height: 16
    tab_name: Medications
  - title: Top 10 Therapeutic Classes
    name: Top 10 Therapeutic Classes
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.therapeutic, rx_fact.count]
    filters:
      ndcs.therapeutic: "-N/A"
    sorts: [rx_fact.count desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    x: 0
    "y": 48
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 4
    col: 36
    width: 36
    height: 16
    tab_name: Medications
  - title: Top 20 Targeted Diseases
    name: Top 20 Targeted Diseases
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, rx_fact.count]
    sorts: [rx_fact.count desc 0]
    limit: 20
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    x: 12
    "y": 48
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 20
    col: 0
    width: 36
    height: 16
    tab_name: Medications
  - title: Prescribing Volume by Specialty
    name: Prescribing Volume by Specialty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: custom-vis-chart-blue::custom-vis-chart-blue
    fields: [spi_roots.specialty, rx_fact.count]
    x: 0
    "y": 64
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 36
    col: 0
    width: 36
    height: 20
    tab_name: Medications
  - title: Therapeutic Classes
    name: Therapeutic Classes
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [count_of_therapeutic_class]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: ndcs.therapeutic
      expression: ''
      label: Count of Therapeutic Class
      measure: count_of_therapeutic_class
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x: 20
    "y": 0
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 36
    width: 18
    height: 4
    tab_name: Medications
  - title: Diseases
    name: Diseases
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [count_of_disease_target]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: ndcs.therapeutic
      expression: ''
      label: Count of Therapeutic Class
      measure: count_of_therapeutic_class
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: ndcs.disease
      expression: ''
      label: Count of Disease Target
      measure: count_of_disease_target
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x: 20
    "y": 0
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 54
    width: 18
    height: 4
    tab_name: Medications
  - title: Top 10 Brands
    name: Top 10 Brands
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [rx_fact.count, ndcs.brand_name]
    sorts: [rx_fact.count desc 0]
    limit: 10
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: bottom, series: [{axisId: rx_fact.count, id: rx_fact.count,
            name: Prescription Transaction Count}], showLabels: false, showValues: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, unpinAxis: false}]
    x_axis_zoom: true
    y_axis_zoom: true
    x: 0
    "y": 48
    defaults_version: 1
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 4
    col: 0
    width: 36
    height: 16
    tab_name: Medications
  - title: Brands
    name: Brands
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [count_of_brand_name]
    limit: 5000
    column_limit: 50
    dynamic_fields:
    - _kind_hint: measure
      _type_hint: number
      based_on: ndcs.therapeutic
      expression: ''
      label: Count of Therapeutic Class
      measure: count_of_therapeutic_class
      type: count_distinct
    - _kind_hint: measure
      _type_hint: number
      based_on: ndcs.brand_name
      expression: ''
      label: Count of Brand Name
      measure: count_of_brand_name
      type: count_distinct
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x: 20
    "y": 0
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 18
    width: 18
    height: 4
    tab_name: Medications
  - title: Top Providers by RTPB Adoption
    name: Top Providers by RTPB Adoption
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.spi_root, spi_roots.primary_common_name, rx_fact.rtpb_adoption_rate]
    sorts: [rx_fact.rtpb_adoption_rate desc 0]
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
    series_cell_visualizations:
      rx_fact.rtpb_adoption_rate:
        is_active: false
        palette:
          palette_id: sales-demo-sequential-0
          collection_id: sales-demo
        value_display: true
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
    x: 0
    "y": 88
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 0
    width: 36
    height: 16
    tab_name: Detailed Tables
  - title: Top Providers by Avg Days Supply
    name: Top Providers by Avg Days Supply
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.spi_root, spi_roots.primary_common_name, rx_fact.average_days_supply]
    x: 12
    "y": 88
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 0
    col: 36
    width: 36
    height: 16
    tab_name: Detailed Tables
  - title: Payer NDC Transaction Audit
    name: Payer NDC Transaction Audit
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [accounts.account_name, ndcs.brand_name, rx_fact.count, rx_fact.rtpb_adoption_rate]
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
    x: 0
    "y": 96
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 16
    col: 0
    width: 72
    height: 24
    tab_name: Detailed Tables
  - title: Prescriber to Pharmacy Linkage Audit
    name: Prescriber to Pharmacy Linkage Audit
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.primary_common_name, pharmacy.ncpdpid, rx_fact.count, rx_fact.average_days_supply]
    x: 0
    "y": 108
    listen:
      Days Supply: rx_fact.days_supply
      Dispenser Type: pharmacy.dispenser_type
      Account Name: accounts.account_name
      Vendor Rollup Name: accounts.rollup_name
      Vendor Name: accounts.vendor_name
      Drug Class: ndcs.therapeutic
      Age Group: age_groups.age_group
      Brand Name: ndcs.brand_name
      Medication Generic Name: ndcs.generic_name
      Pharmacy State: pharmacy.state
      Fulfillment Date: dates.date_date
    row: 40
    col: 0
    width: 72
    height: 24
    tab_name: Detailed Tables
  filters:
  - name: Pharmacy State
    title: Pharmacy State
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
    field: pharmacy.selected_state_filter
  - name: Fulfillment Date
    title: Fulfillment Date
    type: field_filter
    default_value: 1 year
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
  - name: Dispenser Type
    title: Dispenser Type
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
    field: pharmacy.dispenser_type
  - name: Vendor Name
    title: Vendor Name
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
    field: accounts.vendor_name
  - name: Account Name
    title: Account Name
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
    field: accounts.account_name
  - name: Vendor Rollup Name
    title: Vendor Rollup Name
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
    field: accounts.rollup_name
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
