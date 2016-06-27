- dashboard: restaurant_demo
  title: Restaurant Demo
  layout: grid
  rows:
    - elements: [Sales stats on Map, Sales by the Hour]
      height: 270
    - elements: [Compare Two products, Typical Sales Day Vs Evening]
      height: 270
    - elements: [Top 5 Products by Sale, Bottom 5 by Sales]
      height: 270
    - elements: [Cash vs Credit]
      height: 270

  filters:
  - name: Map-product-category
    title: 'Product Category - Map Chart Only'
    type: field_filter
    explore: pos_fact
    field: pos_fact.c_product_category
    default_value: "Bakery Treats"
   
  - name: Map-Quarter
    title: 'Quarter  - Map Chart Only'
    type: field_filter
    explore: pos_fact
    field: pos_fact.a_transaction_dt_quarter_of_year
    default_value: "Q1"
  
  - name: Product Name
    title: 'Product Name - Sales by Hour'
    type: field_filter
    explore: pos_fact
    field: pos_fact.c_product_name
    default_value: "Shake"
   
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

    
  - name: Store Name
    title: 'Store Name'
    type: field_filter
    explore: pos_fact
    field: pos_fact.f_store_name
  
    
    
    
  elements:

  - name: Sales stats on Map
    title: Sales stats on Map
    type: looker_map
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.latlon, pos_fact.f_store_name, pos_fact.f_city]
    measures: [pos_fact.Sale_USD]
    filters:
      pos_fact.f_country: United States
    listen: 
      Map-product-category: pos_fact.c_product_category
      Map-Quarter:  pos_fact.a_transaction_dt_quarter_of_year
    sorts: [pos_fact.latlon desc]
    limit: 500
    map_plot_mode: points
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: restaurant
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false


  - name: Sales by the Hour
    title: Sales by the Hour
    type: looker_column
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_transaction_dt_hour_of_day]
    measures: [pos_fact.Sale_USD]
    sorts: [pos_fact.a_transaction_dt_hour_of_day]
    listen: 
      Product Name: pos_fact.c_product_name
      City: pos_fact.f_city
      Date: pos_fact.date_only
      Store Name: pos_fact.f_store_name
    limit: 500
    stacking: ''
    colors: ['#5245ed', '#ed6168', '#1ea8df', '#353b49', '#49cec1', '#b3a0dd', '#db7f2a',
      '#706080', '#a2dcf3', '#776fdf', '#e9b404', '#635189']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    series_colors:
      pos_fact.Sale_USD: 005DAA
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: custom
    y_axis_tick_density_custom: 4
    show_x_axis_label: true
    x_axis_label: Hour Of Day
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false
    
    
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
      Store Name: pos_fact.f_store_name
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
  
  - name: Typical Sales Day Vs Evening
    title: Typical Sales Day Vs Evening
    type: looker_area
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_transaction_dt_day_of_week]
    measures: [pos_fact.sumday, pos_fact.sumeve, pos_fact.Sale_USD]
    hidden_fields: [pos_fact.Sale_USD]
    sorts: [pos_fact.a_transaction_dt_day_of_week]
    listen: 
      City: pos_fact.f_city
      Store Name: pos_fact.f_store_name
    limit: 500
    stacking: normal
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    series_colors:
      pos_fact.sumday: '#005DAA'
      pos_fact.sumeve: '#FFEB6D'
    series_labels:
      pos_fact.sumday: Day
      pos_fact.sumeve: Evening (after 5pm)
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: custom
    y_axis_tick_density_custom: 6
    show_x_axis_label: true
    x_axis_label: Day of Week
    show_x_axis_ticks: true
    x_axis_scale: auto
    point_style: circle
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'
  
  - name: Top 5 Products by Sale
    title: Top 5 products
    type: looker_bar
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.c_product_name]
    measures: [pos_fact.Sale_USD]
    sorts: [pos_fact.Sale_USD desc]
    listen: 
      City: pos_fact.f_city
      Store Name: pos_fact.f_store_name
    limit: 5
    stacking: ''
    colors: [red, blue, green, yellow, brown, '#db341d']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    series_colors:
      pos_fact.Sale_USD: '#EE3324'
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: default
    show_x_axis_label: true
    x_axis_label: Product Name
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false
  
  - name: Bottom 5 by Sales
    title: Bottom 5 Products by Sales
    type: looker_bar
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.c_product_name]
    measures: [pos_fact.Sale_USD]
    sorts: [pos_fact.Sale_USD]
    listen: 
     City: pos_fact.f_city
     Store Name: pos_fact.f_store_name
    limit: 5
    stacking: ''
    colors: [orange, darkblue, lightgreen, silver, purple]
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: default
    show_x_axis_label: true
    x_axis_label: Product Name
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false

  - name: Cash vs Credit
    title: Cash vs Credit Transactions by Category
    type: looker_bar
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_payment_typ, pos_fact.c_product_category]
    pivots: [pos_fact.a_payment_typ]
    measures: [pos_fact.Sale_USD]
    listen:
      City: pos_fact.f_city
      Store Name: pos_fact.f_store_name
    sorts: [pos_fact.a_payment_typ desc, pos_fact.Sale_USD desc 0]
    
    limit: 500
    column_limit: 50
    stacking: percent
    colors: ['#5245ed', '#ed6168', '#1ea8df', '#353b49', '#49cec1', '#b3a0dd', '#db7f2a',
      '#706080', '#a2dcf3', '#776fdf', '#e9b404', '#635189']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    series_colors:
      Credit: '#005DAA'
      Cash: FFEB6D
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: custom
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Product Name
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
