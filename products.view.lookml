- view: products
  sql_table_name: tis_demo_food_service.products
  fields:

  - dimension: product_id
    primary_key: true
    type: number
    sql: ${TABLE}.product_id

  - dimension: product_category
    type: string
    sql: ${TABLE}.product_category

  - dimension: product_name
    type: string
    sql: ${TABLE}.product_name

  - dimension: product_retail_price
    type: number
    sql: ${TABLE}.product_retail_price

  - dimension: product_wholesale_price
    type: number
    sql: ${TABLE}.product_wholesale_price

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [product_id, product_name, transaction_details.count]

