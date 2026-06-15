view: pharmacy {
  sql_table_name: `Rx_Data.pharmacy` ;;
  drill_fields: [pharmacy_pk]

  dimension: pharmacy_pk {
    primary_key: yes
    hidden: yes
    label: "Pharmacy PK"
    description: "The unique internal primary key for the pharmacy record"
    synonyms: ["pharmacy key", "pk"]
    type: number
    sql: ${TABLE}.pharmacy_pk ;;
  }
   parameter: selected_state {
    label: "Selected State"
    description: "Use this parameter to select a US State"
    type: string
    default_value: "NY"
    allowed_value: { value: "AL" }
    allowed_value: { value: "AK" }
    allowed_value: { value: "AZ" }
    allowed_value: { value: "AR" }
    allowed_value: { value: "CA" }
    allowed_value: { value: "CO" }
    allowed_value: { value: "CT" }
    allowed_value: { value: "DE" }
    allowed_value: { value: "FL" }
    allowed_value: { value: "GA" }
    allowed_value: { value: "HI" }
    allowed_value: { value: "ID" }
    allowed_value: { value: "IL" }
    allowed_value: { value: "IN" }
    allowed_value: { value: "IA" }
    allowed_value: { value: "KS" }
    allowed_value: { value: "KY" }
    allowed_value: { value: "LA" }
    allowed_value: { value: "ME" }
    allowed_value: { value: "MD" }
    allowed_value: { value: "MA" }
    allowed_value: { value: "MI" }
    allowed_value: { value: "MN" }
    allowed_value: { value: "MS" }
    allowed_value: { value: "MO" }
    allowed_value: { value: "MT" }
    allowed_value: { value: "NE" }
    allowed_value: { value: "NV" }
    allowed_value: { value: "NH" }
    allowed_value: { value: "NJ" }
    allowed_value: { value: "NM" }
    allowed_value: { value: "NY" }
    allowed_value: { value: "NC" }
    allowed_value: { value: "ND" }
    allowed_value: { value: "OH" }
    allowed_value: { value: "OK" }
    allowed_value: { value: "OR" }
    allowed_value: { value: "PA" }
    allowed_value: { value: "RI" }
    allowed_value: { value: "SC" }
    allowed_value: { value: "SD" }
    allowed_value: { value: "TN" }
    allowed_value: { value: "TX" }
    allowed_value: { value: "UT" }
    allowed_value: { value: "VT" }
    allowed_value: { value: "VA" }
    allowed_value: { value: "WA" }
    allowed_value: { value: "WV" }
    allowed_value: { value: "WI" }
    allowed_value: { value: "WY" }
  }
  dimension: city {
    label: "Pharmacy City"
    description: "The city where the pharmacy is located"
    synonyms: ["pharmacy city"]
    type: string
    sql: ${TABLE}.City ;;
  }
  dimension: dispenser_class {
    label: "Dispenser Class"
    description: "The dispenser class category (e.g. Retail, Mail Order, Specialty)"
    synonyms: ["pharmacy class"]
    type: string
    sql: ${TABLE}.Dispenser_Class ;;
  }
  dimension: dispenser_type {
    label: "Dispenser Type"
    description: "The detailed dispenser sub-type description"
    synonyms: ["pharmacy type"]
    type: string
    sql: ${TABLE}.Dispenser_Type ;;
  }
  dimension: ncpdpid {
    label: "NCPDPID"
    description: "The National Council for Prescription Drug Programs pharmacy identifier"
    synonyms: ["pharmacy npi", "store id", "ncpdp"]
    type: string
    sql: ${TABLE}.NCPDPID ;;
  }
  dimension: selected_state_value {
    label: "Selected State Value"
    description: "The state abbreviation currently selected in the parameter"
    type: string
    sql: {% parameter selected_state %} ;;
  }
  dimension: state {
    label: "Pharmacy State"
    description: "The US state state abbreviation for the pharmacy location"
    synonyms: ["pharmacy state"]
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.State ;;
  }
  dimension: zip {
    label: "Pharmacy ZIP"
    description: "The postal ZIP code for the pharmacy location"
    synonyms: ["pharmacy zip", "postal code"]
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
    synonyms: ["total pharmacies", "distinct stores"]
    type: count_distinct
    sql: ${ncpdpid} ;;
    value_format_name: decimal_2
  }
}
