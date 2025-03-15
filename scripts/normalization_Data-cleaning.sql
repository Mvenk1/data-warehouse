-- Remove orders with NULL timestamps (essential for time-based analysis)
DELETE FROM orders WHERE order_purchase_timestamp IS NULL;

-- Fill missing product weight with median value
UPDATE products
SET product_weight_g = (
    SELECT MEDIAN(product_weight_g) FROM products WHERE product_weight_g IS NOT NULL
)
WHERE product_weight_g IS NULL;

-- Convert negative prices to NULL (invalid data)
UPDATE order_items
SET price = NULL
WHERE price < 0;

-- Remove duplicate customer entries based on customer_unique_id
DELETE FROM customers
WHERE customer_id NOT IN (
    SELECT MIN(customer_id) FROM customers GROUP BY customer_unique_id
);


-- Ensure all foreign keys exist before inserting
DELETE FROM order_items WHERE order_id NOT IN (SELECT order_id FROM orders);
DELETE FROM order_reviews WHERE order_id NOT IN (SELECT order_id FROM orders);
DELETE FROM order_payments WHERE order_id NOT IN (SELECT order_id FROM orders);