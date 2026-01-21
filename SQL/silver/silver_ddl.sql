-- Create silver schema
CREATE SCHEMA silver;

-- Create orders table in the silver schema
CREATE TABLE silver.orders (
    user_id                    VARCHAR(50),
    order_id                   VARCHAR(50),
    
    purchase_ts                TIMESTAMP,
    purchase_year              INTEGER,
    purchase_month             INTEGER,
    
    ship_ts                    TIMESTAMP,
    time_to_ship               INTEGER,
    
    product_name               TEXT,
    product_id                 VARCHAR(50),
    
    usd_price                  NUMERIC(10, 2),
    
    purchase_platform          VARCHAR(50),
    marketing_channel          VARCHAR(50),
    account_creation_method    VARCHAR(50),
    
    country_code               VARCHAR(10),
    region                     VARCHAR(50)
);

--  Populate silver.orders from bronze.orders with data type transformations
INSERT INTO silver.orders (
    user_id,
    order_id,
    purchase_ts,
    purchase_year,
    purchase_month,
    ship_ts,
    time_to_ship,
    product_name,
    product_id,
    usd_price,
    purchase_platform,
    marketing_channel,
    account_creation_method,
    country_code,
    region
)
SELECT
    TRIM(user_id) AS user_id,
    TRIM(order_id) AS order_id,
    DATE(purchase_ts) AS purchase_ts,
    purchase_year AS purchase_year,
    purchase_month AS purchase_month,
    DATE(ship_ts) AS ship_ts,
    CAST(time_to_ship AS INTEGER) AS time_to_ship,
    CASE
        WHEN TRIM(product_name) = '27in 4k gaming monitor' THEN '27in 4K Gaming Monitor'
        WHEN TRIM(product_name) = '27in 4K gaming monitor' THEN '27in 4K Gaming Monitor'
        ELSE TRIM(product_name)
    END AS product_name,
    TRIM(product_id) AS product_id,
    usd_price AS usd_price,
    TRIM(purchase_platform) AS purchase_platform,
    TRIM(marketing_channel) AS marketing_channel,
    TRIM(account_creation_method) AS account_creation_method,
    TRIM(country_code) AS country_code,
    TRIM(region) AS region
FROM bronze.orders
WHERE time_to_ship IS NOT NULL 
    AND time_to_ship != '#NUM!'
    AND usd_price IS NOT NULL
    AND usd_price != 0
    AND country_code IS NOT NULL
;
