-- Check that price_category column in gold.fact_orders is categorized correctly
SELECT
    COUNT(*) AS total_misclassified
FROM gold.fact_orders
WHERE 
    (price_category = 'High' AND price_usd < 100)
    OR (price_category = 'Medium' AND (price_usd < 50 OR price_usd >= 100))
    OR (price_category = 'Low' AND price_usd >= 50)
;
-- Result: 0 total_misclassified

-- Check that shipping_speed column in gold.fact_orders is categorized correctly
SELECT
    COUNT(*) AS total_misclassified
FROM gold.fact_orders
WHERE 
    (shipping_speed = 'Fast' AND days_to_ship > 2)
    OR (shipping_speed = 'Standard' AND (days_to_ship < 3 OR days_to_ship > 5))
    OR (shipping_speed = 'Slow' AND days_to_ship <= 5)
;
-- Result: 0 total_misclassified

-- Check for any null values in critical columns of gold.fact_orders
SELECT
    COUNT(*) AS total_nulls
FROM gold.fact_orders
WHERE 
    user_id IS NULL
    OR order_id IS NULL
    OR order_date IS NULL
    OR product_id IS NULL
    OR price_usd IS NULL
;
-- Result: 0 total nulls

-- Check that marketing_channel in gold.dim_customers properly formats text
SELECT
    COUNT(*) AS total_misformatted
FROM gold.dim_customers
WHERE 
    marketing_channel NOT IN ('Affiliate', 'Email', 'Social Media', 'Direct', 'Unknown')
;
-- Result: 0 total_misformatted

-- Check that signup_method in gold.dim_customers properly formats text
SELECT
    COUNT(*) AS total_misformatted
FROM gold.dim_customers
WHERE 
    signup_method NOT IN ('Mobile', 'TV', 'Desktop', 'Tablet', 'Unknown')
;
-- Result: 0 total_misformatted

-- Check that views JOIN properly (to prepare for dashboard data modeling)
SELECT
    o.user_id
FROM gold.fact_orders o
JOIN gold.dim_customers c ON o.user_id = c.user_id
LIMIT 10
;
-- gold.orders view joins successfully with gold.customers

SELECT
    o.product_id
FROM gold.fact_orders o
JOIN gold.dim_products p ON o.product_id = p.product_id
LIMIT 10
;
-- gold.orders view joins successfully with gold.products