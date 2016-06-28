- view: transaction_details
  sql_table_name: tis_demo_food_service.transaction_details
  fields:

  - dimension: product_id
    type: number
    # hidden: true
    sql: ${TABLE}.product_id

  - dimension: transaction_id
    type: string
    # hidden: true
    sql: ${TABLE}.transaction_id

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [products.product_id, products.product_name, transactions.transaction_id]

