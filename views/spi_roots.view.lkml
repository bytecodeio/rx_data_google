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
  dimension: decile_routing_2021 {
    group_label: "Decile Routing"
    label: "Decile Routing 2021"
    description: "The decile routing category for the prescriber in 2021"
    type: string
    sql: ${TABLE}.Decile_Routing_2019 ;;
  }
  dimension: decile_routing_2022 {
    group_label: "Decile Routing"
    label: "Decile Routing 2022"
    description: "The decile routing category for the prescriber in 2022"
    type: string
    sql: ${TABLE}.Decile_Routing_2020 ;;
  }
  dimension: decile_routing_2023 {
    group_label: "Decile Routing"
    label: "Decile Routing 2023"
    description: "The decile routing category for the prescriber in 2023"
    type: string
    sql: ${TABLE}.Decile_Routing_2021 ;;
  }
  dimension: decile_routing_2024 {
    group_label: "Decile Routing"
    label: "Decile Routing 2024"
    description: "The decile routing category for the prescriber in 2024"
    type: string
    sql: ${TABLE}.Decile_Routing_2022 ;;
  }
  dimension: decile_routing_2025 {
    group_label: "Decile Routing"
    label: "Decile Routing 2025"
    description: "The decile routing category for the prescriber in 2025"
    type: string
    sql: ${TABLE}.Decile_Routing_2023 ;;
  }
  dimension: decile_rtpb {
    label: "Decile RTPB"
    description: "The Real-Time Prescription Benefit eligibility decile for the prescriber"
    type: string
    sql: ${TABLE}.Decile_RTPB ;;
  }
  dimension: is_epa_activated_202501 {
    label: "Is EPA Activated (Jan 2025)"
    description: "Indicates whether Electronic Prior Authorization was active as of January 2025"
    synonyms: ["electronic prior auth activated"]
    type: string
    sql: ${TABLE}.Is_EPA_Activated_202301 ;;
  }
  dimension: is_physician {
    group_label: "Is Physician"
    label: "Is Physician"
    description: "Indicates if the provider is classified as a physician"
    synonyms: ["is doctor", "physician flag"]
    type: string
    sql: ${TABLE}.Is_Physician ;;
  }
  dimension: is_physician_2021 {
    group_label: "Is Physician"
    label: "Is Physician 2021"
    description: "Indicates if the provider was classified as a physician in 2021"
    type: string
    sql: ${TABLE}.Is_physician_2019 ;;
  }
  dimension: is_physician_2022 {
    group_label: "Is Physician"
    label: "Is Physician 2022"
    description: "Indicates if the provider was classified as a physician in 2022"
    type: string
    sql: ${TABLE}.Is_physician_2020 ;;
  }
  dimension: is_physician_2023 {
    group_label: "Is Physician"
    label: "Is Physician 2023"
    description: "Indicates if the provider was classified as a physician in 2023"
    type: string
    sql: ${TABLE}.Is_physician_2021 ;;
  }
  dimension: is_physician_2024 {
    group_label: "Is Physician"
    label: "Is Physician 2024"
    description: "Indicates if the provider was classified as a physician in 2024"
    type: string
    sql: ${TABLE}.Is_physician_2022 ;;
  }
  dimension: is_physician_2025 {
    group_label: "Is Physician"
    label: "Is Physician 2025"
    description: "Indicates if the provider was classified as a physician in 2025"
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
  }
  dimension: specialty_2018 {
    group_label: "Specialization"
    label: "Specialty 2018"
    description: "The specialization category of the provider in 2018"
    type: string
    sql: ${TABLE}.Specialty_2016 ;;
  }
  dimension: specialty_2019 {
    group_label: "Specialization"
    label: "Specialty 2019"
    description: "The specialization category of the provider in 2019"
    type: string
    sql: ${TABLE}.Specialty_2017 ;;
  }
  dimension: specialty_2020 {
    group_label: "Specialization"
    label: "Specialty 2020"
    description: "The specialization category of the provider in 2020"
    type: string
    sql: ${TABLE}.Specialty_2018 ;;
  }
  dimension: specialty_2021 {
    group_label: "Specialization"
    label: "Specialty 2021"
    description: "The specialization category of the provider in 2021"
    type: string
    sql: ${TABLE}.Specialty_2019 ;;
  }
  dimension: specialty_2022 {
    group_label: "Specialization"
    label: "Specialty 2022"
    description: "The specialization category of the provider in 2022"
    type: string
    sql: ${TABLE}.Specialty_2020 ;;
  }
  dimension: specialty_2023 {
    group_label: "Specialization"
    label: "Specialty 2023"
    description: "The specialization category of the provider in 2023"
    type: string
    sql: ${TABLE}.Specialty_2021 ;;
  }
  dimension: specialty_2024 {
    group_label: "Specialization"
    label: "Specialty 2024"
    description: "The specialization category of the provider in 2024"
    type: string
    sql: ${TABLE}.Specialty_2022 ;;
  }
  dimension: specialty_2025 {
    group_label: "Specialization"
    label: "Specialty 2025"
    description: "The specialization category of the provider in 2025"
    type: string
    sql: ${TABLE}.Specialty_2023 ;;
  }
  dimension: specialty_specialization_2018 {
    group_label: "Specialization"
    label: "Sub Specialization 2018"
    description: "The specialization sub-category of the provider in 2018"
    type: string
    sql: ${TABLE}.Specialty_specialization_2016 ;;
  }
  dimension: specialty_specialization_2019 {
    group_label: "Specialization"
    label: "Sub Specialization 2019"
    description: "The specialization sub-category of the provider in 2019"
    type: string
    sql: ${TABLE}.Specialty_specialization_2017 ;;
  }
  dimension: specialty_specialization_2020 {
    group_label: "Specialization"
    label: "Sub Specialization 2020"
    description: "The specialization sub-category of the provider in 2020"
    type: string
    sql: ${TABLE}.Specialty_specialization_2018 ;;
  }
  dimension: specialty_specialization_2021 {
    group_label: "Specialization"
    label: "Sub Specialization 2021"
    description: "The specialization sub-category of the provider in 2021"
    type: string
    sql: ${TABLE}.Specialty_specialization_2019 ;;
  }
  dimension: specialty_specialization_2022 {
    group_label: "Specialization"
    label: "Sub Specialization 2022"
    description: "The specialization sub-category of the provider in 2022"
    type: string
    sql: ${TABLE}.Specialty_specialization_2020 ;;
  }
  dimension: specialty_specialization_2023 {
    group_label: "Specialization"
    label: "Sub Specialization 2023"
    description: "The specialization sub-category of the provider in 2023"
    type: string
    sql: ${TABLE}.Specialty_specialization_2021 ;;
  }
  dimension: specialty_specialization_2024 {
    group_label: "Specialization"
    label: "Sub Specialization 2024"
    description: "The specialization sub-category of the provider in 2024"
    type: string
    sql: ${TABLE}.Specialty_specialization_2022 ;;
  }
  dimension: specialty_specialization_2025 {
    group_label: "Specialization"
    label: "Sub Specialization 2025"
    description: "The specialization sub-category of the provider in 2025"
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
    sql: ${TABLE}.State ;;
  }
  dimension: status_2022 {
    group_label: "Status"
    label: "Status 2022"
    description: "The prescriber's professional status in 2022"
    type: string
    sql: ${TABLE}.Status_2020 ;;
  }
  dimension: status_2023 {
    group_label: "Status"
    label: "Status 2023"
    description: "The prescriber's professional status in 2023"
    type: string
    sql: ${TABLE}.Status_2021 ;;
  }
  dimension: status_2024 {
    group_label: "Status"
    label: "Status 2024"
    description: "The prescriber's professional status in 2024"
    type: string
    sql: ${TABLE}.Status_2022 ;;
  }
  dimension: status_2025 {
    group_label: "Status"
    label: "Status 2025"
    description: "The prescriber's professional status in 2025"
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
  dimension: title_2021 {
    group_label: "Title"
    label: "Title 2021"
    description: "The professional title or degree of the prescriber in 2021"
    type: string
    sql: ${TABLE}.Title_2019 ;;
  }
  dimension: title_2022 {
    group_label: "Title"
    label: "Title 2022"
    description: "The professional title or degree of the prescriber in 2022"
    type: string
    sql: ${TABLE}.Title_2020 ;;
  }
  dimension: title_2023 {
    group_label: "Title"
    label: "Title 2023"
    description: "The professional title or degree of the prescriber in 2023"
    type: string
    sql: ${TABLE}.Title_2021 ;;
  }
  dimension: title_2024 {
    group_label: "Title"
    label: "Title 2024"
    description: "The professional title or degree of the prescriber in 2024"
    type: string
    sql: ${TABLE}.Title_2022 ;;
  }
  dimension: title_2025 {
    group_label: "Title"
    label: "Title 2025"
    description: "The professional title or degree of the prescriber in 2025"
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
    value_format_name: decimal_2
  }
}
