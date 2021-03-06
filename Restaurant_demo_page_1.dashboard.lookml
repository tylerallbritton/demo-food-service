- dashboard: restaurant_demo_page_1
  title: Restaurant Demo Page-1
  layout: grid
  rows:
    - elements: [logo]
      height: 55
    - elements: [Sales stats on Map,Typical Sales Day Vs Evening]
      height: 270
    - elements: [Sales by the Hour,Top 5 Products by Sale]
      height: 270
    - elements: [Cash vs Credit, Bottom 5 by Sales]
      height: 270


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
    
  
  - name: Product Name
    title: 'Product Name'
    type: field_filter
    explore: pos_fact
    field: pos_fact.c_product_name
  
   
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
  
    
    
    
  elements:

  - name: Sales stats on Map
    title: Sales by Location
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
      Product Name: pos_fact.c_product_name
      City: pos_fact.f_city
      orgtype: pos_fact.f_org_typ 
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
    title: Sales Units by the Hour
    type: looker_column
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_transaction_dt_hour_of_day]
    measures: [pos_fact.count, pos_fact.food_cost_USD, pos_fact.Sale_USD]
    hidden_fields: [pos_fact.food_cost_USD, pos_fact.Sale_USD]
    sorts: [pos_fact.a_transaction_dt_hour_of_day]
    listen: 
      Product Name: pos_fact.c_product_name
      City: pos_fact.f_city
      Date: pos_fact.date_only
      Map-product-category: pos_fact.c_product_category
      Map-Quarter:  pos_fact.a_transaction_dt_quarter_of_year
      orgtype: pos_fact.f_org_typ 
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
      pos_fact.count: "#005DAA"
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (Units)]
    y_axis_tick_density: custom
    y_axis_tick_density_custom: 4
    show_x_axis_label: true
    x_axis_label: Hour Of Day
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
      Map-product-category: pos_fact.c_product_category
      Map-Quarter:  pos_fact.a_transaction_dt_quarter_of_year
      Product Name: pos_fact.c_product_name
      orgtype: pos_fact.f_org_typ 
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
    title: Top 5 Products by Sales
    type: looker_bar
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.c_product_name]
    measures: [pos_fact.Sale_USD]
    sorts: [pos_fact.Sale_USD desc]
    listen: 
      City: pos_fact.f_city
      Map-Quarter:  pos_fact.a_transaction_dt_quarter_of_year
      orgtype: pos_fact.f_org_typ 
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
     Map-Quarter:  pos_fact.a_transaction_dt_quarter_of_year
     orgtype: pos_fact.f_org_typ 
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
    title: Cash vs Credit Transactions
    type: looker_bar
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_payment_typ]
    measures: [pos_fact.Sale_USD]
    listen:
      City: pos_fact.f_city
      Map-product-category: pos_fact.c_product_category
      Map-Quarter:  pos_fact.a_transaction_dt_quarter_of_year
      Product Name: pos_fact.c_product_name
      orgtype: pos_fact.f_org_typ 
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
      pos_fact.Sale_USD: '#00BC13'
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

