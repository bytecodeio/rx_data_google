---
- dashboard: long_term_chronic_care_vs_socioeconomic_indicators
  title: Long-Term Chronic Care vs Socioeconomic Indicators
  preferred_viewer: dashboards-next
  crossfilter_enabled: true
  description: This advanced dashboard investigates the correlation between socioeconomic factors (income, poverty, education, unemployment) and long-term chronic healthcare utilization, RTPB adoption rates, and provider accessibility.
  layout: newspaper
  elements:
  - title: Total Prescription Volume
    name: Total Prescription Volume
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    row: 0
    col: 0
    width: 6
    height: 4
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
  - title: New Prescription Rate
    name: New Prescription Rate
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.new_rx_ratio]
    row: 0
    col: 6
    width: 6
    height: 4
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
  - title: Long-Term Care Share (61+ Days Supply)
    name: Long-Term Care Share
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [rx_fact.count]
    filters:
      rx_fact.days_supply_tier: 4. Maintenance (61+ Days)
    row: 0
    col: 12
    width: 6
    height: 4
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
  - title: Avg Household Income of Served Areas
    name: Avg Household Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [county_census_dt.average_median_income]
    row: 0
    col: 18
    width: 6
    height: 4
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
  - title: Monthly Prescription Volume Trend by County Income Tier
    name: Prescription Volume Trend by Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_area
    fields: [dates.date_month, county_census_dt.income_tier, rx_fact.count]
    pivots: [county_census_dt.income_tier]
    sorts: [dates.date_month asc]
    row: 4
    col: 0
    width: 12
    height: 8
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
  - title: New Rx Start Rate Trend by County Poverty Level
    name: New Rx Rate Trend by Poverty Level
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, county_census_dt.poverty_tier, rx_fact.new_rx_ratio]
    pivots: [county_census_dt.poverty_tier]
    sorts: [dates.date_month asc]
    row: 4
    col: 12
    width: 12
    height: 8
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
  - title: Top Chronic Diseases in Low-Income Counties
    name: Chronic Diseases Low Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, rx_fact.count]
    filters:
      county_census_dt.income_tier: Low
    sorts: [rx_fact.count desc]
    limit: 10
    row: 12
    col: 0
    width: 12
    height: 8
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
  - title: Top Chronic Diseases in High-Income Counties
    name: Chronic Diseases High Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [ndcs.disease, rx_fact.count]
    filters:
      county_census_dt.income_tier: High
    sorts: [rx_fact.count desc]
    limit: 10
    row: 12
    col: 12
    width: 12
    height: 8
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
  - title: Maintenance vs Acute Supply Tier by Target Disease
    name: Supply Tier by Disease
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [ndcs.disease, rx_fact.days_supply_tier, rx_fact.count]
    pivots: [rx_fact.days_supply_tier]
    sorts: [rx_fact.count desc]
    limit: 10
    row: 20
    col: 0
    width: 12
    height: 8
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
  - title: Long-Term Therapy Prescriptions Over Time by Prescriber Specialty
    name: Long Term Therapy by Specialty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [dates.date_month, spi_roots.specialty, rx_fact.count]
    pivots: [spi_roots.specialty]
    sorts: [dates.date_month asc]
    limit: 10
    filters:
      rx_fact.days_supply_tier: 4. Maintenance (61+ Days)
    row: 20
    col: 12
    width: 12
    height: 8
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
  - title: Distribution of Days Supply across Therapeutic Classes
    name: Days Supply Boxplot
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_boxplot
    fields: [ndcs.therapeutic, rx_fact.average_days_supply]
    sorts: [rx_fact.average_days_supply desc]
    limit: 15
    row: 28
    col: 0
    width: 12
    height: 8
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
  - title: RTPB Adoption Rate for Top Chronic Diseases
    name: RTPB Adoption by Disease
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [ndcs.disease, rx_fact.rtpb_adoption_rate]
    sorts: [rx_fact.rtpb_adoption_rate desc]
    limit: 15
    row: 28
    col: 12
    width: 12
    height: 8
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
  - title: Most Prevalent Chronic Disease
    name: Most Prevalent Disease
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [ndcs.disease, rx_fact.count]
    sorts: [rx_fact.count desc]
    limit: 1
    row: 36
    col: 0
    width: 12
    height: 8
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
  - title: Long-Term Care Share by Therapeutic Drug Class
    name: Long Term Care by Drug Class
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [ndcs.therapeutic, rx_fact.count]
    filters:
      rx_fact.days_supply_tier: 4. Maintenance (61+ Days)
    sorts: [rx_fact.count desc]
    limit: 8
    row: 36
    col: 12
    width: 12
    height: 8
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
  - title: Total Prescriptions Filled by County Poverty Level
    name: Prescriptions by Poverty Level
    model: rx_data_google
    explore: prescriptions
    type: looker_column
    fields: [county_census_dt.poverty_tier, prescriptions.number_of_prescriptions]
    sorts: [county_census_dt.poverty_tier asc]
    row: 44
    col: 0
    width: 12
    height: 8
    listen:
      Fulfillment Date: prescriptions.rx_date
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: prescriptions.therapeutic
      Targeted Disease: prescriptions.disease
      Brand Name: prescriptions.brand_name
  - title: County Correlation - RTPB Adoption Rate vs Poverty Rate
    name: RTPB vs Poverty Scatter
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.poverty_rate, rx_fact.rtpb_adoption_rate]
    sorts: [county_census_dt.poverty_rate desc]
    limit: 500
    row: 52
    col: 0
    width: 12
    height: 8
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
  - title: Top 10 Counties by Chronic Care Prescription Volume
    name: Top Counties Chronic Vol
    model: rx_data_google
    explore: prescriptions
    type: looker_bar
    fields: [prescriptions.patient_state, prescriptions.patient_county, prescriptions.number_of_prescriptions]
    filters:
      prescriptions.days_supply: ">60"
    sorts: [prescriptions.number_of_prescriptions desc]
    limit: 10
    row: 52
    col: 12
    width: 12
    height: 8
    listen:
      Fulfillment Date: prescriptions.rx_date
      Patient State: prescriptions.patient_state
      Patient County: prescriptions.patient_county
      County Income Tier: county_census_dt.income_tier
      County Poverty Tier: county_census_dt.poverty_tier
      Drug Class: prescriptions.therapeutic
      Targeted Disease: prescriptions.disease
      Brand Name: prescriptions.brand_name
  - title: Prescription Share by County Unemployment Tier
    name: Volume Share by Unemployment
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [county_census_dt.unemployment_tier, rx_fact.count]
    sorts: [rx_fact.count desc]
    row: 60
    col: 12
    width: 12
    height: 8
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
  - title: Vulnerable Counties Served Count
    name: Vulnerable Counties Count
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [county_census_dt.count]
    filters:
      county_census_dt.poverty_tier: High
    row: 68
    col: 0
    width: 12
    height: 8
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
  - title: Top 10 Prescribing Specialties in Low-Income Counties
    name: Specialties Low Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.specialty, rx_fact.count]
    filters:
      county_census_dt.income_tier: Low
    sorts: [rx_fact.count desc]
    limit: 10
    row: 68
    col: 12
    width: 12
    height: 8
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
  - title: Top 10 Prescribing Specialties in High-Income Counties
    name: Specialties High Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [spi_roots.specialty, rx_fact.count]
    filters:
      county_census_dt.income_tier: High
    sorts: [rx_fact.count desc]
    limit: 10
    row: 76
    col: 0
    width: 12
    height: 8
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
  - title: RTPB Adoption by Prescriber Decile and County Income Tier
    name: RTPB by Decile and Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [spi_roots.decile_routing_2025, county_census_dt.income_tier, rx_fact.rtpb_adoption_rate]
    pivots: [county_census_dt.income_tier]
    sorts: [spi_roots.decile_routing_2025 asc]
    row: 76
    col: 12
    width: 12
    height: 8
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
  - title: County Correlation - Provider Access vs Median Household Income
    name: Provider Count vs Income Scatter
    model: rx_data_google
    explore: spi_roots
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.average_median_income, spi_roots.number_of_doctors]
    sorts: [county_census_dt.average_median_income desc]
    limit: 500
    row: 84
    col: 0
    width: 12
    height: 8
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
  - title: High-Volume Prescribers in Under-Served Counties (Low Income)
    name: High Vol Prescribers Low Income Table
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [spi_roots.primary_common_name, spi_roots.specialty, rx_fact.count, rx_fact.average_days_supply]
    filters:
      county_census_dt.income_tier: Low
    sorts: [rx_fact.count desc]
    limit: 15
    row: 84
    col: 12
    width: 12
    height: 8
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
  - title: Active Providers in High-Poverty Counties
    name: Providers High Poverty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: single_value
    fields: [spi_roots.number_of_doctors]
    filters:
      county_census_dt.poverty_tier: High
    row: 92
    col: 0
    width: 12
    height: 8
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
  - title: Prior Authorization (ePA) Activation Share in Low-Income Counties
    name: ePA Activation Share Low Income
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_pie
    fields: [spi_roots.is_epa_activated_202501, rx_fact.count]
    filters:
      county_census_dt.income_tier: Low
    sorts: [rx_fact.count desc]
    row: 92
    col: 12
    width: 12
    height: 8
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
  - title: Geographical Heatmap - Long-Term Chronic Care Volume by State
    name: Chronic Care Volume State Heatmap
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_geo_choropleth
    fields: [pharmacy.state, rx_fact.count]
    filters:
      rx_fact.days_supply_tier: 4. Maintenance (61+ Days)
    sorts: [rx_fact.count desc]
    row: 100
    col: 0
    width: 12
    height: 8
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
  - title: Age Group Volume Distribution across County Income Tiers
    name: Age Group Volume by Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, county_census_dt.income_tier, rx_fact.count]
    pivots: [county_census_dt.income_tier]
    sorts: [age_groups.age_group asc]
    row: 100
    col: 12
    width: 12
    height: 8
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
  - title: Pharmacy Dispenser Class Share in High-Poverty Counties
    name: Dispenser Class Share High Poverty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_bar
    fields: [pharmacy.dispenser_class, rx_fact.count]
    filters:
      county_census_dt.poverty_tier: High
    sorts: [rx_fact.count desc]
    row: 108
    col: 0
    width: 12
    height: 8
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
  - title: RTPB Adoption by Patient Age Group and County Poverty Level
    name: RTPB Adoption by Age and Poverty
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_column
    fields: [age_groups.age_group, county_census_dt.poverty_tier, rx_fact.rtpb_adoption_rate]
    pivots: [county_census_dt.poverty_tier]
    sorts: [age_groups.age_group asc]
    row: 108
    col: 12
    width: 12
    height: 8
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
  - title: State-by-State New Rx Start Rate by Income Tier
    name: State New Rx by Income Tier
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_line
    fields: [pharmacy.state, county_census_dt.income_tier, rx_fact.new_rx_ratio]
    pivots: [county_census_dt.income_tier]
    sorts: [pharmacy.state asc]
    row: 116
    col: 0
    width: 12
    height: 8
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
  - title: Vulnerable Regions Audit - High Poverty, Low RTPB, High Chronic Vol
    name: Vulnerable Regions Table
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_grid
    fields: [county_census_dt.state, county_census_dt.clean_county_name, county_census_dt.poverty_rate, rx_fact.rtpb_adoption_rate, rx_fact.count]
    filters:
      rx_fact.days_supply_tier: 4. Maintenance (61+ Days)
      county_census_dt.poverty_tier: High
    sorts: [rx_fact.count desc]
    limit: 20
    row: 116
    col: 12
    width: 12
    height: 8
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
  - title: County Correlation - Population Size vs Average Days Supply
    name: Population vs Days Supply Scatter
    model: rx_data_google
    explore: rx_normalized_analytics
    type: looker_scatter
    fields: [county_census_dt.clean_county_name, county_census_dt.total_population, rx_fact.average_days_supply]
    sorts: [county_census_dt.total_population desc]
    limit: 500
    row: 124
    col: 0
    width: 24
    height: 8
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
  filters:
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
    field: ndcs.generic_name
