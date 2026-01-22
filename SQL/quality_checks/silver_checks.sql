-- How much of the data is affected by products with multiple ids for the same name?
WITH cte AS(
SELECT 
    product_id,
    product_name,
    COUNT(*) AS num_ids
FROM silver.orders
GROUP BY product_id, product_name
HAVING COUNT(*) > 1
ORDER BY product_name, num_ids DESC
)
SELECT
    SUM(num_ids) AS total_id_variations
FROM cte
;
-- Result: Vast majority of the data contains products with different ids for the same name.

-- Check for duplicate order_ids in the silver.orders table
SELECT
    order_id,
    COUNT(*) AS duplicate_count
FROM silver.orders
GROUP BY order_id
HAVING COUNT(*) > 1
;
-- Result: duplicate order_ids found (110 order ids are duplicated). Refer to data source owners for resolution.