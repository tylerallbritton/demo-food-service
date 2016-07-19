- dashboard: restaurant_demo_page_4
  title: Restaurant Demo Page 4
  layout: tile
  tile_size: 125

  filters:

  - name: City
    title: 'City'
    type: field_filter
    explore: cost_and_sales_split
    field: cost_and_sales_split.city

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
    sorts: [cost_and_sales_split.food_cost desc]
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


