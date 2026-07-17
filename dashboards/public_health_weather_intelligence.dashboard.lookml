- dashboard: public_health_weather_rx_intelligence
  title: "Public Health & Weather-Rx Epidemiological Intelligence"
  layout: newspaper
  description: "Strategic public health dashboard correlating regional NOAA meteorological data with pharmaceutical dispensing patterns and socio-economic census factors."

  # =========================================================================
  # DASHBOARD FILTERS (14 Strategic Filters)
  # =========================================================================
  filters:
  - name: fulfillment_date
    title: "Fulfillment Date"
    type: date_filter
    default_value: "last 365 days"
  - name: patient_state
    title: "Patient State"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.patient_state
  - name: patient_county
    title: "Patient County"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.patient_county
  - name: therapeutic_class
    title: "Therapeutic Class"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: ndcs.therapeutic
  - name: disease_target
    title: "Disease Target"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: ndcs.disease
  - name: weather_severity
    title: "Weather Severity Category"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: weather_dt.weather_severity_category
  - name: temperature_tier
    title: "Temperature Tier"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: weather_dt.temperature_tier
  - name: was_precipitation_reported
    title: "Precipitation Reported"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: weather_dt.was_precipitation_reported
  - name: age_group
    title: "Patient Age Group"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.age_group
  - name: poverty_tier
    title: "Poverty Tier"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: county_census_dt.poverty_tier
  - name: dispenser_class
    title: "Dispenser Class"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: pharmacy.dispenser_class
  - name: selected_state_pharmacy
    title: "Selected State (Pharmacy Explore)"
    type: field_filter
    model: rx_data_google
    explore: pharmacy
    field: pharmacy.selected_state_filter
  - name: is_pcp
    title: "Is Primary Care Provider"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: prescriptions.primary_care
  - name: geo_vulnerability
    title: "Geographic Vulnerability Index"
    type: field_filter
    model: rx_data_google
    explore: prescriptions
    field: county_census_dt.geographic_vulnerability_index

  elements:

  # =========================================================================
  # TAB 1: REGIONAL CLIMATE & CLINICAL VULNERABILITY COMMAND (ROWs 0 - 10)
  # =========================================================================
  - name: tab1_header
    type: text
    title_text: "Tab 1: Regional Climate & Clinical Vulnerability Command"
    subtitle_text: "High-level overview mapping vulnerable populations, national prescription volume, and macro-climatic changes."
    row: 0
    col: 0
    width: 24
    height: 2

  - name: tile_1_total_population
    title: "Total Census Population"
    type: single_value
    model: rx_data_google
    explore: prescriptions
    measures: [county_census_dt.total_population]
    row: 2
    col: 0
    width: 6
    height: 4

  - name: tile_2_total_prescriptions
    title: "Total Prescriptions Filled"
    type: single_value
    model: rx_data_google
    explore: prescriptions
    measures: [prescriptions.number_of_prescriptions]
    row: 2
    col: 6
    width: 6
    height: 4

  - name: tile_3_total_providers
    title: "Total Prescribing Providers"
    type: single_value
    model: rx_data_google
    explore: prescriptions
    measures: [prescriptions.number_of_providers]
    row: 2
    col: 12
    width: 6
    height: 4

  - name: tile_4_epa_rate
    title: "ePA Activation Rate (MDs)"
    type: single_value
    model: rx_data_google
    explore: prescriptions
    measures: [spi_roots.epa_activation_rate]
    row: 2
    col: 18
    width: 6
    height: 4

  - name: tile_5_state_volume
    title: "Prescription Volume by Patient State"
    type: looker_column
    model: rx_data_google
    explore: prescriptions
    dimensions: [prescriptions.patient_state]
    measures: [prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    row: 6
    col: 0
    width: 8
    height: 4

  - name: tile_6_temp_rx_trend
    title: "Monthly Mean Temperature vs Prescription Volume"
    type: looker_line
    model: rx_data_google
    explore: prescriptions
    dimensions: [weather_dt.weather_record_month]
    measures: [weather_dt.daily_temp, prescriptions.number_of_prescriptions]
    row: 6
    col: 8
    width: 8
    height: 4

  - name: tile_7_severity_donut
    title: "Rx Vol Share by Weather Severity"
    type: looker_pie
    model: rx_data_google
    explore: prescriptions
    dimensions: [weather_dt.weather_severity_category]
    measures: [prescriptions.number_of_prescriptions]
    row: 6
    col: 16
    width: 8
    height: 4

  - name: tile_8_income_vs_vol
    title: "Average Median Income vs Prescription Volume"
    type: looker_scatter
    model: rx_data_google
    explore: prescriptions
    dimensions: [county_census_dt.clean_county_name]
    measures: [county_census_dt.average_median_income, prescriptions.number_of_prescriptions]
    row: 10
    col: 0
    width: 8
    height: 4

  - name: tile_9_vulnerable_grid
    title: "Social Vulnerability and Poverty Class Analysis"
    type: looker_grid
    model: rx_data_google
    explore: prescriptions
    dimensions: [county_census_dt.state, county_census_dt.clean_county_name, county_census_dt.poverty_tier]
    measures: [prescriptions.number_of_prescriptions, county_census_dt.total_population]
    row: 10
    col: 8
    width: 8
    height: 4

  - name: tile_10_days_supply_boxplot
    title: "Days Supply Duration Percentile Breakdown"
    type: looker_area
    model: rx_data_google
    explore: prescriptions
    measures: [prescriptions.days_supply_p5, prescriptions.days_supply_p25, prescriptions.days_supply_p50, prescriptions.days_supply_p75, prescriptions.days_supply_p95]
    row: 10
    col: 16
    width: 8
    height: 4

  # =========================================================================
  # TAB 2: EPIDEMIOLOGICAL WEATHER-RX CORRELATION & ADHERENCE (ROWs 14 - 24)
  # =========================================================================
  - name: tab2_header
    type: text
    title_text: "Tab 2: Epidemiological Weather-Rx Correlation & Adherence"
    subtitle_text: "Deeper clinical look at temperature swings, precipitation peaks, and therapeutic responses."
    row: 14
    col: 0
    width: 24
    height: 2

  - name: tile_11_avg_supply
    title: "Average Days of Supply"
    type: single_value
    model: rx_data_google
    explore: prescriptions
    measures: [prescriptions.avg_days_supply]
    row: 16
    col: 0
    width: 6
    height: 4

  - name: tile_12_nbrx_rate
    title: "New Therapy (NBRx) Rate"
    type: single_value
    model: rx_data_google
    explore: prescriptions
    measures: [prescriptions.new_rx_ratio]
    row: 16
    col: 6
    width: 6
    height: 4

  - name: tile_13_temp_tier_starts
    title: "New starts (NBRx) vs Total fills by Temp Tier"
    type: looker_column
    model: rx_data_google
    explore: prescriptions
    dimensions: [weather_dt.temperature_tier]
    measures: [prescriptions.number_of_new_prescriptions, prescriptions.number_of_prescriptions]
    row: 16
    col: 12
    width: 12
    height: 4

  - name: tile_14_disease_cohorts
    title: "Climate-Sensitive Disease Cohort Volumes"
    type: looker_bar
    model: rx_data_google
    explore: prescriptions
    dimensions: [ndcs.weather_sensitive_disease_cohort]
    measures: [prescriptions.number_of_prescriptions]
    row: 20
    col: 0
    width: 8
    height: 4

  - name: tile_15_allergy_precipitation
    title: "Weekly Rain Levels vs Antihistamine Volume"
    type: looker_column
    model: rx_data_google
    explore: prescriptions
    dimensions: [weather_dt.weather_record_week]
    measures: [weather_dt.total_precipitation, prescriptions.number_of_prescriptions]
    filters:
      ndcs.therapeutic: 'ANTIHISTAMINES FOR SYSTEMIC USE'
    row: 20
    col: 8
    width: 8
    height: 4

  - name: tile_16_snow_respiratory
    title: "Median Snow Depth vs Asthma/COPD Medication Demand"
    type: looker_scatter
    model: rx_data_google
    explore: prescriptions
    dimensions: [weather_dt.weather_record_date]
    measures: [weather_dt.median_snow_depth, prescriptions.number_of_prescriptions]
    filters:
      ndcs.disease: '%ASTHMA%,%COPD%'
    row: 20
    col: 16
    width: 8
    height: 4

  - name: tile_17_pop_vs_temp
    title: "Prescription Vol PoP Change % vs Daily Mean Temp"
    type: looker_line
    model: rx_data_google
    explore: prescriptions
    dimensions: [prescriptions.rx_month]
    measures: [prescriptions.prescriptions_pop_change_pct, weather_dt.daily_temp]
    row: 24
    col: 0
    width: 8
    height: 4

  - name: tile_18_age_susceptibility
    title: "Patient Age Profiles across Temperature Tiers"
    type: looker_column
    model: rx_data_google
    explore: prescriptions
    dimensions: [prescriptions.age_group, weather_dt.temperature_tier]
    measures: [prescriptions.number_of_prescriptions]
    row: 24
    col: 8
    width: 8
    height: 4

  - name: tile_19_weekly_weather_matrix
    title: "Epidemiological Lag Matrix: Weekly Weather vs Acute Starts"
    type: looker_grid
    model: rx_data_google
    explore: prescriptions
    dimensions: [weather_dt.weather_record_week, weather_dt.weather_severity_category]
    measures: [prescriptions.number_of_new_prescriptions, weather_dt.rainy_days_count, weather_dt.snowy_days_count]
    row: 24
    col: 16
    width: 8
    height: 4

  - name: tile_20_treatment_timelines
    title: "Prescription Cohort Duration Over Time"
    type: looker_area
    model: rx_data_google
    explore: prescriptions
    dimensions: [prescriptions.treatment_start_date, prescriptions.treatment_end_date]
    measures: [prescriptions.number_of_prescriptions]
    row: 28
    col: 0
    width: 24
    height: 4

  # =========================================================================
  # TAB 3: PUBLIC HEALTH RESOURCE & PHARMACY DISPENSING OPERATIONS (ROWs 32 - 42)
  # =========================================================================
  - name: tab3_header
    type: text
    title_text: "Tab 3: Public Health Resource & Pharmacy Dispensing Operations"
    subtitle_text: "Operational footprint across regional physical pharmacies and dispensing structures."
    row: 32
    col: 0
    width: 24
    height: 2

  - name: tile_21_pharmacies_count
    title: "Operational Pharmacies"
    type: single_value
    model: rx_data_google
    explore: pharmacy
    measures: [pharmacy.number_of_pharmacies]
    row: 34
    col: 0
    width: 6
    height: 4

  - name: tile_22_first_period_avg
    title: "F1 Avg Days Supply (First Period)"
    type: single_value
    model: rx_data_google
    explore: prescriptions
    measures: [prescriptions.avg_days_supply_in_first_period]
    row: 34
    col: 6
    width: 6
    height: 4

  - name: tile_23_vulnerable_dispenser_class
    title: "Dispenser Classes in High Vulnerability Areas"
    type: looker_bar
    model: rx_data_google
    explore: prescriptions
    dimensions: [pharmacy.dispenser_class]
    measures: [prescriptions.number_of_prescriptions]
    filters:
      county_census_dt.geographic_vulnerability_index: 'High Social & Mobility Vulnerability'
    row: 34
    col: 12
    width: 12
    height: 4

  - name: tile_24_city_monthly_summary
    title: "Pharmacy Vol Summary by City and Month"
    type: looker_column
    model: rx_data_google
    explore: pharmacy
    dimensions: [pharmacy.city, prescriptions.rx_month]
    measures: [prescriptions.number_of_prescriptions]
    row: 38
    col: 0
    width: 8
    height: 4

  - name: tile_25_storm_dispensing
    title: "Severe Weather Impact on Dispensing Channels"
    type: looker_line
    model: rx_data_google
    explore: prescriptions
    dimensions: [weather_dt.weather_record_week, pharmacy.dispenser_class]
    measures: [prescriptions.number_of_prescriptions]
    filters:
      weather_dt.weather_severity_category: '-Clear/No Severe Weather Recorded'
    row: 38
    col: 8
    width: 8
    height: 4

  - name: tile_26_cold_flu_remedies
    title: "Cold/Flu Active Ingredients Volume Mix"
    type: looker_pie
    model: rx_data_google
    explore: ndcs
    dimensions: [ndcs.generic_name]
    measures: [prescriptions.number_of_prescriptions]
    filters:
      ndcs.therapeutic: 'COUGH AND COLD PREPARATIONS'
    row: 38
    col: 16
    width: 8
    height: 4

  - name: tile_27_station_distance
    title: "Nearest Weather Station Distance vs Local Dispensing Volume"
    type: looker_scatter
    model: rx_data_google
    explore: prescriptions
    dimensions: [station_mapping_dt.station_name]
    measures: [station_mapping_dt.avg_distance, prescriptions.number_of_prescriptions]
    row: 42
    col: 0
    width: 8
    height: 4

  - name: tile_28_foot_traffic_warning_log
    title: "Dispensing Warnings: Heavy Storm & Foot-Traffic Alert Log"
    type: looker_grid
    model: rx_data_google
    explore: prescriptions
    dimensions: [pharmacy.ncpdpid, pharmacy.city, pharmacy.state, weather_dt.weather_severity_category]
    measures: [prescriptions.number_of_prescriptions, weather_dt.total_precipitation]
    row: 42
    col: 8
    width: 8
    height: 4

  - name: tile_29_refill_ratios
    title: "Refill Ratios (New Rx Rate) by Pharmacy ZIP"
    type: looker_column
    model: rx_data_google
    explore: pharmacy
    dimensions: [pharmacy.zip]
    measures: [prescriptions.new_rx_ratio]
    row: 42
    col: 16
    width: 8
    height: 4

  - name: tile_30_rtpb_severe_weather
    title: "Insurance Cost Tier Adoption (RTPB Rates) during Winter Seasons"
    type: looker_line
    model: rx_data_google
    explore: prescriptions
    dimensions: [prescriptions.rx_month]
    measures: [prescriptions.rtpb1_rate, prescriptions.rtpb2_rate, prescriptions.rtpb3_rate]
    row: 46
    col: 0
    width: 24
    height: 4

  # =========================================================================
  # TAB 4: CLINICIAN BEHAVIOR & SOCIO-ECONOMIC CENSUS ANALYTICS (ROWs 50 - 60)
  # =========================================================================
  - name: tab4_header
    type: text
    title_text: "Tab 4: Clinician Behavior & Socio-Economic Census Analytics"
    subtitle_text: "Deep epidemiological drill-down into medical provider patterns and regional demographic constraints."
    row: 50
    col: 0
    width: 24
    height: 2

  - name: tile_31_doctors_count
    title: "Total Licensed Clinical Providers"
    type: single_value
    model: rx_data_google
    explore: spi_roots
    measures: [spi_roots.number_of_doctors]
    row: 52
    col: 0
    width: 6
    height: 4

  - name: tile_32_provider_epa_rate
    title: "Physician ePA Activation Rate"
    type: single_value
    model: rx_data_google
    explore: spi_roots
    measures: [spi_roots.epa_activation_rate]
    row: 52
    col: 6
    width: 6
    height: 4

  - name: tile_33_specialty_shift
    title: "Evolution of Physician Specialty Mix (CY vs Prior Year)"
    type: looker_line
    model: rx_data_google
    explore: spi_roots
    dimensions: [spi_roots.specialty_cy, spi_roots.specialty_cm_1]
    measures: [spi_roots.number_of_doctors]
    row: 52
    col: 12
    width: 12
    height: 4

  - name: tile_34_decile_routing_income
    title: "Physician Decile Routing across Practice ZIP Income Tiers"
    type: looker_bar
    model: rx_data_google
    explore: spi_roots
    dimensions: [spi_roots.decile_routing, spi_roots.zip_income_tier]
    measures: [spi_roots.number_of_doctors]
    row: 56
    col: 0
    width: 8
    height: 4

  - name: tile_35_income_vs_physicians
    title: "Household Income vs Practicing Doctor Density"
    type: looker_scatter
    model: rx_data_google
    explore: spi_roots
    dimensions: [spi_roots.city]
    measures: [spi_roots.spiroot_zip_income_per_household, spi_roots.number_of_doctors]
    row: 56
    col: 8
    width: 8
    height: 4

  - name: tile_36_rtpb_poverty
    title: "RTPB Benefit Tiers vs Patient Poverty Class"
    type: looker_column
    model: rx_data_google
    explore: spi_roots
    dimensions: [spi_roots.decile_rtpb, county_census_dt.income_tier]
    measures: [spi_roots.number_of_doctors]
    row: 56
    col: 16
    width: 8
    height: 4

  - name: tile_37_credentials_mix
    title: "Provider Clinical Credentials Mix (Title CY)"
    type: looker_pie
    model: rx_data_google
    explore: spi_roots
    dimensions: [spi_roots.title_cy]
    measures: [spi_roots.number_of_doctors]
    row: 60
    col: 0
    width: 8
    height: 4

  - name: tile_38_county_vulnerability_log
    title: "Epidemiological Alert: Social & Mobility Adherence Risk by County"
    type: looker_grid
    model: rx_data_google
    explore: prescriptions
    dimensions: [county_census_dt.state, county_census_dt.clean_county_name, county_census_dt.geographic_vulnerability_index]
    measures: [county_census_dt.average_poverty_rate, county_census_dt.total_households_no_cars, prescriptions.avg_days_supply]
    row: 60
    col: 8
    width: 8
    height: 4

  - name: tile_39_pcp_weather_fills
    title: "Primary Care (PCP) vs Specialist Climate-Sensitive Fills"
    type: looker_line
    model: rx_data_google
    explore: prescriptions
    dimensions: [prescriptions.primary_care]
    measures: [prescriptions.number_of_prescriptions]
    row: 60
    col: 16
    width: 8
    height: 4

  - name: tile_40_decile_routing_historical
    title: "Physician Decile Routing vs Historical Baseline"
    type: looker_area
    model: rx_data_google
    explore: spi_roots
    dimensions: [spi_roots.decile_routing]
    measures: [spi_roots.number_of_doctors]
    row: 64
    col: 0
    width: 24
    height: 4
