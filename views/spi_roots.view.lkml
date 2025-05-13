view: spi_roots {
  sql_table_name: `Rx_Data.spi_roots_1` ;;
  drill_fields: [spi_root_pk]

  dimension: spi_root_pk {
    primary_key: yes
    type: number
    sql: ${TABLE}.spi_root_pk ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: county {
    type: string
    sql: ${TABLE}.County ;;
  }
  dimension: decile_elg_req {
    type: string
    sql: ${TABLE}.Decile_ElgReq ;;
  }
  dimension: decile_epa_i_req {
    type: string
    sql: ${TABLE}.Decile_EPA_iReq ;;
  }
  dimension: decile_routing {
    type: string
    sql: ${TABLE}.Decile_Routing ;;
  }
  dimension: decile_routing_2019 {
    type: string
    sql: ${TABLE}.Decile_Routing_2019 ;;
  }
  dimension: decile_routing_2020 {
    type: string
    sql: ${TABLE}.Decile_Routing_2020 ;;
  }
  dimension: decile_routing_2021 {
    type: string
    sql: ${TABLE}.Decile_Routing_2021 ;;
  }
  dimension: decile_routing_2022 {
    type: string
    sql: ${TABLE}.Decile_Routing_2022 ;;
  }
  dimension: decile_routing_2023 {
    type: string
    sql: ${TABLE}.Decile_Routing_2023 ;;
  }
  dimension: decile_rtpb {
    type: string
    sql: ${TABLE}.Decile_RTPB ;;
  }
  dimension: is_epa_activated_202301 {
    type: string
    sql: ${TABLE}.Is_EPA_Activated_202301 ;;
  }
  dimension: is_physician {
    type: string
    sql: ${TABLE}.Is_Physician ;;
  }
  dimension: is_physician_2019 {
    type: string
    sql: ${TABLE}.Is_physician_2019 ;;
  }
  dimension: is_physician_2020 {
    type: string
    sql: ${TABLE}.Is_physician_2020 ;;
  }
  dimension: is_physician_2021 {
    type: string
    sql: ${TABLE}.Is_physician_2021 ;;
  }
  dimension: is_physician_2022 {
    type: string
    sql: ${TABLE}.Is_physician_2022 ;;
  }
  dimension: is_physician_2023 {
    type: string
    sql: ${TABLE}.Is_physician_2023 ;;
  }
  dimension: is_primary_care {
    type: string
    sql: ${TABLE}.Is_Primary_Care ;;
  }
  dimension: primary_common_name {
    type: string
    sql: ${TABLE}.Primary_Common_Name ;;
  }
  dimension: primary_rollup_name {
    type: string
    sql: ${TABLE}.Primary_Rollup_Name ;;
  }
  dimension: primary_vendor_name {
    type: string
    sql: ${TABLE}.Primary_Vendor_Name ;;
  }
  dimension: specialty {
    type: string
    sql: ${TABLE}.Specialty ;;
  }
  dimension: specialty_2016 {
    type: string
    sql: ${TABLE}.Specialty_2016 ;;
  }
  dimension: specialty_2017 {
    type: string
    sql: ${TABLE}.Specialty_2017 ;;
  }
  dimension: specialty_2018 {
    type: string
    sql: ${TABLE}.Specialty_2018 ;;
  }
  dimension: specialty_2019 {
    type: string
    sql: ${TABLE}.Specialty_2019 ;;
  }
  dimension: specialty_2020 {
    type: string
    sql: ${TABLE}.Specialty_2020 ;;
  }
  dimension: specialty_2021 {
    type: string
    sql: ${TABLE}.Specialty_2021 ;;
  }
  dimension: specialty_2022 {
    type: string
    sql: ${TABLE}.Specialty_2022 ;;
  }
  dimension: specialty_2023 {
    type: string
    sql: ${TABLE}.Specialty_2023 ;;
  }
  dimension: specialty_specialization_2016 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2016 ;;
  }
  dimension: specialty_specialization_2017 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2017 ;;
  }
  dimension: specialty_specialization_2018 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2018 ;;
  }
  dimension: specialty_specialization_2019 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2019 ;;
  }
  dimension: specialty_specialization_2020 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2020 ;;
  }
  dimension: specialty_specialization_2021 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2021 ;;
  }
  dimension: specialty_specialization_2022 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2022 ;;
  }
  dimension: specialty_specialization_2023 {
    type: string
    sql: ${TABLE}.Specialty_specialization_2023 ;;
  }
  dimension: spi_root {
    type: string
    sql: ${TABLE}.SPI_Root ;;
  }
  dimension: spiroot_zip_income_per_household {
    type: string
    sql: ${TABLE}.SPIRoot_Zip_Income_Per_Household ;;
  }
  dimension: state {
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: status_2020 {
    type: string
    sql: ${TABLE}.Status_2020 ;;
  }
  dimension: status_2021 {
    type: string
    sql: ${TABLE}.Status_2021 ;;
  }
  dimension: status_2022 {
    type: string
    sql: ${TABLE}.Status_2022 ;;
  }
  dimension: status_2023 {
    type: string
    sql: ${TABLE}.Status_2023 ;;
  }
  dimension: title {
    type: string
    sql: ${TABLE}.Title ;;
  }
  dimension: title_2019 {
    type: string
    sql: ${TABLE}.Title_2019 ;;
  }
  dimension: title_2020 {
    type: string
    sql: ${TABLE}.Title_2020 ;;
  }
  dimension: title_2021 {
    type: string
    sql: ${TABLE}.Title_2021 ;;
  }
  dimension: title_2022 {
    type: string
    sql: ${TABLE}.Title_2022 ;;
  }
  dimension: title_2023 {
    type: string
    sql: ${TABLE}.Title_2023 ;;
  }
  dimension: zip {
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: [spi_root_pk, primary_rollup_name, primary_common_name, primary_vendor_name]
  }
  measure: number_of_doctors {
    label: "Number of Doctors"
    type: count_distinct
    sql: ${spi_root_pk} ;;
    value_format_name: decimal_2
  }
}
