- dashboard: restaurant_demo_page_3
  title: Restaurant Demo Page-3
  layout: grid
  rows:
    - elements: [logo]
      height: 55
    - elements: [Sales_Cost,yoy]

  filters:

  - name: City
    title: 'City'
    type: field_filter
    explore: cost_and_sales_split
    field: cost_and_sales_split.city
    
  - name: Date
    title: 'Date'
    type: field_filter
    explore: cost_and_sales_split
    field: cost_and_sales_split.transaction_date

  elements:

  - name: Sales_Cost
    title: Sales Vs Cost
    type: looker_column
    model: food_service_demo
    explore: cost_and_sales_split
    dimensions: [cost_and_sales_split.city, cost_and_sales_split.category]
    measures: [cost_and_sales_split.sales, cost_and_sales_split.food_cost, cost_and_sales_split.staff_cost]
    listen:
      City: cost_and_sales_split.city
      Date: cost_and_sales_split.transaction_date
    sorts: [cost_and_sales_split.city desc, cost_and_sales_split.category]
    limit: 500
    stacking: normal
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    series_colors:
      cost_and_sales_split.sales: '#005DAA'
      cost_and_sales_split.food_cost: '#EE3324'
      cost_and_sales_split.staff_cost: '#FFEB6D'
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [USD]
    y_axis_tick_density: default
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: '#808080'


  - name: yoy
    title: Year Over Year Sales
    type: looker_column
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_transaction_dt_month_num]
    measures: [pos_fact.Year1_Sales, pos_fact.Year2_Sales]
    filters:
      pos_fact.Year1: '2015'
      pos_fact.Year2: '2016'
    sorts: [pos_fact.a_transaction_dt_month_num]
    listen:
      City: pos_fact.f_city
    limit: 500
    stacking: ''
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190', '#1986a8']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    series_colors:
      pos_fact.Year1_Sales: '#9AB8EB'
      pos_fact.Year2_Sales: '#005DAA'
    series_labels:
      pos_fact.Year1_Sales: '2015'
      pos_fact.Year2_Sales: '2016'
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: custom
    y_axis_tick_density_custom: 6
    show_x_axis_label: true
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_datetime_label: ''
    x_axis_scale: auto
    y_axis_scale_mode: linear
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

