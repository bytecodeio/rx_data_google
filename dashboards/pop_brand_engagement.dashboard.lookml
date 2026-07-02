---
- dashboard: brand_performance_pop_udd
  title: Brand Performance PoP UDD
  preferred_viewer: dashboards-next
  description: Executive Marketing Dashboard displaying native PoP metrics across
    patient journeys and provider targeting explores
  preferred_slug: Dk5Ocsv8ZlYwI5mKhlomaN
  theme_name: ''
  embed_style:
    background_color: "#f8f9fa"
    show_title: true
    title_color: "#1f2937"
    show_filters_bar: true
    tile_text_color: "#374151"
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - name: Executive KPI Summary - Native Period-over-Period Performance
    type: text
    title_text: Executive KPI Summary - Native Period-over-Period Performance
    subtitle_text: ''
    body_text: High level summary of prescription volumes and new treatment starts
      compared against previous monthly boundaries.
    row: 0
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Total Prescriptions Count
    name: Total Prescriptions Count
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.number_of_prescriptions]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 2
    col: 0
    width: 4
    height: 4
    tab_name: ''
  - title: Prior Period Prescriptions
    name: Prior Period Prescriptions
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.prescriptions_prior_period]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 2
    col: 4
    width: 4
    height: 4
    tab_name: ''
  - title: Prescription PoP Change Percent
    name: Prescription PoP Change Percent
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.prescriptions_pop_change_pct]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 2
    col: 8
    width: 4
    height: 4
    tab_name: ''
  - title: New Prescriptions Volume
    name: New Prescriptions Volume
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.number_of_new_prescriptions]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 2
    col: 12
    width: 4
    height: 4
    tab_name: ''
  - title: New Rx PoP Change Percent
    name: New Rx PoP Change Percent
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.new_prescriptions_pop_pct_change]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 2
    col: 16
    width: 4
    height: 4
    tab_name: ''
  - title: Average Days Supply Trend
    name: Average Days Supply Trend
    model: rx_data_google
    explore: prescriptions
    type: single_value
    fields: [prescriptions.avg_days_supply]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 2
    col: 20
    width: 4
    height: 4
    tab_name: ''
  - name: Brand Performance and Market Share Analytics
    type: text
    title_text: Brand Performance and Market Share Analytics
    subtitle_text: ''
    body_text: Visual breakdown of drug brand volumes and therapeutic class distributions
      over time
    row: 6
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Brand Volume Distribution
    name: Brand Volume Distribution
    model: rx_data_google
    explore: prescriptions
    type: looker_pie
    fields: [prescriptions.brand_name, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 5
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 8
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Brand Prescriptions Monthly Trend
    name: Brand Prescriptions Monthly Trend
    model: rx_data_google
    explore: prescriptions
    type: looker_line
    fields: [prescriptions.rx_month, prescriptions.brand_name, prescriptions.number_of_prescriptions]
    pivots: [prescriptions.brand_name]
    sorts: [prescriptions.rx_month asc]
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 8
    col: 8
    width: 8
    height: 6
    tab_name: ''
  - title: Brand Performance Heatmap Matrix
    name: Brand Performance Heatmap Matrix
    model: rx_data_google
    explore: prescriptions
    type: marketplace_viz_report_table::report_table-marketplace
    fields: [prescriptions.brand_name, prescriptions.number_of_prescriptions, prescriptions.number_of_new_prescriptions,
      prescriptions.new_rx_ratio]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 5000
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: false
    theme: traditional
    customTheme: ''
    layout: fixed
    minWidthForIndexColumns: true
    headerFontSize: 12
    bodyFontSize: 12
    showTooltip: true
    showHighlight: true
    columnOrder: {}
    rowSubtotals: false
    colSubtotals: false
    spanRows: true
    spanCols: true
    calculateOthers: true
    sortColumnsBy: measures
    useViewName: false
    useHeadings: false
    useShortName: false
    useUnit: false
    groupVarianceColumns: false
    genericLabelForSubtotals: false
    indexColumn: false
    transposeTable: false
    label|prescriptions.brand_name: Brand Name
    heading|prescriptions.brand_name: ''
    hide|prescriptions.brand_name: false
    subtotalDepth: '1'
    label|prescriptions.number_of_prescriptions: Number of Prescriptions
    heading|prescriptions.number_of_prescriptions: ''
    style|prescriptions.number_of_prescriptions: normal
    reportIn|prescriptions.number_of_prescriptions: '1'
    unit|prescriptions.number_of_prescriptions: ''
    comparison|prescriptions.number_of_prescriptions: no_variance
    switch|prescriptions.number_of_prescriptions: false
    var_num|prescriptions.number_of_prescriptions: true
    var_pct|prescriptions.number_of_prescriptions: false
    label|prescriptions.number_of_new_prescriptions: Number of New Prescriptions
    heading|prescriptions.number_of_new_prescriptions: ''
    style|prescriptions.number_of_new_prescriptions: normal
    reportIn|prescriptions.number_of_new_prescriptions: '1'
    unit|prescriptions.number_of_new_prescriptions: ''
    comparison|prescriptions.number_of_new_prescriptions: no_variance
    switch|prescriptions.number_of_new_prescriptions: false
    var_num|prescriptions.number_of_new_prescriptions: true
    var_pct|prescriptions.number_of_new_prescriptions: false
    label|prescriptions.new_rx_ratio: New Prescription Rate
    heading|prescriptions.new_rx_ratio: ''
    style|prescriptions.new_rx_ratio: normal
    reportIn|prescriptions.new_rx_ratio: '1'
    unit|prescriptions.new_rx_ratio: ''
    comparison|prescriptions.new_rx_ratio: no_variance
    switch|prescriptions.new_rx_ratio: false
    var_num|prescriptions.new_rx_ratio: true
    var_pct|prescriptions.new_rx_ratio: false
    show_row_numbers: true
    conditional_formatting: [{type: along_columns, value_format_name: decimal_0, background_color: "#3EB0D5",
        color_application: {theme_id: default, palette_id: blue_orange}}]
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
    defaults_version: 0
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
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 8
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: New vs Refill Volume by Brand
    name: New vs Refill Volume by Brand
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [prescriptions.brand_name, prescriptions.number_of_new_prescriptions,
      prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    is_stacked: true
    listen:
      date_range: prescriptions.rx_date
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 14
    col: 0
    width: 8
    height: 8
    tab_name: ''
  - title: Therapeutic Class Market Share by Decile Tier Heatmap
    name: Therapeutic Class Market Share by Decile Tier Heatmap
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [prescriptions.therapeutic, prescriptions.number_of_prescriptions, spi_roots.decile_rtpb]
    pivots: [spi_roots.decile_rtpb]
    sorts: [spi_roots.decile_rtpb, prescriptions.number_of_prescriptions desc 0]
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
    enable_conditional_formatting: true
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
    conditional_formatting: [{type: less than, value: 1000000, fields: [prescriptions.number_of_prescriptions],
        apply_formatting_to_row: false, cell_format: {background_color: "#EF476F",
          font_color: !!null '', color_application: {collection_id: sales-demo, palette_id: sales-demo-sequential-0,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, row_format: {background_color: "#EF476F",
          font_color: !!null '', color_application: {collection_id: sales-demo, options: {
              mirror: false, reverse: false, stepped: false}}, font_style: {bold: false,
            italic: false, strikethrough: false}}, field: prescriptions.number_of_prescriptions,
        apply_to: selectFields}, {type: between, value: [1000000, 10000000], fields: [
          prescriptions.number_of_prescriptions], apply_formatting_to_row: false,
        cell_format: {background_color: "#f78c6b", font_color: !!null '', color_application: {
            collection_id: sales-demo, palette_id: sales-demo-sequential-0, options: {
              mirror: false, reverse: false, stepped: false}}, font_style: {bold: false,
            italic: false, strikethrough: false}}, row_format: {background_color: "#EF476F",
          font_color: !!null '', color_application: {collection_id: sales-demo, options: {
              mirror: false, reverse: false, stepped: false}}, font_style: {bold: false,
            italic: false, strikethrough: false}}, field: prescriptions.number_of_prescriptions,
        apply_to: selectFields}, {type: between, value: [10000000, 25000000], fields: [
          prescriptions.number_of_prescriptions], apply_formatting_to_row: false,
        cell_format: {background_color: "#ffd166", font_color: !!null '', color_application: {
            collection_id: sales-demo, palette_id: sales-demo-sequential-0, options: {
              mirror: false, reverse: false, stepped: false}}, font_style: {bold: false,
            italic: false, strikethrough: false}}, row_format: {background_color: "#EF476F",
          font_color: !!null '', color_application: {collection_id: sales-demo, options: {
              mirror: false, reverse: false, stepped: false}}, font_style: {bold: false,
            italic: false, strikethrough: false}}, field: prescriptions.number_of_prescriptions,
        apply_to: selectFields}, {type: greater than, value: 25000000, fields: [prescriptions.number_of_prescriptions],
        apply_formatting_to_row: false, cell_format: {background_color: "#06d6a0",
          font_color: !!null '', color_application: {collection_id: sales-demo, palette_id: sales-demo-sequential-0,
            options: {mirror: false, reverse: false, stepped: false}}, font_style: {
            bold: false, italic: false, strikethrough: false}}, row_format: {background_color: "#EF476F",
          font_color: !!null '', color_application: {collection_id: sales-demo, options: {
              mirror: false, reverse: false, stepped: false}}, font_style: {bold: false,
            italic: false, strikethrough: false}}, field: prescriptions.number_of_prescriptions,
        apply_to: selectFields}]
    show_value_labels: true
    font_size: 12
    defaults_version: 1
    hidden_pivots: {}
    listen:
      date_range: prescriptions.rx_date
      therapeutic_class: prescriptions.therapeutic
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 14
    col: 8
    width: 8
    height: 8
    tab_name: ''
  - title: Prescriptions Pivoted by State and Brand
    name: Prescriptions Pivoted by State and Brand
    model: rx_data_google
    explore: prescriptions
    type: looker_area
    fields: [prescriptions.patient_state, prescriptions.brand_name, prescriptions.number_of_prescriptions]
    pivots: [prescriptions.brand_name]
    sorts: [prescriptions.patient_state asc]
    listen:
      date_range: prescriptions.rx_date
      patient_state: prescriptions.patient_state
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 14
    col: 16
    width: 8
    height: 8
    tab_name: ''
  - name: Geographic and Socioeconomic Targeting - Census Overlay
    type: text
    title_text: Geographic and Socioeconomic Targeting - Census Overlay
    subtitle_text: ''
    body_text: Targeting high growth territories by overlaying patient demographics
      and county level socioeconomic indices
    row: 22
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Prescription Volume vs Median Household Income
    name: Prescription Volume vs Median Household Income
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.median_income_raw,
      prescriptions.number_of_prescriptions]
    sorts: [county_census_dt.median_income_raw desc]
    listen:
      census_county: county_census_dt.clean_county_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 24
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Poverty Rate vs RTPB Adoption Rate
    name: Poverty Rate vs RTPB Adoption Rate
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.poverty, prescriptions.rtpb1_rate]
    sorts: [county_census_dt.poverty desc]
    listen:
      census_county: county_census_dt.clean_county_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 24
    col: 8
    width: 8
    height: 6
    tab_name: ''
  - title: Top Counties by Prescription Growth Volume
    name: Top Counties by Prescription Growth Volume
    model: rx_data_google
    explore: prescriptions
    type: looker_bar
    fields: [county_census_dt.clean_county_name, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 15
    listen:
      census_county: county_census_dt.clean_county_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 24
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: Regional Census Socioeconomic Heatmap
    name: Regional Census Socioeconomic Heatmap
    model: rx_data_google
    explore: prescriptions
    type: looker_pie
    fields: [county_census_dt.state_name, prescriptions.utilization]
    sorts: [prescriptions.utilization desc 0]
    limit: 500
    column_limit: 50
    total: true
    value_labels: labels
    label_type: labPer
    inner_radius: 47
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
      census_county: county_census_dt.clean_county_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 30
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Access To Medication Distributed by Decile Routing
    name: Access To Medication Distributed by Decile Routing
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [spi_roots.decile_routing, spi_roots.number_of_doctors, pharmacy.number_of_pharmacies]
    sorts: [spi_roots.decile_routing asc]
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
      provider_specialty: spi_roots.specialty
    row: 30
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - name: Specialty Visualizations - Funnels Timelines and Distribution Box Plots
    type: text
    title_text: Specialty Visualizations - Funnels Timelines and Distribution Box
      Plots
    subtitle_text: ''
    body_text: Tracking doctor engagement progression, therapy durations, and medication
      supply distributions
    row: 38
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Doctor Decile to Prescribing Funnel
    name: Doctor Decile to Prescribing Funnel
    model: rx_data_google
    explore: spi_roots
    type: looker_funnel
    fields: [spi_roots.decile_routing, spi_roots.number_of_doctors]
    sorts: [spi_roots.decile_routing desc]
    listen:
      provider_specialty: spi_roots.specialty
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 40
    col: 0
    width: 8
    height: 8
    tab_name: ''
  - title: Days Supply Distribution across Therapeutics
    name: Days Supply Distribution across Therapeutics
    model: rx_data_google
    explore: prescriptions
    type: looker_boxplot
    fields: [prescriptions.therapeutic, prescriptions.days_supply_p5, prescriptions.days_supply_p25,
      prescriptions.days_supply_p50, prescriptions.days_supply_p75, prescriptions.days_supply_p95]
    sorts: [prescriptions.therapeutic asc]
    limit: 10
    listen:
      therapeutic_class: prescriptions.therapeutic
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 40
    col: 8
    width: 8
    height: 8
    tab_name: ''
  - title: Yearly Dynamic Medication Stats
    name: Yearly Dynamic Medication Stats
    model: rx_data_google
    explore: prescriptions
    type: looker_grid
    fields: [prescriptions.generic_name, prescriptions.dynamic_counter, prescriptions.rx_year]
    pivots: [prescriptions.rx_year]
    fill_fields: [prescriptions.rx_year]
    filters:
      prescriptions.pick_field_to_count: brand^_name
    sorts: [prescriptions.rx_year, prescriptions.dynamic_counter desc 0]
    limit: 15
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
    hidden_fields: []
    hidden_points_if_no: []
    groupBars: true
    labelSize: 10pt
    showLegend: true
    series_labels: {}
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
    hidden_pivots: {}
    listen:
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 40
    col: 16
    width: 8
    height: 8
    tab_name: ''
  - title: Prescriber Decile Distribution by Specialty
    name: Prescriber Decile Distribution by Specialty
    model: rx_data_google
    explore: spi_roots
    type: looker_bar
    fields: [spi_roots.specialty, spi_roots.decile_routing, spi_roots.number_of_doctors]
    pivots: [spi_roots.decile_routing]
    sorts: [spi_roots.number_of_doctors desc]
    limit: 10
    listen:
      provider_specialty: spi_roots.specialty
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 48
    col: 0
    width: 12
    height: 6
    tab_name: ''
  - title: RTPB Tier Distribution
    name: RTPB Tier Distribution
    model: rx_data_google
    explore: prescriptions
    type: looker_area
    fields: [prescriptions.rx_month, prescriptions.rtpb1_rate, prescriptions.rtpb3_rate,
      prescriptions.rtpb2_rate]
    sorts: [prescriptions.rx_month asc]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: sales-demo
      palette_id: sales-demo-categorical-0
      options:
        steps: 5
        reverse: true
    hidden_fields: []
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors: {}
    defaults_version: 1
    listen:
      date_range: prescriptions.rx_date
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 48
    col: 12
    width: 12
    height: 6
    tab_name: ''
  - name: Provider and Pharmacy Deep-Dive Performance
    type: text
    title_text: Provider and Pharmacy Deep-Dive Performance
    subtitle_text: ''
    body_text: Analyzing high performing pharmacies and top prescribing physicians
      across marketing targets
    row: 54
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: Top 10 Prescribers by Volume
    name: Top 10 Prescribers by Volume
    model: rx_data_google
    explore: spi_roots
    type: looker_grid
    fields: [spi_roots.primary_common_name, spi_roots.specialty, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 10
    listen:
      provider_specialty: spi_roots.specialty
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 56
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - title: Top 10 Pharmacies by New Rx Volume
    name: Top 10 Pharmacies by New Rx Volume
    model: rx_data_google
    explore: pharmacy
    type: looker_grid
    fields: [pharmacy.city, pharmacy.dispenser_class, prescriptions.number_of_new_prescriptions]
    sorts: [prescriptions.number_of_new_prescriptions desc]
    limit: 10
    listen:
      pharmacy_state: pharmacy.state
      pharmacy_dispenser: pharmacy.dispenser_class
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 56
    col: 8
    width: 8
    height: 6
    tab_name: ''
  - title: Provider Decile Routing vs Actual Prescriptions
    name: Provider Decile Routing vs Actual Prescriptions
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [spi_roots.decile_routing, prescriptions.number_of_prescriptions]
    sorts: [spi_roots.decile_routing asc]
    listen:
      provider_specialty: spi_roots.specialty
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 56
    col: 16
    width: 8
    height: 6
    tab_name: ''
  - title: Pharmacy State Distribution
    name: Pharmacy State Distribution
    model: rx_data_google
    explore: pharmacy
    type: looker_column
    fields: [pharmacy.state, pharmacy.dispenser_class, pharmacy.number_of_pharmacies]
    pivots: [pharmacy.dispenser_class]
    sorts: [pharmacy.number_of_pharmacies desc]
    listen:
      pharmacy_state: pharmacy.state
      pharmacy_dispenser: pharmacy.dispenser_class
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 62
    col: 0
    width: 12
    height: 8
    tab_name: ''
  - title: Average Days Supply vs New Rx Ratio Scatter
    name: Average Days Supply vs New Rx Ratio Scatter
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [prescriptions.brand_name, prescriptions.avg_days_supply, prescriptions.new_rx_ratio]
    sorts: [prescriptions.avg_days_supply desc]
    listen:
      brand_name: prescriptions.brand_name
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 62
    col: 12
    width: 12
    height: 8
    tab_name: ''
  - name: Merged Query Tiles and Advanced Campaign Analysis
    type: text
    title_text: Merged Query Tiles and Advanced Campaign Analysis
    subtitle_text: ''
    body_text: Combining multidimensional explore datasets for targeted territory
      mapping and brand growth walk analysis
    row: 70
    col: 0
    width: 24
    height: 2
    tab_name: ''
  - title: State New Prescription Rate Correlation to Poverty Rate
    name: State New Prescription Rate Correlation to Poverty Rate
    merged_queries:
    - model: rx_data_google
      explore: prescriptions
      type: looker_area
      fields: [prescriptions.rx_month, prescriptions.new_rx_ratio, pharmacy.state]
      filters:
        prescriptions.rx_date: 30 days
        prescriptions.pick_field_to_count: brand^_name
      sorts: [prescriptions.rx_month, prescriptions.new_rx_ratio desc]
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
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      hidden_pivots: {}
    - model: rx_data_google
      explore: county_census_dt
      type: table
      fields: [county_census_dt.state, county_census_dt.average_poverty_rate]
      sorts: [county_census_dt.average_poverty_rate desc 0]
      limit: 500
      column_limit: 50
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: county_census_dt.state
        source_field_name: pharmacy.state
    hidden_pivots: {}
    type: table
    pivots: [prescriptions.rx_month]
    sorts: [prescriptions.rx_month]
    listen:
    - Pick Field to Count: prescriptions.pick_field_to_count
    -
    row: 80
    col: 0
    width: 8
    height: 6
    tab_name: ''
  - name: Doctor vs Population Distribution by State
    title: Doctor vs Population Distribution by State
    merged_queries:
    - model: rx_data_google
      explore: prescriptions
      type: looker_scatter
      fields: [spi_roots.state, spi_roots.number_of_doctors]
      filters:
        prescriptions.rx_date: 30 days
        prescriptions.pick_field_to_count: brand^_name
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
      hidden_fields: []
      hidden_points_if_no: []
      series_labels: {}
      interpolation: linear
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      hidden_pivots: {}
      ordering: none
      show_null_labels: false
    - model: rx_data_google
      explore: county_census_dt
      type: table
      fields: [county_census_dt.state, county_census_dt.total_households, county_census_dt.total_population]
      sorts: [county_census_dt.total_households desc 0]
      limit: 500
      column_limit: 50
      query_timezone: America/Los_Angeles
      hidden_pivots: {}
      join_fields:
      - field_name: county_census_dt.state
        source_field_name: spi_roots.state
    hidden_fields: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: county_census_dt.total_households,
            id: county_census_dt.total_households, name: Total Households}, {axisId: county_census_dt.total_population,
            id: county_census_dt.total_population, name: Total Population}], showLabels: true,
        showValues: true, tickDensity: default, type: linear, unpinAxis: false}, {
        label: !!null '', orientation: right, series: [{axisId: spi_roots.number_of_doctors,
            id: spi_roots.number_of_doctors, name: Number of Doctors}], showLabels: true,
        showValues: true, tickDensity: default, type: linear, unpinAxis: false}]
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
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
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
    hidden_pivots: {}
    type: looker_scatter
    listen:
    - Pick Field to Count: prescriptions.pick_field_to_count
    -
    row: 80
    col: 0
    width: 8
    height: 6
    tab_name: ''

  # - name: tile_28_merged_prescriber_census
  #   title: "Prescriber Census Overlay"
  #   type: table
  #   merged_queries:
  #   - model: rx_data_google
  #     explore: spi_roots
  #     fields: [spi_roots.state, spi_roots.number_of_doctors]
  #     sorts: [spi_roots.number_of_doctors desc]
  #   - model: rx_data_google
  #     explore: county_census_dt
  #     fields: [prescriptions.patient_zip, prescriptions.patient_state, prescriptions.number_of_prescriptions, county_census_dt.average_median_income]
  #     sorts: [prescriptions.number_of_prescriptions desc]
  #     join_fields:
  #       - field_name: spi_roots.state
  #         source_field_name: county_census_dt.state

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

  - title: Brand Share vs Socioeconomic Indicators Trend
    name: Brand Share vs Socioeconomic Indicators Trend
    model: rx_data_google
    explore: prescriptions
    type: looker_area
    fields: [prescriptions.rx_month, prescriptions.new_rx_ratio, county_census_dt.poverty]
    sorts: [prescriptions.rx_month asc]
    listen:
      date_range: prescriptions.rx_date
      Pick Field to Count: prescriptions.pick_field_to_count
    row: 72
    col: 0
    width: 24
    height: 8
    tab_name: ''

  filters:
  - name: date_range
    title: Prescription Date Range
    type: date_filter
    default_value: last 30 days
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
  - name: patient_state
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
  - name: brand_name
    title: Brand Name
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
    field: prescriptions.brand_name
  - name: disease_category
    title: Disease Category
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
    field: prescriptions.disease
  - name: therapeutic_class
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
    field: prescriptions.therapeutic
  - name: provider_specialty
    title: Provider Specialty
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: rx_data_google
    explore: spi_roots
    listens_to_filters: []
    field: spi_roots.specialty
  - name: pharmacy_state
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
    field: pharmacy.state
  - name: pharmacy_dispenser
    title: Dispenser Class
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
    field: pharmacy.dispenser_class
  - name: account_rollup
    title: Account Rollup
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
    field: accounts.rollup_name
  - name: census_county
    title: Census County
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
    field: county_census_dt.clean_county_name
  - name: Pick Field to Count
    title: Pick Field to Count
    type: field_filter
    default_value: brand^_name
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: inline
    model: rx_data_google
    explore: prescriptions
    listens_to_filters: []
    field: prescriptions.pick_field_to_count
