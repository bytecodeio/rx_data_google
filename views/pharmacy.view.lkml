view: pharmacy {
  sql_table_name: `Rx_Data.pharmacy` ;;
  drill_fields: [pharmacy_pk]

  dimension: pharmacy_pk {
    primary_key: yes
    hidden: yes
    label: "Pharmacy PK"
    description: "The unique internal primary key for the pharmacy record"
    synonyms: ["pharmacy_key", "pk"]
    type: number
    sql: ${TABLE}.pharmacy_pk ;;
  }
  dimension: city {
    label: "Pharmacy City"
    description: "The city where the pharmacy is located"
    synonyms: ["pharmacy_city"]
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: dispenser_class {
    label: "Dispenser Class"
    description: "The dispenser class category (e.g. Retail, Mail Order, Specialty)"
    synonyms: ["pharmacy_class"]
    type: string
    sql: ${TABLE}.Dispenser_Class ;;
  }
  dimension: dispenser_type {
    label: "Dispenser Type"
    description: "The detailed dispenser sub-type description"
    synonyms: ["pharmacy_type"]
    type: string
    sql: ${TABLE}.Dispenser_Type ;;
  }
  dimension: ncpdpid {
    label: "NCPDPID"
    description: "The National Council for Prescription Drug Programs pharmacy identifier"
    synonyms: ["pharmacy_npi", "store_id", "ncpdp"]
    type: string
    sql: ${TABLE}.NCPDPID ;;
  }
  dimension: state {
    label: "Pharmacy State"
    description: "The US state state abbreviation for the pharmacy location"
    synonyms: ["pharmacy_state"]
    type: string
    sql: ${TABLE}.State ;;
  }
  dimension: zip {
    label: "Pharmacy ZIP"
    description: "The postal ZIP code for the pharmacy location"
    synonyms: ["pharmacy_zip", "postal_code"]
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }
  measure: count {
    hidden: yes
    label: "Pharmacy Row Count"
    description: "The total number of pharmacy records"
    type: count
    drill_fields: [pharmacy_pk]
  }
  measure: number_of_pharmacies {
    label: "Number of Pharmacies"
    description: "The distinct count of unique pharmacies based on NCPDPID"
    synonyms: ["total_pharmacies", "distinct_stores"]
    type: count_distinct
    sql: ${ncpdpid} ;;
    value_format_name: decimal_2
  }
}
