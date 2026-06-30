view: spi_roots {
  sql_table_name: `Rx_Data.spi_roots_1` ;;
  drill_fields: [spi_root_pk]

  dimension: spi_root_pk {
    primary_key: yes
    label: "SPI Root PK"
    description: "The unique primary key for the prescriber record"
    synonyms: ["provider key", "pk"]
    type: number
    sql: ${TABLE}.spi_root_pk ;;
  }
  dimension: city {
    group_label: "Location"
    label: "City"
    description: "The city where the prescriber's clinic is located"
    synonyms: ["provider city", "doctor city"]
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: county {
    group_label: "Location"
    label: "County"
    description: "The county where the prescriber's clinic is located"
    synonyms: ["provider county", "doctor county"]
    type: string
    sql: ${TABLE}.County ;;
  }
  dimension: decile_elg_req {
    label: "Decile Eligibility Requirements"
    description: "The decile eligibility requirements for the prescriber"
    type: string
    sql: ${TABLE}.Decile_ElgReq ;;
  }
  dimension: decile_epa_i_req {
    label: "Decile EPA iReq"
    description: "The decile Electronic Prior Authorization requirements for the prescriber"
    type: string
    sql: ${TABLE}.Decile_EPA_iReq ;;
  }
  dimension: decile_routing {
    group_label: "Decile Routing"
    label: "Decile Routing"
    description: "The decile routing category for the prescriber"
    type: string
    sql: ${TABLE}.Decile_Routing ;;
  }
  dimension: decile_routing_cm_4 {
    group_label: "Decile Routing"
    # Dynamically calculates Current Year - 4 (e.g., 2022 when the current year is 2026)
    label: "Decile Routing {{ 'now' | date: '%Y' | minus: 4 }}"
    description: "The decile routing category for the prescriber in {{ 'now' | date: '%Y' | minus: 4 }}"
    type: string
    sql: ${TABLE}.Decile_Routing_2019 ;;
  }
  dimension: decile_routing_cm_3 {
    group_label: "Decile Routing"
    # Dynamically calculates Current Year - 3 (e.g., 2023 when the current year is 2026)
    label: "Decile Routing {{ 'now' | date: '%Y' | minus: 3 }}"
    description: "The decile routing category for the prescriber in {{ 'now' | date: '%Y' | minus: 3 }}"
    type: string
    sql: ${TABLE}.Decile_Routing_2020 ;;
  }
  dimension: decile_routing_cm_2 {
    group_label: "Decile Routing"
    # Dynamically calculates Current Year - 2 (e.g., 2024 when the current year is 2026)
    label: "Decile Routing {{ 'now' | date: '%Y' | minus: 2 }}"
    description: "The decile routing category for the prescriber in {{ 'now' | date: '%Y' | minus: 2 }}"
    type: string
    sql: ${TABLE}.Decile_Routing_2021 ;;
  }
  dimension: decile_routing_cm_1 {
    group_label: "Decile Routing"
    # Dynamically calculates Current Year - 1 (e.g., 2025 when the current year is 2026)
    label: "Decile Routing {{ 'now' | date: '%Y' | minus: 1 }}"
    description: "The decile routing category for the prescriber in {{ 'now' | date: '%Y' | minus: 1 }}"
    type: string
    sql: ${TABLE}.Decile_Routing_2022 ;;
  }
  dimension: decile_routing_cy {
    group_label: "Decile Routing"
    # Dynamically calculates the Current Year (e.g., 2026)
    label: "Decile Routing {{ 'now' | date: '%Y' }}"
    description: "The decile routing category for the prescriber in {{ 'now' | date: '%Y' }}"
    type: string
    sql: ${TABLE}.Decile_Routing_2023 ;;
  }
  dimension: decile_rtpb {
    label: "Decile RTPB"
    description: "The Real-Time Prescription Benefit eligibility decile for the prescriber"
    type: string
    sql: ${TABLE}.Decile_RTPB ;;
  }
  dimension: is_epa_activated_current_jan {
    # Dynamically calculates Jan of Current Year (e.g., Jan 2026)
    label: "Is EPA Activated (Jan {{ 'now' | date: '%Y' }})"
    description: "Indicates whether Electronic Prior Authorization was active as of January {{ 'now' | date: '%Y' }}"
    synonyms: ["electronic prior auth activated"]
    type: yesno
    sql: (${TABLE}.Is_EPA_Activated_202301) = '1' ;;
    # html: {% if value == 1 %} True {% elsif value == 0 %} False {% else %} {{rendered_value}} {% endif %} ;;
  }
  dimension: is_physician {
    group_label: "Is Physician"
    label: "Is Physician"
    description: "Indicates if the provider is classified as a physician"
    synonyms: ["is doctor", "physician flag"]
    type: string
    sql: ${TABLE}.Is_Physician ;;
  }
  dimension: is_physician_cm_4 {
    group_label: "Is Physician"
    label: "Is Physician {{ 'now' | date: '%Y' | minus: 4 }}"
    description: "Indicates if the provider was classified as a physician in {{ 'now' | date: '%Y' | minus: 4 }}"
    type: string
    sql: ${TABLE}.Is_physician_2019 ;;
  }
  dimension: is_physician_cm_3 {
    group_label: "Is Physician"
    label: "Is Physician {{ 'now' | date: '%Y' | minus: 3 }}"
    description: "Indicates if the provider was classified as a physician in {{ 'now' | date: '%Y' | minus: 3 }}"
    type: string
    sql: ${TABLE}.Is_physician_2020 ;;
  }
  dimension: is_physician_cm_2 {
    group_label: "Is Physician"
    label: "Is Physician {{ 'now' | date: '%Y' | minus: 2 }}"
    description: "Indicates if the provider was classified as a physician in {{ 'now' | date: '%Y' | minus: 2 }}"
    type: string
    sql: ${TABLE}.Is_physician_2021 ;;
  }
  dimension: is_physician_cm_1 {
    group_label: "Is Physician"
    label: "Is Physician {{ 'now' | date: '%Y' | minus: 1 }}"
    description: "Indicates if the provider was classified as a physician in {{ 'now' | date: '%Y' | minus: 1 }}"
    type: string
    sql: ${TABLE}.Is_physician_2022 ;;
  }
  dimension: is_physician_cy {
    group_label: "Is Physician"
    label: "Is Physician {{ 'now' | date: '%Y' }}"
    description: "Indicates if the provider was classified as a physician in {{ 'now' | date: '%Y' }}"
    type: string
    sql: ${TABLE}.Is_physician_2023 ;;
  }
  dimension: is_primary_care {
    label: "Is Primary Care Provider"
    description: "Indicates if the provider is classified as a primary care provider"
    synonyms: ["pcp", "primary care flag"]
    type: string
    sql: ${TABLE}.Is_Primary_Care ;;
  }
  dimension: primary_common_name {
    label: "Primary Common Name"
    description: "The common name for the primary provider"
    type: string
    sql: ${TABLE}.Primary_Common_Name ;;
  }
  dimension: primary_rollup_name {
    label: "Primary Rollup Name"
    description: "The rollup name associated with the primary provider"
    type: string
    sql: ${TABLE}.Primary_Rollup_Name ;;
  }
  dimension: primary_vendor_name {
    label: "Primary Vendor Name"
    description: "The vendor name associated with the primary provider"
    type: string
    sql: ${TABLE}.Primary_Vendor_Name ;;
  }
  dimension: specialty {
    group_label: "Specialization"
    label: "Specialty"
    description: "The specialization category of the provider"
    type: string
    sql: ${TABLE}.Specialty ;;
    drill_fields: [spi_root]
  }
  dimension: specialty_cm_7 {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' | minus: 7 }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' | minus: 7 }}"
    type: string
    sql: ${TABLE}.Specialty_2016 ;;
  }
  dimension: specialty_cm_6 {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' | minus: 6 }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' | minus: 6 }}"
    type: string
    sql: ${TABLE}.Specialty_2017 ;;
  }
  dimension: specialty_cm_5 {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' | minus: 5 }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' | minus: 5 }}"
    type: string
    sql: ${TABLE}.Specialty_2018 ;;
  }
  dimension: specialty_cm_4 {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' | minus: 4 }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' | minus: 4 }}"
    type: string
    sql: ${TABLE}.Specialty_2019 ;;
  }
  dimension: specialty_cm_3 {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' | minus: 3 }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' | minus: 3 }}"
    type: string
    sql: ${TABLE}.Specialty_2020 ;;
  }
  dimension: specialty_cm_2 {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' | minus: 2 }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' | minus: 2 }}"
    type: string
    sql: ${TABLE}.Specialty_2021 ;;
  }
  dimension: specialty_cm_1 {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' | minus: 1 }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' | minus: 1 }}"
    type: string
    sql: ${TABLE}.Specialty_2022 ;;
  }
  dimension: specialty_cy {
    group_label: "Specialization"
    label: "Specialty {{ 'now' | date: '%Y' }}"
    description: "The specialization category of the provider in {{ 'now' | date: '%Y' }}"
    type: string
    sql: ${TABLE}.Specialty_2023 ;;
  }
  dimension: specialty_specialization_cm_7 {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' | minus: 7 }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' | minus: 7 }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2016 ;;
  }
  dimension: specialty_specialization_cm_6 {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' | minus: 6 }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' | minus: 6 }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2017 ;;
  }
  dimension: specialty_specialization_cm_5 {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' | minus: 5 }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' | minus: 5 }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2018 ;;
  }
  dimension: specialty_specialization_cm_4 {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' | minus: 4 }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' | minus: 4 }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2019 ;;
  }
  dimension: specialty_specialization_cm_3 {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' | minus: 3 }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' | minus: 3 }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2020 ;;
  }
  dimension: specialty_specialization_cm_2 {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' | minus: 2 }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' | minus: 2 }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2021 ;;
  }
  dimension: specialty_specialization_cm_1 {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' | minus: 1 }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' | minus: 1 }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2022 ;;
  }
  dimension: specialty_specialization_cy {
    group_label: "Specialization"
    label: "Sub Specialization {{ 'now' | date: '%Y' }}"
    description: "The specialization sub-category of the provider in {{ 'now' | date: '%Y' }}"
    type: string
    sql: ${TABLE}.Specialty_specialization_2023 ;;
  }
  dimension: spi_root {
    label: "SPI Root"
    description: "The unique Standard Provider Identifier root code for the doctor"
    synonyms: ["provider npi", "npi", "spi root"]
    type: string
    sql: ${TABLE}.SPI_Root ;;
  }
  dimension: spiroot_zip_income_per_household {
    label: "SPI Root ZIP Household Income"
    description: "The median household income for the ZIP code of the prescriber's clinic"
    synonyms: ["household income", "zip income"]
    type: string
    sql: ${TABLE}.SPIRoot_Zip_Income_Per_Household ;;
  }
  dimension: state {
    group_label: "Location"
    label: "State"
    description: "The US state abbreviation of the prescriber's clinic location"
    synonyms: ["provider state", "doctor state"]
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.State ;;
  }
  dimension: status_cm_3 {
    group_label: "Status"
    label: "Status {{ 'now' | date: '%Y' | minus: 3 }}"
    description: "The prescriber's professional status in {{ 'now' | date: '%Y' | minus: 3 }}"
    type: string
    sql: ${TABLE}.Status_2020 ;;
  }
  dimension: status_cm_2 {
    group_label: "Status"
    label: "Status {{ 'now' | date: '%Y' | minus: 2 }}"
    description: "The prescriber's professional status in {{ 'now' | date: '%Y' | minus: 2 }}"
    type: string
    sql: ${TABLE}.Status_2021 ;;
  }
  dimension: status_cm_1 {
    group_label: "Status"
    label: "Status {{ 'now' | date: '%Y' | minus: 1 }}"
    description: "The prescriber's professional status in {{ 'now' | date: '%Y' | minus: 1 }}"
    type: string
    sql: ${TABLE}.Status_2022 ;;
  }
  dimension: status_cy {
    group_label: "Status"
    label: "Status {{ 'now' | date: '%Y' }}"
    description: "The prescriber's professional status in {{ 'now' | date: '%Y' }}"
    type: string
    sql: ${TABLE}.Status_2023 ;;
  }
  dimension: title {
    group_label: "Title"
    label: "Title"
    description: "The professional title or degree of the prescriber (e.g. MD, DO)"
    synonyms: ["credentials", "degree"]
    type: string
    sql: ${TABLE}.Title ;;
  }
  dimension: title_cm_4 {
    group_label: "Title"
    label: "Title {{ 'now' | date: '%Y' | minus: 4 }}"
    description: "The professional title or degree of the prescriber in {{ 'now' | date: '%Y' | minus: 4 }}"
    type: string
    sql: ${TABLE}.Title_2019 ;;
  }
  dimension: title_cm_3 {
    group_label: "Title"
    label: "Title {{ 'now' | date: '%Y' | minus: 3 }}"
    description: "The professional title or degree of the prescriber in {{ 'now' | date: '%Y' | minus: 3 }}"
    type: string
    sql: ${TABLE}.Title_2020 ;;
  }
  dimension: title_cm_2 {
    group_label: "Title"
    label: "Title {{ 'now' | date: '%Y' | minus: 2 }}"
    description: "The professional title or degree of the prescriber in {{ 'now' | date: '%Y' | minus: 2 }}"
    type: string
    sql: ${TABLE}.Title_2021 ;;
  }
  dimension: title_cm_1 {
    group_label: "Title"
    label: "Title {{ 'now' | date: '%Y' | minus: 1 }}"
    description: "The professional title or degree of the prescriber in {{ 'now' | date: '%Y' | minus: 1 }}"
    type: string
    sql: ${TABLE}.Title_2022 ;;
  }
  dimension: title_cy {
    group_label: "Title"
    label: "Title {{ 'now' | date: '%Y' }}"
    description: "The professional title or degree of the prescriber in {{ 'now' | date: '%Y' }}"
    type: string
    sql: ${TABLE}.Title_2023 ;;
  }
  dimension: zip {
    group_label: "Location"
    label: "ZIP Code"
    description: "The postal ZIP code of the prescriber's clinic location"
    synonyms: ["provider zip", "doctor zip", "postal code"]
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }
  measure: count {
    hidden: yes
    label: "Prescriber Count"
    description: "The total number of prescriber records"
    type: count
    drill_fields: [spi_root_pk, primary_rollup_name, primary_common_name, primary_vendor_name]
  }
  measure: number_of_doctors {
    label: "Number of Doctors"
    description: "The distinct count of unique doctors based on provider NPI/SPI Root"
    synonyms: ["total doctors", "doctor count", "provider count"]
    type: count_distinct
    sql: ${spi_root_pk} ;;
    value_format_name: decimal_0
  }
}
