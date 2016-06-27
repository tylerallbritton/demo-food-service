- view: locations
  sql_table_name: tis_demo_food_service.locations
  fields:

  - dimension: location_id
    primary_key: true
    type: number
    sql: ${TABLE}.location_id

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension: country_code
    type: string
    sql: ${TABLE}.country_code

  - dimension: county
    type: string
    sql: ${TABLE}.county

  - dimension: geo_accuracy
    type: string
    sql: ${TABLE}.geo_accuracy

  - dimension: hours
    type: string
    sql: ${TABLE}.hours

  - dimension: latitude
    type: string
    sql: ${TABLE}.latitude

  - dimension: longitude
    type: string
    sql: ${TABLE}.longitude

  - dimension: org_typ
    type: string
    sql: ${TABLE}.org_typ

  - dimension: phone
    type: string
    sql: ${TABLE}.phone

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension: store_name
    type: string
    sql: ${TABLE}.store_name

  - dimension: zip
    type: string
    sql: ${TABLE}.zip

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [location_id, store_name, staff.count, transactions.count]

