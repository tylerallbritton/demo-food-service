- connection: demo-food-service

- include: "*.view.lookml"       # include all the views
- include: "*.dashboard.lookml"  # include all the dashboards

# NOTE: please see https://www.looker.com/docs/r/dialects/bigquery
# NOTE: for BigQuery specific considerations

- explore: customers

- explore: locations

- explore: pos_fact

- explore: products

- explore: staff
  joins:
    - join: locations
      type: left_outer #_each
      sql_on: ${staff.location_id} = ${locations.location_id}
      relationship: many_to_one


- explore: transaction_details
  joins:
    - join: products
      type: left_outer #_each
      sql_on: ${transaction_details.product_id} = ${products.product_id}
      relationship: many_to_one

    - join: transactions
      type: left_outer #_each
      sql_on: ${transaction_details.transaction_id} = ${transactions.transaction_id}
      relationship: many_to_one

    - join: staff
      type: left_outer #_each
      sql_on: ${transactions.staff_id} = ${staff.staff_id}
      relationship: many_to_one

    - join: customers
      type: left_outer #_each
      sql_on: ${transactions.customer_id} = ${customers.customer_id}
      relationship: many_to_one

    - join: locations
      type: left_outer #_each
      sql_on: ${transactions.location_id} = ${locations.location_id}
      relationship: many_to_one


- explore: transactions
  joins:
    - join: staff
      type: left_outer #_each
      sql_on: ${transactions.staff_id} = ${staff.staff_id}
      relationship: many_to_one

    - join: customers
      type: left_outer #_each
      sql_on: ${transactions.customer_id} = ${customers.customer_id}
      relationship: many_to_one

    - join: locations
      type: left_outer #_each
      sql_on: ${transactions.location_id} = ${locations.location_id}
      relationship: many_to_one


