- dashboard: restaurant_demo2
  title: Restaurant Demo Page-2
  layout: grid
  rows:
    - elements: [logo]
      height: 55
    - elements: [Compare Two products]
      height: 270
      width: 800
  

  filters:
  - name: Map-product-category
    title: 'Product Category'
    type: field_filter
    explore: pos_fact
    field: pos_fact.c_product_category
  
   
  - name: Map-Quarter
    title: 'Quarter'
    type: field_filter
    explore: pos_fact
    field: pos_fact.a_transaction_dt_quarter_of_year
   
    
  - name: City
    title: 'City'
    type: field_filter
    explore: pos_fact
    field: pos_fact.f_city

    
  - name: Date
    title: 'Date'
    type: date_filter
    explore: pos_fact
    field: pos_fact.date_only

  - name: orgtype
    title: 'Store Type'
    type: field_filter
    explore: pos_fact
    field: pos_fact.f_org_typ
    default_value: "corporate"
  
    
  - name: Product_1
    title: 'Product 1'
    type: string_filter
    explore: pos_fact
    field: pos_fact.product1
    default_value: "1 lb. Burger"
    
  - name: Product_2
    title: 'Product 2'
    type: string_filter
    explore: pos_fact
    field: pos_fact.product2
    default_value: "1/3 lb. Burger"  

  elements:
  - name: logo
    title: logo
    type: single_value
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.product_image]
    sorts: [pos_fact.product_image]
    limit: 500
    show_single_value_title: false
    show_comparison: false

  - name: Compare Two products
    title: Sales Comparison of two products
    type: looker_column
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_transaction_dt_day_of_week]
    measures: [pos_fact.Product1_Sales, pos_fact.Product2_Sales]
    sorts: [pos_fact.a_transaction_dt_day_of_week]
    listen: 
      Product_1: pos_fact.Product1
      Product_2:  pos_fact.Product2
      City: pos_fact.f_city
      Map-product-category: pos_fact.c_product_category
      Map-Quarter:  pos_fact.a_transaction_dt_quarter_of_year
      orgtype: pos_fact.f_org_typ 
    limit: 500
    stacking: ''
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    series_colors:
      pos_fact.Product1_Sales: '#EE3324'
      pos_fact.Product2_Sales: '#005DAA'
    series_labels:
      pos_fact.Product1_Sales: Product 1
      pos_fact.Product2_Sales: Product 2
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: custom
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Day of Week
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false
    
 
