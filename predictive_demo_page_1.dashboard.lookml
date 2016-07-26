- dashboard: predictive_demo
  title: Predictive Demo Page-1
  layout: grid
  rows:
    - elements: [logo]
      height: 45
    - elements: [Linear Regression Results]
      height: 200
    - elements: [Trans by Weather - Hist, Results]
      height: 370
    - elements: [rain transactions]
      height: 370


#  filters:

  elements:
  
  - name: Trans by Weather - Hist
    title: Transactions Per Hour by Weather Condition- Dallas Location
    type: looker_column
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_weather_cond]
    measures: [pos_fact.avgtrans]
    filters:
      pos_fact.f_city: Dallas
    sorts: [pos_fact.avgtrans desc]
    limit: 500
    stacking: ''
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    series_colors:
      pos_fact.avgtrans: '#005DAA'
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Average Transactions per Hour]
    y_axis_tick_density: default
    show_x_axis_label: true
    x_axis_label: Weather Condition
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false



  - name: Linear Regression Results
    explore: pos_fact
    title_text: "Correlation Between Weather And Sales"
    subtitle_text: ""
    body_text: ""
    type: text
    show_single_value_title: false
    show_comparison: false

  
  - name: Results
    explore: pos_fact
    type: single_value
    model: food_service_demo
    dimensions: [pos_fact.predictive_image]
    sorts: [pos_fact.predictive_image]
    limit: 500
    show_single_value_title: false
    show_comparison: false

    
    
  - name: logo
    title: logo
    height: 55
    type: single_value
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.product_image]
    sorts: [pos_fact.product_image]
    limit: 500
    show_single_value_title: false
    show_comparison: false
    
  - name: rain transactions
    title: Transactions Per Hour on Rainy Days
    type: looker_scatter
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_transaction_dt_hour]
    measures: [pos_fact.disttrans]
    filters:
      pos_fact.a_weather_cond: Rain
      pos_fact.f_city: Dallas
    sorts: [pos_fact.a_transaction_dt_hour desc]
    limit: 500
    stacking: ''
    colors: ['#62bad4', '#a9c574', '#929292', '#9fdee0', '#1f3e5a', '#90c8ae', '#92818d',
      '#c5c6a6', '#82c2ca', '#cee0a0', '#928fb4', '#9fc190']
    show_value_labels: false
    label_density: 25
    legend_position: center
    y_axis_gridlines: true
    show_view_names: true
    series_colors:
      pos_fact.disttrans: red
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    show_x_axis_label: true
    x_axis_label: Transactions per Hour
    show_x_axis_ticks: false
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    reference_lines: [{reference_type: margins, line_value: mean, range_start: max,
        range_end: min, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        color: blue}]
    show_null_points: true
    point_style: circle
  
  
