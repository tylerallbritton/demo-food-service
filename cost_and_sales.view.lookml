- view: cost_and_sales
  sql_table_name: tis_demo_food_service.cost_and_sales
  fields:

  - dimension: city
    type: string
    sql: ${TABLE}.city


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
    drill_fields: [store_name, locations.location_id, locations.store_name]

  - measure: food_cost
    type: average
    sql: ${TABLE}.food_cost
    
  - measure: sales
    type: average
    sql: ${TABLE}.sales

  - measure: staff_cost
    type: average
    sql: ${TABLE}.staff_cost
