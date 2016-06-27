- view: transact
  sql_table_name: tis_demo_food_service.transact
  fields:

  - dimension: custid
    type: number
    value_format_name: id
    sql: ${TABLE}.custid

  - dimension: day
    type: string
    sql: ${TABLE}.day

  - dimension: hour
    type: number
    sql: ${TABLE}.hour

  - dimension: item
    type: string
    sql: ${TABLE}.item

  - dimension: menu
    type: string
    sql: ${TABLE}.menu

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - dimension: weather
    type: string
    sql: ${TABLE}.Weather

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []
    
  - measure: countday
    type: count_distinct
    sql: |
      CASE WHEN ${hour} < 17 
      THEN ${custid}
      ELSE NULL 
      END

