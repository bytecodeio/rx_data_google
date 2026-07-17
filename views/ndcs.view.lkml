view: ndcs {
  sql_table_name: `Rx_Data.ndcs` ;;
  drill_fields: [ndc_pk]

  dimension: ndc_pk {
    primary_key: yes
    hidden: yes
    label: "NDC PK"
    description: "The unique internal primary key identifier for the NDC record"
    synonyms: ["ndc key", "pk"]
    type: number
    sql: ${TABLE}.ndc_pk ;;
  }
  dimension: brand_name {
    label: "Brand Name"
    description: "The brand/proprietary name of the drug"
    synonyms: ["trade name", "proprietary name", "product name"]
    type: string
    sql: ${TABLE}.Brand_Name ;;
  }
  dimension: disease {
    label: "Disease Target"
    description: "The primary disease or condition targeted by the medication"
    synonyms: ["indication", "condition", "illness"]
    type: string
    sql: ${TABLE}.Disease ;;
  }
  dimension: dosage_unit {
    label: "Dosage Unit"
    description: "The unit of measurement for drug dosage (e.g. tablet, capsule, ml)"
    synonyms: ["form", "strength unit"]
    type: string
    sql: ${TABLE}.Dosage_Unit ;;
  }
  dimension: generic_long_name {
    label: "Generic Long Name"
    description: "The complete, detailed chemical or generic formula name"
    synonyms: ["generic formula", "full generic name"]
    type: string
    sql: ${TABLE}.Generic_Long_Name ;;
  }
  dimension: generic_name {
    label: "Generic Name"
    description: "The established short generic name of the active drug ingredient"
    synonyms: ["generic drug", "active ingredient"]
    type: string
    sql: ${TABLE}.Generic_Name ;;
  }
  dimension: label_name {
    label: "Label Name"
    description: "The product label name as printed on the packaging"
    synonyms: ["package label", "packaging name"]
    type: string
    sql: ${TABLE}.Label_Name ;;
  }
  dimension: ndc {
    label: "NDC Code"
    description: "The National Drug Code (unique 10 or 11 digit standard identifier)"
    synonyms: ["drug code", "medication id", "upc"]
    type: number
    sql: ${TABLE}.NDC ;;
  }
  dimension: therapeutic {
    label: "Therapeutic Class"
    description: "The therapeutic category of the drug (e.g. cardiovascular, vitamins)"
    synonyms: ["drug class", "pharmacological class"]
    type: string
    sql: ${TABLE}.Therapeutic ;;
  }
  dimension: weather_sensitive_disease_cohort {
    type: string
    label: "Weather-Sensitive Disease Cohort"
    description: "Groups medications into climate-reactive categories based on their therapeutic target and clinical indication."
    sql:
    CASE
      WHEN ${therapeutic} IN ('COUGH AND COLD PREPARATIONS', 'ANTIBACTERIALS FOR SYSTEMIC USE', 'ANTIVIRALS FOR SYSTEMIC USE')
        THEN 'Respiratory Infections (Cold/Flu Surge)'
      WHEN ${therapeutic} IN ('ANTIHYPERTENSIVES', 'CARDIAC THERAPY', 'BETA BLOCKING AGENTS', 'DIURETICS', 'CALCIUM CHANNEL BLOCKERS')
        THEN 'Cardiovascular (Heat/Cold Extremes)'
      WHEN ${disease} LIKE '%ASTHMA%' OR ${disease} LIKE '%COPD%' OR ${therapeutic} = 'RESPIRATORY SYSTEM'
        THEN 'Chronic Respiratory (Asthma/COPD)'
      WHEN ${therapeutic} LIKE '%ANTIHISTAMINE%' OR ${disease} LIKE '%ALLERGY%' OR ${disease} LIKE '%ALLERGIC%'
        THEN 'Allergic Rhinitis (Seasonal Pollen/Spring)'
      ELSE 'Non-Weather Sensitive / Baseline Chronic'
    END ;;
  }
  measure: count {
    hidden: yes
    label: "NDC Row Count"
    description: "The total number of NDC catalog records"
    type: count
    drill_fields: [ndc_pk, generic_name, label_name, generic_long_name, brand_name]
  }
  measure: number_of_medications {
    hidden: no
    label: "Number of Medications"
    description: "The distinct count of unique NDC codes"
    synonyms: ["distinct drugs", "total medications"]
    type: count_distinct
    sql: ${ndc} ;;
    value_format_name: decimal_0
  }
}
