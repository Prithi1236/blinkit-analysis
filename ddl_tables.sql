-- DDL for Blinkit analytics (Postgres compatible)
CREATE TABLE dim_customers (
  customer_id INT PRIMARY KEY,
  signup_date DATE,
  city_id INT,
  customer_tier VARCHAR(20)
);

CREATE TABLE dim_products (
  product_id INT PRIMARY KEY,
  product_name VARCHAR(255),
  aisle_id INT,
  department_id INT,
  price NUMERIC(10,2)
);

CREATE TABLE dim_dark_stores (
  dark_store_id INT PRIMARY KEY,
  city_id INT,
  name VARCHAR(255),
  latitude NUMERIC,
  longitude NUMERIC,
  capacity INT
);

CREATE TABLE fact_orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  order_placed_timestamp TIMESTAMP,
  order_promised_minutes INT,
  order_delivery_time_minutes INT,
  dark_store_id INT,
  delivery_partner_id INT,
  total_amount NUMERIC(12,2),
  payment_type VARCHAR(32),
  order_status VARCHAR(32)
);

CREATE TABLE fact_order_items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  add_to_cart_order INT,
  quantity INT,
  item_price NUMERIC(10,2)
);
