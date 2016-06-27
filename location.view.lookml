- view: location
  sql_table_name: tis_demo_food_service.location
  fields:

  - dimension: city
    type: string
    sql: ${TABLE}.City

  - dimension: country
    type: string
    sql: ${TABLE}.Country

  - dimension: countrycode
    type: string
    sql: ${TABLE}.Countrycode

  - dimension: county
    type: string
    sql: ${TABLE}.county

  - dimension: geo_accuracy
    type: string
    sql: ${TABLE}.GeoAccuracy

  - dimension: lat
    type: string
    sql: ${TABLE}.lat

  - dimension: lon
    type: string
    sql: ${TABLE}.lon


  - dimension: latlon
    type: location
    sql_latitude: ${lat}
    sql_longitude: ${lon}
    
  - dimension: phone
    type: string
    sql: ${TABLE}.Phone

  - dimension: state
    type: string
    sql: ${TABLE}.State

  - dimension: strname
    type: string
    sql: ${TABLE}.strname

  - dimension: strno
    type: number
    sql: ${TABLE}.strno

  - dimension: zipcode
    type: string
    sql: ${TABLE}.ZIpcode

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [strname]

