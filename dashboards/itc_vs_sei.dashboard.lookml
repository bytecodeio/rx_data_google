- dashboard: chronic_care_vs_socioeconomic_indicators
  title: Chronic Care vs Socioeconomic Indicators
  preferred_viewer: dashboards-next
  description: This advanced dashboard investigates the correlation between socioeconomic factors (income, poverty, education, unemployment) and long-term chronic healthcare utilization, RTPB adoption rates, and provider accessibility.
  preferred_slug: luKlLIsnyNBWiEe4QYUmur
  theme_name: ''
  layout: newspaper

  tabs:
  - name: tab_1
    label: Executive KPIs and Economic Baselines
  - name: tab_2
    label: Disparities in Therapy and Prescribing Adherence
  - name: tab_3
    label: Provider Distribution and Digital Health Access

  elements:

  # =========================================================================
  # TAB 1: EXECUTIVE KPIs & ECONOMIC BASELINES
  # =========================================================================

  - name: dashboard_narrative
    type: text
    tab_name: tab_1
    body_text: |-
      # Chronic Care vs Socioeconomic Indicators Dashboard
      This advanced dashboard investigates the correlation between socioeconomic factors (income, poverty, education, unemployment) and long-term chronic healthcare utilization, RTPB adoption rates, and provider accessibility. Use the tabs above to explore different focus areas.
    row: 0
    col: 0
    width: 24
    height: 3

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 3
    col: 0
    width: 6
    height: 4
    tab_name: tab_1

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 3
    col: 6
    width: 6
    height: 4
    tab_name: tab_1

  - title: Long-Term Care Share - 61 plus Days Supply
    name: Long-Term Care Share - 61 plus Days Supply
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    filters:
      rx_fact.days_supply_tier: "4. Maintenance (61+ Days)"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 3
    col: 12
    width: 6
    height: 4
    tab_name: tab_1

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 3
    col: 18
    width: 6
    height: 4
    tab_name: tab_1

  - title: Vulnerable Counties Served Count
    name: Vulnerable Counties Served Count
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [county_census_dt.count]
    filters:
      county_census_dt.poverty_tier: "High Poverty (20-40%)"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 7
    col: 0
    width: 6
    height: 4
    tab_name: tab_1

  - title: Most Prevalent Disease in Low-Income Counties
    name: Most Prevalent Disease in Low-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [ndcs.disease, rx_fact.count]
    filters:
      county_census_dt.income_tier: "Under 35k"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 7
    col: 6
    width: 9
    height: 4
    tab_name: tab_1

  - title: Most Prevalent Disease in High-Income Counties
    name: Most Prevalent Disease in High-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [ndcs.disease, rx_fact.count]
    filters:
      county_census_dt.income_tier: "150k+"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 7
    col: 15
    width: 9
    height: 4
    tab_name: tab_1

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 11
    col: 0
    width: 12
    height: 8
    tab_name: tab_1

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 11
    col: 12
    width: 12
    height: 8
    tab_name: tab_1

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
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: prescriptions.age_group
      Dispenser Class: prescriptions.dispenser_class
      Prescriber Specialty: spi_roots.specialty
      Days Supply: prescriptions.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 19
    col: 0
    width: 12
    height: 8
    tab_name: tab_1

  - title: Top 10 States by Prescription Volume
    name: Top 10 States by Prescription Volume
    model: rx_data_google
    explore: prescriptions
    type: looker_google_map
    fields: [prescriptions.patient_state, prescriptions.patient_county, prescriptions.number_of_prescriptions]
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 10
    column_limit: 50
    listen:
      Fulfillment Date: prescriptions.rx_date
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: prescriptions.age_group
      Dispenser Class: prescriptions.dispenser_class
      Prescriber Specialty: spi_roots.specialty
      Days Supply: prescriptions.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 19
    col: 12
    width: 12
    height: 8
    tab_name: tab_1

  - title: Geographical Heatmap - Long-Term Chronic Care Volume by State
    name: Geographical Heatmap - Long-Term Chronic Care Volume by State
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_google_map
    fields: [pharmacy.state, rx_fact.count]
    filters:
      rx_fact.days_supply_tier: "4. Maintenance (61+ Days)"
    sorts: [rx_fact.count desc]
    limit: 5000
    column_limit: 50
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 27
    col: 0
    width: 24
    height: 10
    tab_name: tab_1

  # =========================================================================
  # TAB 2: DISPARITIES IN THERAPY & PRESCRIBING ADHERENCE
  # =========================================================================

  - title: Top Chronic Diseases by County Income Tier
    name: Top Chronic Diseases by County Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, county_census_dt.income_tier, rx_fact.count]
    pivots: [county_census_dt.income_tier]
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 0
    col: 0
    width: 12
    height: 8
    tab_name: tab_2

  - title: Top Chronic Diseases in Extreme Poverty Counties
    name: Top Chronic Diseases in Extreme Poverty Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, rx_fact.count]
    filters:
      county_census_dt.poverty_tier: "Extreme Poverty (40%+)"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 0
    col: 12
    width: 12
    height: 8
    tab_name: tab_2

  - title: Maintenance vs Acute Supply Tier by Target Disease and Income Tier
    name: Maintenance vs Acute Supply Tier by Target Disease and Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [ndcs.disease, rx_fact.days_supply_tier, county_census_dt.income_tier, rx_fact.count]
    pivots: [rx_fact.days_supply_tier, county_census_dt.income_tier]
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 8
    col: 0
    width: 12
    height: 8
    tab_name: tab_2

  - title: Distribution of Days Supply across Therapeutic Classes by County Poverty Tier
    name: Distribution of Days Supply across Therapeutic Classes by County Poverty Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.therapeutic, county_census_dt.poverty_tier, rx_fact.average_days_supply]
    pivots: [county_census_dt.poverty_tier]
    sorts: [rx_fact.average_days_supply desc]
    limit: 15
    column_limit: 50
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 8
    col: 12
    width: 12
    height: 8
    tab_name: tab_2

  - title: Long-Term Care Share by Therapeutic Class and County Income Tier
    name: Long-Term Care Share by Therapeutic Class and County Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [ndcs.therapeutic, county_census_dt.income_tier, rx_fact.count]
    pivots: [county_census_dt.income_tier]
    filters:
      rx_fact.days_supply_tier: "4. Maintenance (61+ Days)"
    sorts: [rx_fact.count desc]
    limit: 8
    column_limit: 50
    stacking: percent
    show_value_labels: true
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 16
    col: 0
    width: 12
    height: 8
    tab_name: tab_2

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 16
    col: 12
    width: 12
    height: 8
    tab_name: tab_2

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 24
    col: 0
    width: 12
    height: 8
    tab_name: tab_2

  - title: Pharmacy Dispenser Class Share in High-Poverty Counties
    name: Pharmacy Dispenser Class Share in High-Poverty Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [pharmacy.dispenser_class, rx_fact.count]
    filters:
      county_census_dt.poverty_tier: "High Poverty (20-40%)"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 24
    col: 12
    width: 12
    height: 8
    tab_name: tab_2

  - title: Average Days Supply by County Income Tier over Time
    name: Average Days Supply by County Income Tier over Time
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, county_census_dt.income_tier, rx_fact.average_days_supply]
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 32
    col: 0
    width: 12
    height: 8
    tab_name: tab_2

  - title: County Correlation - Population Size vs Average Days Supply
    name: County Correlation - Population Size vs Average Days Supply
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.total_population, rx_fact.average_days_supply]
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 32
    col: 12
    width: 12
    height: 8
    tab_name: tab_2

  # =========================================================================
  # TAB 3: PROVIDER DISTRIBUTION & DIGITAL HEALTH ACCESS
  # =========================================================================

  - title: Active Providers in High-Poverty Counties
    name: Active Providers in High-Poverty Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [spi_roots.number_of_doctors]
    filters:
      county_census_dt.poverty_tier: "High Poverty (20-40%)"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 0
    col: 0
    width: 24
    height: 4
    tab_name: tab_3

  - title: Standard Therapy Prescriptions by Prescriber Specialty in High-Poverty Counties
    name: Standard Therapy Prescriptions by Prescriber Specialty in High-Poverty Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, spi_roots.specialty, rx_fact.count]
    pivots: [spi_roots.specialty]
    filters:
      rx_fact.days_supply_tier: "2. Standard Retail (16-30 Days)"
      county_census_dt.poverty_tier: "High Poverty (20-40%)"
    sorts: [dates.date_month asc]
    limit: 10
    column_limit: 50
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 4
    col: 0
    width: 12
    height: 8
    tab_name: tab_3

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 4
    col: 12
    width: 12
    height: 8
    tab_name: tab_3

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 12
    col: 0
    width: 12
    height: 8
    tab_name: tab_3

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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 12
    col: 12
    width: 12
    height: 8
    tab_name: tab_3

  - title: Prior Authorization Activation Share in Low-Income Counties
    name: Prior Authorization Activation Share in Low-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [rx_fact.count, spi_roots.is_epa_activated_current_jan]
    filters:
      county_census_dt.income_tier: "Under 35k"
    sorts: [rx_fact.count desc]
    limit: 5000
    column_limit: 50
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 20
    col: 0
    width: 12
    height: 8
    tab_name: tab_3

  - title: ePA Activation Rate vs County Poverty Rate
    name: ePA Activation Rate vs County Poverty Rate
    model: rx_data_google
    explore: prescriptions
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.poverty_rate, spi_roots.epa_activation_rate]
    sorts: [county_census_dt.poverty_rate desc]
    limit: 500
    listen:
      Fulfillment Date: prescriptions.rx_date
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: ndcs.therapeutic
      Targeted Disease: ndcs.disease
      Brand Name: ndcs.brand_name
      Age Group: prescriptions.age_group
      Dispenser Class: prescriptions.dispenser_class
      Prescriber Specialty: spi_roots.specialty
      Days Supply: prescriptions.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 20
    col: 12
    width: 12
    height: 8
    tab_name: tab_3

  - title: Top 10 Prescribing Specialties in Low-Income Counties
    name: Top 10 Prescribing Specialties in Low-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.specialty, rx_fact.count]
    filters:
      county_census_dt.income_tier: "Under 35k"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 28
    col: 0
    width: 12
    height: 8
    tab_name: tab_3

  - title: Top 10 Prescribing Specialties in High-Income Counties
    name: Top 10 Prescribing Specialties in High-Income Counties
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.specialty, rx_fact.count]
    filters:
      county_census_dt.income_tier: "150k+"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 28
    col: 12
    width: 12
    height: 8
    tab_name: tab_3

  - title: County Correlation - Provider Access vs Median Household Income
    name: County Correlation - Provider Access vs Median Household Income
    model: rx_data_google
    explore: spi_roots
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.average_median_income, spi_roots.number_of_doctors]
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
      Age Group: prescriptions.age_group
      Dispenser Class: prescriptions.dispenser_class
      Prescriber Specialty: spi_roots.specialty
      Days Supply: prescriptions.days_supply
      Medication Generic Name: prescriptions.generic_name
    row: 36
    col: 0
    width: 24
    height: 8
    tab_name: tab_3

  - title: County Correlation - RTPB Adoption Rate vs Poverty Rate
    name: County Correlation - RTPB Adoption Rate vs Poverty Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [county_census_dt.clean_county_name, county_census_dt.poverty_rate, rx_fact.rtpb_adoption_rate]
    sorts: [county_census_dt.poverty_rate desc]
    limit: 500
    column_limit: 50
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 44
    col: 0
    width: 12
    height: 8
    tab_name: tab_3

  - title: High-Volume Prescribers in Under-Served Counties - Low Income
    name: High-Volume Prescribers in Under-Served Counties - Low Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.primary_common_name, spi_roots.specialty, rx_fact.count, rx_fact.average_days_supply]
    filters:
      county_census_dt.income_tier: "Under 35k"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 44
    col: 12
    width: 12
    height: 8
    tab_name: tab_3

  - title: Vulnerable Regions Audit - High Poverty and High Volume of Prescriptions
    name: Vulnerable Regions Audit - High Poverty and High Volume of Prescriptions
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [county_census_dt.state, county_census_dt.clean_county_name, county_census_dt.poverty_rate, rx_fact.count]
    sorts: [rx_fact.count desc, county_census_dt.poverty_rate desc]
    limit: 50
    column_limit: 50
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 52
    col: 0
    width: 12
    height: 8
    tab_name: tab_3

  - title: Top 15 Vulnerable Counties by Volume and Poverty Rate
    name: Top 15 Vulnerable Counties by Volume and Poverty Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [county_census_dt.clean_county_name, county_census_dt.poverty_rate, rx_fact.count]
    filters:
      county_census_dt.poverty_tier: "High Poverty (20-40%),Extreme Poverty (40%+)"
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
      Days Supply: rx_fact.days_supply
      Medication Generic Name: ndcs.generic_name
    row: 52
    col: 12
    width: 12
    height: 8
    tab_name: tab_3

  # =========================================================================
  # DASHBOARD FILTER CONFIGURATIONS
  # =========================================================================

  filters:
  - name: Fulfillment Date
    title: Fulfillment Date
    type: field_filter
    default_value: 2 years
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
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
    default_value: ""
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: rx_data_google
    explore: rx_normalized_analytics
    listens_to_filters: []
    field: ndcs.generic_name
