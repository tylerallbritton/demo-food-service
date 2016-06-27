- view: transactions
  sql_table_name: tis_demo_food_service.transactions
  fields:

  - dimension: transaction_id
    primary_key: true
    type: string
    sql: ${TABLE}.transaction_id

  - dimension: customer_id
    type: number
    # hidden: true
    sql: ${TABLE}.customer_id

  - dimension: location_id
    type: number
    # hidden: true
    sql: ${TABLE}.location_id

  - dimension: payment_typ
    type: string
    sql: ${TABLE}.payment_typ

  - dimension: staff_id
    type: number
    # hidden: true
    sql: ${TABLE}.staff_id

  - dimension: transaction_dt
    type: string
    sql: ${TABLE}.transaction_dt

  - dimension: weather_cond
    type: string
    sql: ${TABLE}.weather_cond

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - transaction_id
    - staff.staff_id
    - customers.customer_id
    - locations.location_id
    - locations.store_name
    - transaction_details.count

