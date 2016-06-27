- view: pos_fact2
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
    sql: ('http://vignette3.wikia.nocookie.net/logopedia/images/2/27/Fuddruckers_logo.png/revision/latest?cb=20151013002315')
    
  - dimension: product_image
    sql: ${image_file}
    html: <img src="{{ value }}" width="100" height="100"/>
