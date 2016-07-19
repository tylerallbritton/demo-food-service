- view: pos_fact
  sql_table_name: tis_demo_food_service.pos_fact
  fields:

  - dimension: a_customer_id
    type: number
    sql: ${TABLE}.a_customer_id

  - dimension: a_location_id
    type: number
    sql: ${TABLE}.a_location_id

  - dimension: a_payment_typ
    type: string
    sql: ${TABLE}.a_payment_typ

  - dimension: a_staff_id
    type: number
    sql: ${TABLE}.a_staff_id

  - dimension: a_transaction_dt
    type: time
    sql: ${TABLE}.a_transaction_dt

  - dimension: a_transaction_id
    type: string
    sql: ${TABLE}.a_transaction_id

  - dimension: b_product_id
    type: number
    sql: ${TABLE}.b_product_id

  - dimension: c_product_category
    type: string
    sql: ${TABLE}.c_product_category

  - dimension: c_product_name
    type: string
    sql: ${TABLE}.c_product_name

  - dimension: c_product_retail_price
    type: number
    sql: ${TABLE}.c_product_retail_price

  - dimension: c_food_cost
    type: number
    sql: ${TABLE}.c_food_cost

  - dimension: customer_first
    type: string
    sql: ${TABLE}.customer_first

  - dimension: customer_last
    type: string
    sql: ${TABLE}.customer_last

  - dimension: e_card_no
    type: string
    sql: ${TABLE}.e_card_no

  - dimension: e_card_typ
    type: string
    sql: ${TABLE}.e_card_typ

  - dimension: f_address
    type: string
    sql: ${TABLE}.f_address

  - dimension: f_city
    type: string
    sql: ${TABLE}.f_city

  - dimension: f_country
    type: string
    sql: ${TABLE}.f_country

  - dimension: f_country_code
    type: string
    sql: ${TABLE}.f_country_code

  - dimension: f_county
    type: string
    sql: ${TABLE}.f_county

  - dimension: f_geo_accuracy
    type: string
    sql: ${TABLE}.f_geo_accuracy

  - dimension: f_hours
    type: string
    sql: ${TABLE}.f_hours

  - dimension: f_latitude
    type: string
    sql: ${TABLE}.f_latitude

  - dimension: f_longitude
    type: string
    sql: ${TABLE}.f_longitude

  - dimension: f_org_typ
    type: string
    sql: ${TABLE}.f_org_typ

  - dimension: f_phone
    type: string
    sql: ${TABLE}.f_phone

  - dimension: f_state
    type: string
    sql: ${TABLE}.f_state

  - dimension: f_store_name
    type: string
    sql: ${TABLE}.f_store_name

  - dimension: f_zip
    type: string
    sql: ${TABLE}.f_zip

  - dimension: staff_first
    type: string
    sql: ${TABLE}.staff_first

  - dimension: staff_last
    type: string
    sql: ${TABLE}.staff_last
    
  - dimension: latlon
    type: location
    sql_latitude: ${f_latitude}
    sql_longitude: ${f_longitude}

  - dimension: date_only
    type: date_date
    datatype: date
    sql: ${TABLE}.a_transaction_dt
    
  - dimension: hour_only
    type: date_hour
    sql: ${TABLE}.a_transaction_dt_time
    
  - dimension: a_weather_cond
    type: string
    sql: ${TABLE}.a_weather_cond
  
    
  - measure: count
    type: count
    approximate_threshold: 100000
    drill_fields: [f_store_name, c_product_name]

  - measure: Sale_USD
    type: sum
    sql: ${c_product_retail_price}
    value_format_name: usd
    drill_fields: [f_store_name, c_product_name]

  - measure: food_cost_USD
    type: sum
    sql: ${c_food_cost}
    value_format_name: usd
    drill_fields: [f_store_name, c_product_name]
    
  - measure: sumday
    type: sum
    sql: |
      CASE WHEN ${a_transaction_dt_hour_of_day} <= 17 
      THEN ${c_product_retail_price}
      ELSE NULL 
      END
    value_format_name: usd
  - measure: sumeve
    type: sum
    sql: |
      CASE WHEN ${a_transaction_dt_hour_of_day} > 17 
      THEN ${c_product_retail_price}
      ELSE NULL 
      END
    value_format_name: usd
      
  - filter: Product1
    label: 'Pick a Product1'
    suggest_dimension: c_product_name
    
  - measure: Product1_Sales
    type: sum
    sql: |
      CASE WHEN {% condition Product1 %} ${c_product_name} {% endcondition %}
      THEN ${c_product_retail_price}
      ELSE NULL
      END
    value_format_name: usd
      
  - filter: Product2
    label: 'Pick a Product2'
    suggest_dimension: c_product_name
    
  - measure: Product2_Sales
    type: sum
    sql: |
      CASE WHEN {% condition Product2 %} ${c_product_name} {% endcondition %}
      THEN ${c_product_retail_price}
      ELSE NULL
      END
    value_format_name: usd
  
  - dimension: image_file
    sql: ('https://dl.dropboxusercontent.com/s/8ice1zcfouaxkhc/restaurant-logo.png')
    
  - dimension: product_image
    sql: ${image_file}
    html: <img src="{{ value }}" />
    
  - dimension: image_file2
    sql: ('https://www.dropbox.com/s/sn464ypvd479so7/Screen%20Shot%202016-07-19%20at%204.00.02%20PM.png?dl=1')
    
  - dimension: predictive_image
    sql: ${image_file2}
    html: <img src="{{ value }}" />
    
  - measure: Avg_Sale_USD
    type: average
    sql: ${c_product_retail_price}
    value_format_name: usd
    
  - measure: disttrans
    type: count_distinct
    sql: ${a_transaction_id}
  
  - measure: disthours
    type: count_distinct
    sql: ${a_transaction_dt_hour}
  

  
  - measure: avgtrans
    type: number
    sql: ${disttrans}/${disthours}
    
    
  - filter: Year1
    label: 'Pick Year 1'
    type: number
    suggest_dimension: a_transaction_dt
    
  - measure: Year1_Sales
    type: sum
    sql: |
      CASE WHEN {% condition Year1 %} ${a_transaction_dt_year} {% endcondition %}
      THEN ${c_product_retail_price}
      ELSE NULL
      END
    value_format_name: usd
      
  - filter: Year2
    label: 'Pick Year 2'
    type: number
    suggest_dimension: a_transaction_dt
    
  - measure: Year2_Sales
    type: sum
    sql: |
      CASE WHEN {% condition Year2 %} ${a_transaction_dt_year} {% endcondition %}
      THEN ${c_product_retail_price}
      ELSE NULL
      END
    value_format_name: usd
