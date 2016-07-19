- dashboard: restaurant_demo_page3
  title: Restaurant Demo Page3
  layout: grid
  rows:
    - elements: [logo]
      height: 55
    - elements: [Text Analytics Algorithm]
      height: 110
    - elements: [Review Search Table, Rating Counts]
      height: 270
      width: 800
    - elements: [topwords]
      height: 370
      width: 800
  filters:
  - name: Search Words
    title: 'Search Word'
    type: field_filter
    explore: reviews
    field: reviews.comments
  
   
  - name: address
    title: 'Address'
    type: field_filter
    explore: reviews
    field: reviews.address
    
  - name: reviews by rating
    title: 'Reviews by rating'
    type: field_filter
    explore: reviews
    field: reviews.ratings
   
   
    
  elements:
  - name: Text Analytics Algorithm
    explore: reviews
    title_text: "Model Predicts 80% of Bad Reviews Based on Text Alone"
    subtitle_text: "Predict Good and Bad Reviews Based on Text"
    body_text: "Reviews fromHouston Area and Austin Area Luby's Restaurants are used for this Analysis"
    type: text
    show_single_value_title: false
    show_comparison: false
  
  
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

  - name: Review Search Table
    title: Luby's Review Search Table
    type: table
    model: food_service_demo
    explore: reviews
    dimensions: [reviews.ratings, reviews.comments, reviews.address, reviews.phone]
    measures: [reviews.count]
    hidden_fields: [reviews.count]
    sorts: [reviews.ratings]
    listen: 
      Search Words: reviews.comments
      address: reviews.address
      reviews by rating: reviews.ratings
      
    limit: 500
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    table_theme: editable
    limit_displayed_rows: false


  
  
  - name: Rating Counts
    title: Luby's Rating Counts
    type: looker_column
    model: food_service_demo
    explore: reviews
    dimensions: [reviews.ratings]
    measures: [reviews.count]
    listen: 
      address: reviews.address
    sorts: [reviews.ratings]
    limit: 500
    column_limit: 50
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
      reviews.count: darkred
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_labels: [No of Reviews]
    y_axis_tick_density: default
    show_x_axis_label: true
    x_axis_label: Star Rating
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    show_null_labels: false
    
  - name: topwords
    title: Top Words in Postive and Negative Reviews of Luby's
    type: single_value
    model: food_service_demo
    explore: reviews
    dimensions: [reviews.FBI_image]
    sorts: [reviews.FBI_image]
    limit: 500
    show_single_value_title: false
    show_comparison: false



