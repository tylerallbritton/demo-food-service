- view: reviews
  sql_table_name: tis_demo_food_service.Reviews
  fields:

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: comments
    type: string
    sql: ${TABLE}.comments

  - dimension_group: date
    type: time
    timeframes: [date, week, month]
    convert_tz: false
    sql: ${TABLE}.date

  - dimension: phone
    type: string
    sql: ${TABLE}.phone

  - dimension: ratings
    type: number
    sql: ${TABLE}.ratings

  - dimension: state_or_country
    type: string
    sql: ${TABLE}.State_or_Country

  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: []

  - dimension: image_fbi
    sql: ('https://www.dropbox.com/s/b65e8cjxbplq3x8/Screen%20Shot%202016-07-19%20at%204.05.37%20PM.png?dl=1')
    
  - dimension: FBI_image
    sql: ${image_fbi}
    html: <img src="{{ value }}" />