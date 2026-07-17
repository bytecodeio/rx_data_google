view: station_mapping_dt {
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
          CAST(begin AS DATE FORMAT 'YYYYMMDD') AS starting,
          CAST(`end` AS DATE FORMAT 'YYYYMMDD') AS ending,
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
          s.starting,
          s.ending,
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
      )

      -- Select only the single closest weather station for each ZIP code
      SELECT --count( distinct station_name)
        CONCAT(usaf,wban) AS station_key,
        zip_code,
        state_code,
        usaf,
        wban,
        station_name,
        ROUND(distance_meters,2) AS distance_meters,
        starting,
        ending
      FROM
        distance_matrix
      WHERE
        rank_closest = 1
      ;;
  }

  dimension: cpk {
    type: string
    description: "Unique row identifier combining the station's unique identifier and the zip code closest to it."
    primary_key: yes
    hidden: yes
    sql: ${station_key}||${zip_code};;
  }

  dimension: station_key {
    type: string
    description: "A station's unique identifier combining the usaf and wban strings."
    sql: ${TABLE}.station_key ;;
  }

  dimension: zip_code {
    label: "Zipcode"
    description: "This is the zip code field that will be used to join to the RX data allowing the weather data to be attributed to the closest station determined by distance between their geo points."
    type: zipcode
    sql: ${TABLE}.zip_code ;;
    map_layer_name: us_zipcode_tabulation_areas
  }

  dimension: state_abbr {
    type: string
    label: "State Abbreviation"
    sql: ${TABLE}.state_code ;;
    map_layer_name: us_states
  }

  dimension: usaf {
    type: string
    hidden: yes
    sql: ${TABLE}.usaf ;;
  }

  dimension: wban {
    type: string
    hidden: yes
    sql: ${TABLE}.wban ;;
  }

  dimension: station_name {
    type: string
    label: "Station Name"
    description: "The name/identifier given to the weather station."
    sql: ${TABLE}.station_name ;;
  }

  dimension: distance_meters {
    type: number
    label: "Distance from Zip"
    description: "The distance in meters from a zipcode's geo point to the closest weather station's geo point."
    sql: ${TABLE}.distance_meters ;;
  }

  dimension_group: starting {
    type: time
    datatype: date
    timeframes: [raw,date,week,month,year]
    sql: ${TABLE}.starting ;;
  }

  dimension_group: ending {
    type: time
    datatype: date
    timeframes: [raw,date,week,month,year]
    sql: ${TABLE}.ending ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: station_count {
    type: count_distinct
    label: "Count of Stations"
    description: "The count of stations"
    sql: ${station_key} ;;
  }

  measure: avg_distance {
    label: "Average Distance"
    description: "The average distance in meters between the stations and the closest zipcode, calculated and ranked using geo points."
    type: average
    sql: ${distance_meters} ;;
    value_format_name: decimal_1
  }

  measure: total_distance {
    label: "Total Distance"
    description: "The total distance in meters between the stations and the closest zipcode, calculated and ranked using geo points."
    type: sum
    sql: ${distance_meters} ;;
    # sql_distinct_key: ${cpk} ;;
  }

  set: detail {
    fields: [
      station_key,
      zip_code,
      state_abbr,
      usaf,
      wban,
      station_name,
      distance_meters,
      starting_date,
      ending_date
    ]
  }
}
