view: weather_dt {
  derived_table: {
    datagroup_trigger: weather_daily_datagroup
    sql:
      WITH zip_centroids AS (
        SELECT
          zip_code,
          state_code,
          internal_point_geom AS zip_geo_point
        FROM
          `bigquery-public-data.geo_us_boundaries.zip_codes`
      ),

      station_locations AS (
        SELECT
          usaf,
          wban,
          name,
          state,
          lat,
          lon,
          -- Construct a geography point for each station
          ST_GEOGPOINT(lon, lat) AS station_geo_point
        FROM
          `bigquery-public-data.noaa_gsod.stations`
        WHERE
          lat IS NOT NULL
          AND lon IS NOT NULL
          -- Ignore placeholder/missing NOAA values
          AND lat != 0.0 AND lon != 0.0
          AND country = 'US'
      ),

      distance_matrix AS (
        SELECT
          z.zip_code,
          z.state_code,
          s.usaf,
          s.wban,
          s.name AS station_name,
          -- ST_DISTANCE returns distance in meters
          ST_DISTANCE(z.zip_geo_point, s.station_geo_point) AS distance_meters,
          ROW_NUMBER() OVER (
            PARTITION BY z.zip_code
            ORDER BY ST_DISTANCE(z.zip_geo_point, s.station_geo_point) ASC
          ) AS rank_closest
        FROM
          zip_centroids z
        INNER JOIN
          station_locations s
          -- Filtering on state code optimizes the cross-join spatial calculation
          ON s.state = z.state_code
      ),

      station_mapping AS(
      -- Select only the single closest weather station for each ZIP code
        SELECT --count( distinct station_name)
          zip_code,
          state_code,
          usaf,
          wban,
          CONCAT(usaf,wban) AS station_key,
          station_name,
          distance_meters
        FROM
          distance_matrix
        WHERE
          rank_closest = 1
      )

      SELECT
        s.station_key,
        PARSE_DATE('%Y%m%d', CONCAT(year, mo, da)) AS weather_date,
        NULLIF(temp, 9999.9) AS mean_temp, --degrees in Fahrenheit
        NULLIF(max, 9999.9) AS max_temp, --max daily temp
        NULLIF(min, 9999.9) AS min_temp, --min daily temp
        NULLIF(prcp, 99.99) AS total_precipitation, --measured in inches (rain & melted snow)
        PARSE_NUMERIC(rain_drizzle) AS precipitation_flag, --1 = yes, 0 = no/not reported
        flag_prcp AS precipitation_desc,
        NULLIF(visib, 999.9) AS mean_visibility, --measured in miles
        PARSE_NUMERIC(fog) as fog_flag, --1 = yes, 0 = no/not reported
        NULLIF(sndp, 999.9) AS snow_depth, --measured in inches
        PARSE_NUMERIC(snow_ice_pellets) as snow_ice_flag, --1 = yes, 0 = no/not reported
        PARSE_NUMERIC(hail) as hail_flag, --1 = yes, 0 = no/not reported
        PARSE_NUMERIC(thunder) as thunder_flag, --1 = yes, 0 = no/not reported
        PARSE_NUMERIC(tornado_funnel_cloud) as tornado_flag --1 = yes, 0 = no/not reported
      FROM `bigquery-public-data.noaa_gsod.gsod*` w
      JOIN station_mapping s
        ON w.stn = s.usaf AND w.wban = s.wban
      WHERE w._TABLE_SUFFIX BETWEEN '2016' AND '2023'
      -- GROUP BY 1
    ;;
  }

  #       CASE
  #         WHEN (rain_drizzle,fog) >= 1 THEN 'Poor Weather'
  #         WHEN (snow_ice_pellets,hail,thunder) >= 1 THEN 'Moderately Bad Weather'
  #         WHEN (hail,thunder,tornado_funnel_cloud) >= 2 THEN 'Inclement Weather'
  #         WHEN (hail,thunder,tornado_funnel_cloud) = 3

  dimension: cpk {
    type: string
    primary_key: yes
    hidden: yes
    description: "Compound key unique for each row, combining the unique station identifier and the date"
    sql: CONCAT(${station_key},'-',CAST(${weather_record_raw} AS STRING)) ;;
  }

  dimension: station_key {
    type: string
    description: "Unique identifer for each station combining the usaf and wban strings"
    sql: ${TABLE}.station_key ;;
  }

  dimension_group: weather_record {
    type: time
    datatype: date
    label: "Weather Recorded"
    timeframes: [raw, date, day_of_week, week, month, quarter, year]
    sql: TIMESTAMP_ADD(${TABLE}.weather_date, INTERVAL DATE_DIFF(CURRENT_DATE(), DATE('2023-12-30'),DAY) DAY)  ;;
  }

  dimension: daily_mean_temp_raw {
    type: number
    description: "Raw daily mean temperature recorded at a station."
    hidden: yes
    sql: ${TABLE}.mean_temp ;;
  }

  dimension: temperature_tier {
    label: "Temperature Tier"
    type: string
    description: "Categorizes the daily mean temp recorded into weather bands."
    sql: CASE
          WHEN ${daily_mean_temp_raw} <= 32 THEN 'Extreme Cold (<= 32°F)'
          WHEN ${daily_mean_temp_raw} > 32 AND ${daily_mean_temp_raw} <= 50 THEN 'Cold (33°F - 50°F)'
          WHEN ${daily_mean_temp_raw} > 50 AND ${daily_mean_temp_raw} <= 72 THEN 'Moderate (51°F - 72°F)'
          WHEN ${daily_mean_temp_raw} > 72 AND ${daily_mean_temp_raw} <= 90 THEN 'Warm/Hot (73°F - 90°F)'
          WHEN ${daily_mean_temp_raw} > 90 THEN 'Extreme Heat (> 90°F)'
         END;;
  }

  dimension: daily_max_temp_raw {
    type: number
    description: "Raw daily max temperature recorded at a station."
    hidden: yes
    sql: ${TABLE}.max_temp ;;
  }

  dimension: daily_min_temp_raw {
    type: number
    description: "Raw daily min temperature recorded at a station."
    hidden: yes
    sql: ${TABLE}.min_temp ;;
  }

  dimension: daily_total_precipitation_raw {
    type: number
    description: "Raw daily total precipitaion recorded at a station."
    hidden: yes
    sql: ${TABLE}.total_precipitation ;;
  }

  dimension: daily_prcp_flag {
    type: number
    description: "Field used to indicate an occurence of precipitation at the station. 1 = Yes, 0 = No."
    hidden: yes
    sql: ${TABLE}.precipitation_flag ;;
  }

  dimension: was_precipitation_reported {
    type: yesno
    label: "Was Precipitation Reported"
    description: "Flag field used to identify if there was a report/record of precipitation on a given date/timeframe."
    sql: ${daily_prcp_flag} = 1 ;;
  }

  dimension: prcp_desc_raw {
    type: string
    description: "Raw precipitation flag field to indicate type/period for the record/report of preciptitation."
    hidden: yes
    sql: ${TABLE}.precipitation_desc ;;
  }

  dimension: daily_prcp_note {
    type: string
    label: "Precipitation Report Note"
    sql:  CASE
            WHEN ${prcp_desc_raw} = 'A' THEN '1 Report of 6-hr amount'
            WHEN ${prcp_desc_raw} = 'B' THEN 'Summation of 2 6-hr amounts'
            WHEN ${prcp_desc_raw} = 'C' THEN 'Summation of 3 6-hr amounts'
            WHEN ${prcp_desc_raw} = 'D' THEN 'Summation of 4 6-hr amounts'
            WHEN ${prcp_desc_raw} = 'E' THEN '1 Report of 12-hr amount'
            WHEN ${prcp_desc_raw} = 'F' THEN 'Summation of 2 12-hr amounts'
            WHEN ${prcp_desc_raw} = 'G' THEN '1 Report of 24-hr amount'
            WHEN ${prcp_desc_raw} = 'H' THEN 'Trace amounts - Incomplete data for the day'
            WHEN ${prcp_desc_raw} = 'I' THEN 'No amount or occurrences reported, still possible'
          END ;;
  }

  dimension: mean_visibility_raw {
    type: number
    description: "Raw daily mean measurement for visibility measured in miles "
    hidden: yes
    sql: ${TABLE}.mean_visibility ;;
  }

  dimension: fog_flag {
    type: number
    description: "Field used to indicate an occurence of fog at the station. 1 = Yes, 0 = No."
    hidden: yes
    sql: ${TABLE}.fog_flag ;;
  }

  dimension: was_fog_reported {
    type: yesno
    label: "Was Fog Reported"
    description: "Flag field used to identify if there was a report/record of fog on a given date/timeframe."
    sql: ${fog_flag} = 1 ;;
  }

  dimension: snow_depth_raw {
    type: number
    description: "Raw last measurement of the day's snowfall measured in inches."
    hidden: yes
    sql: ${TABLE}.snow_depth ;;
  }

  dimension: snow_ice_flag {
    type: number
    description: "Field used to indicate an occurence of snow or ice pellets at the station. 1 = Yes, 0 = No."
    hidden: yes
    sql: ${TABLE}.snow_ice_flag ;;
  }

  dimension: was_freeze_reported {
    type: yesno
    label: "Was Snow or Ice Reported"
    description: "Flag field used to identify if there were any report/record of snow or ice on a given date/timeframe."
    sql: ${snow_ice_flag} = 1 ;;
  }

  dimension: hail_flag {
    type: number
    description: "Field used to indicate an occurence of hail at the station. 1 = Yes, 0 = No."
    hidden: yes
    sql: ${TABLE}.hail_flag ;;
  }

  dimension: was_hail_reported {
    type: yesno
    label: "Was Hail Reported"
    description: "Flag field used to identify if there were any report/record of hail on a given date/timeframe."
    sql: ${hail_flag} = 1 ;;
  }

  dimension: thunder_flag {
    type: number
    description: "Field used to indicate an occurence of precipitation at the station. 1 = Yes, 0 = No."
    hidden: yes
    sql: ${TABLE}.thunder_flag ;;
  }

  dimension: was_thunder_reported {
    type: yesno
    label: "Was Thunder Reported"
    description: "Flag field used to identify if there were any report/record of thunder on a given date/timeframe."
    sql: ${thunder_flag} = 1 ;;
  }

  dimension: tornado_flag {
    type: number
    description: "Field used to indicate an occurence of a tornado or funnel cloud at the station. 1 = Yes, 0 = No."
    hidden: yes
    sql: ${TABLE}.tornado_flag ;;
  }

  dimension: was_tornado_reported {
    type: yesno
    label: "Was a Tornado or Funnel Cloud Reported"
    description: "Flag field used to identify if there were any report/record of tornadoes or funnel clouds on a given date/timeframe."
    sql: ${tornado_flag} = 1 ;;
  }

  dimension: weather_severity_category {
    type: string
    label: "Weather Severity Category"
    description: "Categorizes the severity of the daily weather based on recorded flags. Determined by hierarchical evaluation of severe weather occurrences. Unit: Text. Example: Inclement Weather (Frozen/Hail)."
    sql:
      CASE
        WHEN ${tornado_flag} = 1 THEN 'Extreme Weather (Tornado)'
        WHEN ${hail_flag} = 1 OR ${snow_ice_flag} = 1 THEN 'Inclement Weather (Frozen/Hail)'
        WHEN ${thunder_flag} = 1 THEN 'Moderately Bad Weather (Thunder)'
        WHEN ${daily_prcp_flag} = 1 OR ${fog_flag} = 1 THEN 'Poor Weather (Rain/Fog)'
        ELSE 'Clear/No Severe Weather Recorded'
      END ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: daily_temp {
    label: "Daily Median Temperature"
    description: "The daily median temperature recorded in Fahrenheit on the date or across the timeframe."
    type: median
    sql: ${daily_mean_temp_raw} ;;
    value_format_name: decimal_1
  }

  measure: max_temp {
    label: "Daily Max Temperature"
    description: "The daily highest/max temperature recorded in Fahrenheit on the date or across the timeframe."
    type: max
    sql: ${daily_max_temp_raw} ;;
  }

  measure: min_temp {
    label: "Daily Min Temperature"
    description: "The daily lowest/min temperature recorded in Fahrenheit on the date or across the timeframe."
    type: min
    sql: ${daily_min_temp_raw} ;;
  }

  measure: total_precipitation {
    label: "Total Precipitation"
    description: "The total precipitation recorded in inches on the date or across the timeframe."
    type: sum
    sql: ${daily_total_precipitation_raw} ;;
  }

  measure: median_visibility {
    label: "Median Visibility"
    description: "The median visibility recorded in miles on the date or across the timeframe."
    type: median
    sql: ${mean_visibility_raw} ;;
    value_format_name: decimal_1
  }

  measure: median_snow_depth {
    label: "Median Snow Depth"
    description: "The median depth of snowfall in inches on the date or across the timeframe."
    type: median
    sql: ${snow_depth_raw} ;;
    value_format_name: decimal_1
  }

  measure: rainy_days_count {
    label: "Rainy Days Count"
    description: "The count of days in the timeframe marked by the flag for having an occurrence of precipitation."
    type: count_distinct
    sql: ${cpk} ;;
    filters: [was_precipitation_reported: "Yes"]
  }

  measure: foggy_days_count {
    label: "Foggy Days Count"
    description: "The count of days in the timeframe marked by the flag for having an occurrence of fog."
    type: count_distinct
    sql: ${cpk} ;;
    filters: [was_fog_reported: "Yes"]
  }

  measure: snowy_days_count {
    label: "Snow Days Count"
    description: "The count of days in the timeframe marked by the flag for having an occurrence of snow or ice pellets."
    type: count_distinct
    sql: ${cpk} ;;
    filters: [was_freeze_reported: "Yes"]
  }

  set: detail {
    fields: [
      station_key,
      weather_record_date,
      daily_temp,
      max_temp,
      min_temp,
      total_precipitation,
      daily_prcp_note,
      median_visibility,
      median_snow_depth,
      was_fog_reported,
      was_precipitation_reported,
      was_freeze_reported,
      was_hail_reported,
      was_thunder_reported,
      was_tornado_reported
    ]
  }
}
