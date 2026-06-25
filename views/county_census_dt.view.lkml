view: county_census_dt {

  # =========================================================================
  # DERIVED TABLE SOURCE CONFIGURATION
  # =========================================================================
  derived_table: {
    sql:
    SELECT
      --- BASE DEMOGRAPHIC ---
      c.total_pop,
      c.median_age,
      c.male_pop,
      c.female_pop,
      c.female_85_and_over,
      c.male_85_and_over,
      --- GEOGRAPHIC PROFILE ---
      c.geo_id,
      INITCAP(g.county_name) AS clean_county_name,
      g.county_geom,
      g.int_point_lat,
      g.int_point_lon,
      g.cbsa_fips_code,
      s.state,
      s.state_name,
      g.area_land_meters,
      --- ECONOMIC & FINANCIAL INIDICATORS  ---
      c.median_income,
      c.income_per_capita,
      c.gini_index,
      c.households_public_asst_or_food_stamps,
      --- LANGUAGE BARRIER ---
      c.speak_spanish_at_home_low_english,
      --- ACCESS, MOBILITY, & HOUSING INDICATORS ---
      c.households,
      c.owner_occupied_housing_units_median_value,
      c.median_rent,
      c.vacant_housing_units,
      c.no_cars AS households_no_cars,
      c.employed_education_health_social,
      c.group_quarters,
      --- RACE & ETHNICITY ---
      c.white_pop,
      c.black_pop,
      c.asian_pop,
      c.hispanic_pop,
      --- EDUCATION & HEALTH LITERACY INDICATORS ---
      c.graduate_professional_degree,
      c.less_than_high_school_graduate
    FROM `bigquery-public-data.census_bureau_acs.county_2020_5yr` c
    LEFT JOIN `bigquery-public-data.geo_us_boundaries.counties` g
      ON c.geo_id = g.geo_id
    LEFT JOIN `bigquery-public-data.geo_us_boundaries.states` s
      ON g.geo_id = s.geo_id
    ;;
  }

  # =========================================================================
  # INTERNAL SYSTEM JOIN KEYS & IDENTIFIERS (HIDDEN)
  # =========================================================================

  dimension: geo_id {
    type: string
    primary_key: yes
    hidden: yes
    description: "Full geographic federal FIPS identifier for the specific county territory."
    sql: ${TABLE}.geo_id ;;
  }

  dimension: county_fips_code {
    type: string
    label: "Territory FIPS Code Identifier"
    description: "Standard three-digit federal geographic territory processing indexing code layout for county lookup."
    sql: SUBSTRING(${TABLE}.geo_id, 3, 3) ;;
  }

  # =========================================================================
  # GEOGRAPHIC PROFILE DIMENSIONS (VISIBLE)
  # =========================================================================

  dimension: clean_county_name {
    type: string
    label: "County Name"
    description: "Standardized mixed-case county name."
    sql: ${TABLE}.clean_county_name ;;
  }

  dimension: state {
    type: string
    label: "State Abbreviation"
    description: "Two-letter state postal abbreviation."
    sql: ${TABLE}.state ;;
  }

  dimension: state_name {
    type: string
    label: "State Name"
    description: "Full name of the state."
    sql: ${TABLE}.state_name ;;
  }

  dimension: cbsa_fips_code {
    type: string
    label: "CBSA FIPS Code"
    description: "Core-Based Statistical Area federal ID grouping."
    sql: ${TABLE}.cbsa_fips_code ;;
  }

  dimension: county_geom {
    type: string
    hidden: yes
    description: "Polygon cordinates for the county."
    sql: ${TABLE}.county_geom ;;
  }

  dimension: county_centroid {
    type: location
    label: "County Centroid Map Pivot"
    description: "Geographical center-point coordinates of the county. Perfect for Bubble Map plots."
    sql_latitude: ${TABLE}.int_point_lat ;;
    sql_longitude: ${TABLE}.int_point_lon ;;
  }

  # =========================================================================
  # RAW NUMERIC DIMENSIONS (HIDDEN)
  # =========================================================================

  dimension: total_pop_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.total_pop ;;
  }

  dimension: median_age_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.median_age ;;
  }

  dimension: male_pop_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.male_pop ;;
  }

  dimension: female_pop_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.female_pop ;;
  }

  dimension: female_85_and_over_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.female_85_and_over ;;
  }

  dimension: male_85_and_over_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.male_85_and_over ;;
  }

  dimension: area_land_meters_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.area_land_meters ;;
  }

  dimension: median_income_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.median_income ;;
  }

  dimension: income_per_capita_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.income_per_capita ;;
  }

  dimension: gini_index_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.gini_index ;;
  }

  dimension: households_public_asst_or_food_stamps_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.households_public_asst_or_food_stamps ;;
  }

  dimension: speak_spanish_at_home_low_english_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.speak_spanish_at_home_low_english ;;
  }

  dimension: households_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.households ;;
  }

  dimension: owner_occupied_housing_units_median_value_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.owner_occupied_housing_units_median_value ;;
  }

  dimension: median_rent_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.median_rent ;;
  }

  dimension: vacant_housing_units_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.vacant_housing_units ;;
  }

  dimension: households_no_cars_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.households_no_cars ;;
  }

  dimension: employed_education_health_social_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.employed_education_health_social ;;
  }

  dimension: group_quarters_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.group_quarters ;;
  }

  dimension: white_pop_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.white_pop ;;
  }

  dimension: black_pop_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.black_pop ;;
  }

  dimension: asian_pop_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.asian_pop ;;
  }

  dimension: hispanic_pop_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.hispanic_pop ;;
  }

  dimension: graduate_professional_degree_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.graduate_professional_degree ;;
  }

  dimension: less_than_high_school_graduate_raw {
    type: number
    hidden: yes
    sql: ${TABLE}.less_than_high_school_graduate ;;
  }

  # =========================================================================
  # AGGREGATE MEASURES
  # =========================================================================

  measure: count {
    type: count
    label: "Count of Counties"
    description: "The total number of unique county territories grouped in the current dataset."
  }

  measure: total_population {
    type: sum
    label: "Total Population"
    value_format_name: decimal_0
    description: "Total headcount population size drawn directly from Census updates. Used as a denominator for prescription rates."
    sql: ${total_pop_raw} ;;
  }

  measure: average_median_age {
    type: average
    label: "Average Median Age"
    value_format_name: decimal_1
    description: "The average of median age profiles indicating age density, aligning specific drug brands with target demographic profiles."
    sql: ${median_age_raw} ;;
  }

  measure: total_male_population {
    type: sum
    label: "Total Male Population"
    value_format_name: decimal_0
    description: "Total male resident count."
    sql: ${male_pop_raw} ;;
  }

  measure: total_female_population {
    type: sum
    label: "Total Female Population"
    value_format_name: decimal_0
    description: "Total female resident count."
    sql: ${female_pop_raw} ;;
  }

  measure: total_female_85_and_over {
    type: sum
    label: "Total Female 85+ Population"
    value_format_name: decimal_0
    description: "Total female population aged 85 and over. Crucial for geriatric and chronic polypharmacy tracking."
    sql: ${female_85_and_over_raw} ;;
  }

  measure: total_male_85_and_over {
    type: sum
    label: "Total Male 85+ Population"
    value_format_name: decimal_0
    description: "Total male population aged 85 and over. Crucial for geriatric and chronic polypharmacy tracking."
    sql: ${male_85_and_over_raw} ;;
  }

  measure: total_land_area_sq_miles {
    type: sum
    label: "Total Land Area (Sq Miles)"
    value_format_name: decimal_1
    description: "Total land area converted from square meters to square miles. Used to analyze patient geographic densities."
    sql: ${area_land_meters_raw} * 0.0000003861022 ;;
  }

  measure: average_median_income {
    type: average
    label: "Average Median Income"
    value_format_name: usd_0
    description: "The calculated average median household income. Informs patient purchasing power index."
    sql: ${median_income_raw} ;;
  }

  measure: average_income_per_capita {
    type: average
    label: "Average Income per Capita"
    value_format_name: usd_0
    description: "Average per-capita income indicator for private-payer and premium brand positioning."
    sql: ${income_per_capita_raw} ;;
  }

  measure: average_gini_index {
    type: average
    label: "Average Gini Index"
    value_format_name: decimal_3
    description: "The average income inequality Gini coefficient tracking structural dispersion across select markets."
    sql: ${gini_index_raw} ;;
  }

  measure: total_households_on_public_assistance {
    type: sum
    label: "Total Households on Public Assistance"
    value_format_name: decimal_0
    description: "Total households receiving public assistance or food stamps. Acts as a proxy for Medicaid prescribing patterns."
    sql: ${households_public_asst_or_food_stamps_raw} ;;
  }

  measure: total_spanish_speakers_low_english {
    type: sum
    label: "Total Spanish Speakers with Low English"
    value_format_name: decimal_0
    description: "Total population speaking Spanish with low English proficiency. Crucial for deploying multilingual compliance materials."
    sql: ${speak_spanish_at_home_low_english_raw} ;;
  }

  measure: total_households {
    type: sum
    label: "Total Households"
    value_format_name: decimal_0
    description: "Total active domestic household units count."
    sql: ${households_raw} ;;
  }

  measure: average_median_home_value {
    type: average
    label: "Average Median Home Value"
    value_format_name: usd_0
    description: "The average of median home values of owner-occupied units. Measures family wealth indices."
    sql: ${owner_occupied_housing_units_median_value_raw} ;;
  }

  measure: average_median_rent {
    type: average
    label: "Average Median Gross Rent"
    value_format_name: usd_0
    description: "The average of median monthly gross rent values."
    sql: ${median_rent_raw} ;;
  }

  measure: total_vacant_units {
    type: sum
    label: "Total Vacant Housing Units"
    value_format_name: decimal_0
    description: "Total vacant residential properties volume."
    sql: ${vacant_housing_units_raw} ;;
  }

  measure: total_households_no_cars {
    type: sum
    label: "Total Households with No Cars"
    value_format_name: decimal_0
    description: "Total households with zero vehicles. Primary marker for transportation barriers to medication adherence."
    sql: ${households_no_cars_raw} ;;
  }

  measure: total_employed_healthcare_social {
    type: sum
    label: "Total Employed in Healthcare/Social Services"
    value_format_name: decimal_0
    description: "Total county residents employed in healthcare and social assistances. Signals density of local clinics."
    sql: ${employed_education_health_social_raw} ;;
  }

  measure: total_population_in_group_quarters {
    type: sum
    label: "Total Population in Group Quarters"
    value_format_name: decimal_0
    description: "Total population living in long-term group settings (highly correlated with nursing home and LTC institutional prescribing)."
    sql: ${group_quarters_raw} ;;
  }

  measure: total_white_population {
    type: sum
    label: "Total White Population"
    value_format_name: decimal_0
    sql: ${white_pop_raw} ;;
  }

  measure: total_black_population {
    type: sum
    label: "Total Black Population"
    value_format_name: decimal_0
    sql: ${black_pop_raw} ;;
  }

  measure: total_asian_population {
    type: sum
    label: "Total Asian Population"
    value_format_name: decimal_0
    sql: ${asian_pop_raw} ;;
  }

  measure: total_hispanic_population {
    type: sum
    label: "Total Hispanic Population"
    value_format_name: decimal_0
    sql: ${hispanic_pop_raw} ;;
  }

  measure: total_graduate_professional_degree {
    type: sum
    label: "Total with Graduate/Professional Degrees"
    value_format_name: decimal_0
    description: "Total population with advanced degrees. Correlates with high health literacy and strong response to brand campaigns."
    sql: ${graduate_professional_degree_raw} ;;
  }

  measure: total_less_than_high_school_graduate {
    type: sum
    label: "Total with Less Than High School Education"
    value_format_name: decimal_0
    description: "Total population without a high school diploma. Serves as a risk indicator for low health literacy."
    sql: ${less_than_high_school_graduate_raw} ;;
  }
}
