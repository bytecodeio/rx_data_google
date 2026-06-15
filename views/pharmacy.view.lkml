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
    allowed_value: { label: "Alabama" value: "AL" }
    allowed_value: { label: "Alaska" value: "AK" }
    allowed_value: { label: "Arizona" value: "AZ" }
    allowed_value: { label: "Arkansas" value: "AR" }
    allowed_value: { label: "Armed Forces Europe" value: "AE" }
    allowed_value: { label: "Armed Forces Pacific" value: "AP" }
    allowed_value: { label: "California" value: "CA" }
    allowed_value: { label: "Colorado" value: "CO" }
    allowed_value: { label: "Connecticut" value: "CT" }
    allowed_value: { label: "Delaware" value: "DE" }
    allowed_value: { label: "District of Columbia" value: "DC" }
    allowed_value: { label: "Florida" value: "FL" }
    allowed_value: { label: "Georgia" value: "GA" }
    allowed_value: { label: "Guam" value: "GU" }
    allowed_value: { label: "Hawaii" value: "HI" }
    allowed_value: { label: "Idaho" value: "ID" }
    allowed_value: { label: "Illinois" value: "IL" }
    allowed_value: { label: "Indiana" value: "IN" }
    allowed_value: { label: "Iowa" value: "IA" }
    allowed_value: { label: "Kansas" value: "KS" }
    allowed_value: { label: "Kentucky" value: "KY" }
    allowed_value: { label: "Louisiana" value: "LA" }
    allowed_value: { label: "Maine" value: "ME" }
    allowed_value: { label: "Maryland" value: "MD" }
    allowed_value: { label: "Massachusetts" value: "MA" }
    allowed_value: { label: "Michigan" value: "MI" }
    allowed_value: { label: "Minnesota" value: "MN" }
    allowed_value: { label: "Mississippi" value: "MS" }
    allowed_value: { label: "Missouri" value: "MO" }
    allowed_value: { label: "Montana" value: "MT" }
    allowed_value: { label: "Nebraska" value: "NE" }
    allowed_value: { label: "Nevada" value: "NV" }
    allowed_value: { label: "New Hampshire" value: "NH" }
    allowed_value: { label: "New Jersey" value: "NJ" }
    allowed_value: { label: "New Mexico" value: "NM" }
    allowed_value: { label: "New York" value: "NY" }
    allowed_value: { label: "North Carolina" value: "NC" }
    allowed_value: { label: "North Dakota" value: "ND" }
    allowed_value: { label: "Northern Mariana Islands" value: "MP" }
    allowed_value: { label: "Ohio" value: "OH" }
    allowed_value: { label: "Oklahoma" value: "OK" }
    allowed_value: { label: "Oregon" value: "OR" }
    allowed_value: { label: "Pennsylvania" value: "PA" }
    allowed_value: { label: "Puerto Rico" value: "PR" }
    allowed_value: { label: "Rhode Island" value: "RI" }
    allowed_value: { label: "South Carolina" value: "SC" }
    allowed_value: { label: "South Dakota" value: "SD" }
    allowed_value: { label: "Tennessee" value: "TN" }
    allowed_value: { label: "Texas" value: "TX" }
    allowed_value: { label: "U.S. Virgin Islands" value: "VI" }
    allowed_value: { label: "Utah" value: "UT" }
    allowed_value: { label: "Vermont" value: "VT" }
    allowed_value: { label: "Virginia" value: "VA" }
    allowed_value: { label: "Washington" value: "WA" }
    allowed_value: { label: "West Virginia" value: "WV" }
    allowed_value: { label: "Wisconsin" value: "WI" }
    allowed_value: { label: "Wyoming" value: "WY" }
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
    hidden: yes
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
