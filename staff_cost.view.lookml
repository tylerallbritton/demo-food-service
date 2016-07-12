- view: staff_cost
  sql_table_name: tis_demo_food_service.staff_cost
  fields:

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: cost
    type: number
    sql: ${TABLE}.cost

  - dimension: latitude
    type: string
    sql: ${TABLE}.latitude

  - dimension: location_id
    type: number
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: longitude
    type: string
    sql: ${TABLE}.longitude

  - dimension: staff_first
    type: string
    sql: ${TABLE}.staff_first

  - dimension: staff_id
    type: number
    # hidden: true
    sql: ${TABLE}.staff_id

  - dimension: staff_last
    type: string
    sql: ${TABLE}.staff_last

  - dimension: store_name
    type: string
    sql: ${TABLE}.store_name

  - dimension: transaction_date
    type: string
    sql: ${TABLE}.transaction_date

  - dimension: transaction_hour
    type: number
    sql: ${TABLE}.transaction_hour

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [store_name, staff.staff_id, locations.location_id, locations.store_name]

