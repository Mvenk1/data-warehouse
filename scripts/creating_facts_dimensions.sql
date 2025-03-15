CREATE OR REPLACE TABLE `data-warehouse-ecommerce.ecom.dim_customers` AS
SELECT
    GENERATE_UUID() AS customer_key,  -- Surrogate Key
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
FROM `data-warehouse-ecommerce.ecom.staging_customers`;

CREATE OR REPLACE TABLE `data-warehouse-ecommerce.ecom.dim_products` AS
SELECT
    GENERATE_UUID() AS product_key,  -- Surrogate Key
    product_id,
    product_category_name,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM `data-warehouse-ecommerce.ecom.staging_products`;


CREATE OR REPLACE TABLE `data-warehouse-ecommerce.ecom.dim_sellers` AS
SELECT
    GENERATE_UUID() AS seller_key,  -- Surrogate Key
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
FROM `data-warehouse-ecommerce.ecom.staging_sellers`;


CREATE OR REPLACE TABLE `data-warehouse-ecommerce.ecom.fact_orders` AS
SELECT
    o.order_id,
    c.customer_key,
    p.payment_value AS total_payment,
    oi.price AS total_price,
    oi.freight_value AS total_freight,
    s.seller_key,
    o.order_status,
    o.order_purchase_timestamp
FROM `data-warehouse-ecommerce.ecom.staging_orders` o
JOIN `data-warehouse-ecommerce.ecom.dim_customers` c ON o.customer_id = c.customer_id
JOIN `data-warehouse-ecommerce.ecom.staging_payments` p ON o.order_id = p.order_id
JOIN `data-warehouse-ecommerce.ecom.staging_order_items` oi ON o.order_id = oi.order_id
JOIN `data-warehouse-ecommerce.ecom.dim_sellers` s ON oi.seller_id = s.seller_id;