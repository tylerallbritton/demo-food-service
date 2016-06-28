- view: staff
  sql_table_name: tis_demo_food_service.staff
  fields:

  - dimension: staff_id
    primary_key: true
    type: number
    sql: ${TABLE}.staff_id

  - dimension: first
    type: string
    sql: ${TABLE}.first

  - dimension: last
    type: string
    sql: ${TABLE}.last

  - dimension: location_id
    type: number
    # hidden: true
    sql: ${TABLE}.location_id

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [staff_id, locations.location_id, locations.store_name, transactions.count]

