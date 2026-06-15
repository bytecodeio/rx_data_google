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
   filter: selected_state_filter {
    label: "Selected State"
    description: "Use this filter to select one or more US States"
    type: string
    default_value: "NY"
    suggestions: ["All States & Territories", "Alabama", "Alaska", "Arizona", "Arkansas", "California", "Colorado", "Connecticut", "Delaware", "District of Columbia", "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming", "Puerto Rico", "U.S. Virgin Islands", "Guam", "Northern Mariana Islands", "Armed Forces Europe", "Armed Forces Pacific"]
  }

  dimension: state_full_name {
    hidden: yes
    type: string
    case: {
      when: { sql: ${state} = 'AL' ;; label: "Alabama" }
      when: { sql: ${state} = 'AK' ;; label: "Alaska" }
      when: { sql: ${state} = 'AZ' ;; label: "Arizona" }
      when: { sql: ${state} = 'AR' ;; label: "Arkansas" }
      when: { sql: ${state} = 'CA' ;; label: "California" }
      when: { sql: ${state} = 'CO' ;; label: "Colorado" }
      when: { sql: ${state} = 'CT' ;; label: "Connecticut" }
      when: { sql: ${state} = 'DE' ;; label: "Delaware" }
      when: { sql: ${state} = 'DC' ;; label: "District of Columbia" }
      when: { sql: ${state} = 'FL' ;; label: "Florida" }
      when: { sql: ${state} = 'GA' ;; label: "Georgia" }
      when: { sql: ${state} = 'HI' ;; label: "Hawaii" }
      when: { sql: ${state} = 'ID' ;; label: "Idaho" }
      when: { sql: ${state} = 'IL' ;; label: "Illinois" }
      when: { sql: ${state} = 'IN' ;; label: "Indiana" }
      when: { sql: ${state} = 'IA' ;; label: "Iowa" }
      when: { sql: ${state} = 'KS' ;; label: "Kansas" }
      when: { sql: ${state} = 'KY' ;; label: "Kentucky" }
      when: { sql: ${state} = 'LA' ;; label: "Louisiana" }
      when: { sql: ${state} = 'ME' ;; label: "Maine" }
      when: { sql: ${state} = 'MD' ;; label: "Maryland" }
      when: { sql: ${state} = 'MA' ;; label: "Massachusetts" }
      when: { sql: ${state} = 'MI' ;; label: "Michigan" }
      when: { sql: ${state} = 'MN' ;; label: "Minnesota" }
      when: { sql: ${state} = 'MS' ;; label: "Mississippi" }
      when: { sql: ${state} = 'MO' ;; label: "Missouri" }
      when: { sql: ${state} = 'MT' ;; label: "Montana" }
      when: { sql: ${state} = 'NE' ;; label: "Nebraska" }
      when: { sql: ${state} = 'NV' ;; label: "Nevada" }
      when: { sql: ${state} = 'NH' ;; label: "New Hampshire" }
      when: { sql: ${state} = 'NJ' ;; label: "New Jersey" }
      when: { sql: ${state} = 'NM' ;; label: "New Mexico" }
      when: { sql: ${state} = 'NY' ;; label: "New York" }
      when: { sql: ${state} = 'NC' ;; label: "North Carolina" }
      when: { sql: ${state} = 'ND' ;; label: "North Dakota" }
      when: { sql: ${state} = 'OH' ;; label: "Ohio" }
      when: { sql: ${state} = 'OK' ;; label: "Oklahoma" }
      when: { sql: ${state} = 'OR' ;; label: "Oregon" }
      when: { sql: ${state} = 'PA' ;; label: "Pennsylvania" }
      when: { sql: ${state} = 'RI' ;; label: "Rhode Island" }
      when: { sql: ${state} = 'SC' ;; label: "South Carolina" }
      when: { sql: ${state} = 'SD' ;; label: "South Dakota" }
      when: { sql: ${state} = 'TN' ;; label: "Tennessee" }
      when: { sql: ${state} = 'TX' ;; label: "Texas" }
      when: { sql: ${state} = 'UT' ;; label: "Utah" }
      when: { sql: ${state} = 'VT' ;; label: "Vermont" }
      when: { sql: ${state} = 'VA' ;; label: "Virginia" }
      when: { sql: ${state} = 'WA' ;; label: "Washington" }
      when: { sql: ${state} = 'WV' ;; label: "West Virginia" }
      when: { sql: ${state} = 'WI' ;; label: "Wisconsin" }
      when: { sql: ${state} = 'WY' ;; label: "Wyoming" }
      when: { sql: ${state} = 'PR' ;; label: "Puerto Rico" }
      when: { sql: ${state} = 'VI' ;; label: "U.S. Virgin Islands" }
      when: { sql: ${state} = 'GU' ;; label: "Guam" }
      when: { sql: ${state} = 'MP' ;; label: "Northern Mariana Islands" }
      when: { sql: ${state} = 'AE' ;; label: "Armed Forces Europe" }
      when: { sql: ${state} = 'AP' ;; label: "Armed Forces Pacific" }
      else: "Unknown"
    }
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
    description: "The state abbreviation currently selected in the filter"
    type: string
    sql: '1' ;;
    html: {% if _filters['pharmacy.selected_state_filter'] != '' %}{{ _filters['pharmacy.selected_state_filter'] }}{% else %}All States & Territories{% endif %} ;;
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
