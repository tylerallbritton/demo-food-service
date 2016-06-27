- view: customers
  sql_table_name: tis_demo_food_service.customers
  fields:

  - dimension: customer_id
    primary_key: true
    type: number
    sql: ${TABLE}.customer_id

  - dimension: card_no
    type: string
    sql: ${TABLE}.card_no

  - dimension: card_typ
    type: string
    sql: ${TABLE}.card_typ

  - dimension: first
    type: string
    sql: ${TABLE}.first

  - dimension: last
    type: string
    sql: ${TABLE}.last

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [customer_id, transactions.count]

