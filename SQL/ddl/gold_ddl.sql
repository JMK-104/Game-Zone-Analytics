--  Create gold schema
CREATE SCHEMA gold;

-- Create orders view
CREATE OR REPLACE VIEW gold.fact_orders AS
SELECT
    user_id,
    order_id,
    DATE(purchase_ts) AS order_date,
    DATE(ship_ts) AS shipping_date,
    purchase_year AS order_year,
    purchase_month AS order_month,
    time_to_ship AS days_to_ship,
    CASE
        WHEN time_to_ship <= 2 THEN 'Fast'
        WHEN time_to_ship <= 5 THEN 'Standard'
        ELSE 'Slow'
    END AS shipping_speed,
    product_id,
    product_name,
    usd_price AS price_usd,
    CASE
        WHEN usd_price >= 100 THEN 'High'
        WHEN usd_price >= 50 THEN 'Medium'
        ELSE 'Low'
    END AS price_category,
    CASE
        WHEN purchase_platform = 'website' THEN 'Website'
        WHEN purchase_platform = 'mobile app' THEN 'Mobile App'
        ELSE 'Unknown'
    END AS platform,
    country_code
FROM silver.orders
;

-- Create products view
CREATE OR REPLACE VIEW gold.dim_products AS
SELECT
    product_id,
    product_name
FROM silver.orders
;

--  Create customers view
CREATE OR REPLACE VIEW gold.dim_customers AS
SELECT
    user_id,
    country_code,
    region,
        CASE
        WHEN marketing_channel = 'affiliate' THEN 'Affiliate'
        WHEN marketing_channel = 'email' THEN 'Email'
        WHEN marketing_channel = 'social media' THEN 'Social Media'
        WHEN marketing_channel = 'direct' THEN 'Direct'
        ELSE 'Unknown'
    END AS marketing_channel,
    CASE
        WHEN account_creation_method = 'mobile' THEN 'Mobile'
        WHEN account_creation_method = 'tv' THEN 'TV'
        WHEN account_creation_method = 'desktop' THEN 'Desktop'
        WHEN account_creation_method = 'tablet' THEN 'Tablet'
        ELSE 'Unknown'
    END AS signup_method
FROM silver.orders
;