- dashboard: predictive_demo
  title: Predictive Demo
  layout: tile
  tile_size: 100

#  filters:

  elements:
  
  - name: Sale by Weather - Hist
    title: Sales by Weather Condition- Denver Location
    type: looker_column
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_weather_cond]
    measures: [pos_fact.Sale_USD]
    filters:
      pos_fact.f_store_name: Austin - Bee Cave
    sorts: [pos_fact.Sale_USD desc]
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
      pos_fact.Sale_USD: brown
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [Sales (USD)]
    y_axis_tick_density: custom
    y_axis_tick_density_custom: '5'
    show_x_axis_label: true
    x_axis_label: Weather Condition
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false

  - name: Linear Regression Results
    type: text
    explore: pos_fact
    title_text: "NO CORRELATION BETWEEN WEATHER AND SALES"
    subtitle_text: "Linear Regression - Sales by Weather Condition"
    body_text: "Least possible range indicates good predictability. In this case , there is not much variation in sales between different weather conditions. This model shows there is no variation in sales by weather condition.
    ===========================================================
    Condition   Baseline sale per hour                  Possible Range
    
    Clear                          213.6                                 208.595   218.681
    ============================================================
    Condition       Change in Sale-from Baseline         Possible Range
    
  
    Cold                                    -0.4                                  -20.088    19.217  
    
    Hot                                    -11.3                                  -26.280     3.535
    
    Rain                                    -1.3                                  -10.441     7.783
    
    Snow                                    6.6                                 -10.313    23.696
  
  ==========================================================="
  


  - name: Sales by Weather
    title: Sales Table by Weather Condition - Denver Location
    type: table
    model: food_service_demo
    explore: pos_fact
    dimensions: [pos_fact.a_weather_cond]
    measures: [pos_fact.Sale_USD, pos_fact.count, pos_fact.Avg_Sale_USD]
    filters:
      pos_fact.f_store_name: Austin - Bee Cave
    sorts: [pos_fact.Sale_USD desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    series_labels:
      pos_fact.a_weather_cond: Weather
      pos_fact.Sale_USD: Sales(USD)
      pos_fact.count: No of Transactions
      pos_fact.Avg_Sale_USD: Avg. Transaction Amount
    table_theme: white
    limit_displayed_rows: false
    
    
 
