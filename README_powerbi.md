Power BI instructions

This folder is a placeholder for Blinkit_report.pbix.
To create the report:
1. Open Power BI Desktop.
2. Get Data -> CSV -> select the CSVs in data/ folder or connect to your DB.
3. Create relationships:
   - fact_orders.order_id -> fact_order_items.order_id
   - fact_orders.customer_id -> dim_customers.customer_id
   - fact_order_items.product_id -> dim_products.product_id
4. Create measures (examples):
   - Orders = COUNT(fact_orders[order_id])
   - OnTimeRate = DIVIDE(CALCULATE(COUNTROWS(fact_orders),FILTER(fact_orders,fact_orders[order_delivery_time_minutes] <= fact_orders[order_promised_minutes])), COUNTROWS(fact_orders))
5. Build pages: Executive, Operations, Growth, Product & Assortment.
