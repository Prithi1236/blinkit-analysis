-- Example analysis queries
-- Orders per city & day
SELECT c.city_id, COUNT(*) as orders, DATE(o.order_placed_timestamp) as day
FROM fact_orders o JOIN dim_customers c USING (customer_id)
GROUP BY c.city_id, day
ORDER BY day;

-- Peak hour heatmap
SELECT EXTRACT(dow FROM order_placed_timestamp)::int AS weekday,
       EXTRACT(hour FROM order_placed_timestamp)::int AS hour,
       COUNT(*) AS orders
FROM fact_orders
GROUP BY 1,2
ORDER BY 1,2;

-- On-time delivery by dark store
SELECT ds.dark_store_id, ds.name,
       COUNT(*) FILTER (WHERE order_delivery_time_minutes <= order_promised_minutes) * 1.0 / COUNT(*) as on_time_rate,
       AVG(order_delivery_time_minutes) as avg_delivery_minutes
FROM fact_orders fo JOIN dim_dark_stores ds USING (dark_store_id)
GROUP BY ds.dark_store_id, ds.name
ORDER BY on_time_rate ASC;
