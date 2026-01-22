-- Create the bronze schema
CREATE SCHEMA IF NOT EXISTS bronze;

-- Create the orders table
-- Date and date calculations left as text format (fix in Silver layer)
CREATE TABLE bronze.orders (
    user_id                    VARCHAR(50),
    order_id                   VARCHAR(50),
    
    purchase_ts                TEXT,
    purchase_year              INTEGER,
    purchase_month             INTEGER,
    
    ship_ts                    TEXT,
    time_to_ship               TEXT,
    
    product_name               TEXT,
    product_id                 VARCHAR(50),
    
    usd_price                  NUMERIC(10, 2),
    
    purchase_platform          VARCHAR(50),
    marketing_channel          VARCHAR(50),
    account_creation_method    VARCHAR(50),
    
    country_code               VARCHAR(10),
    region                     VARCHAR(50)
);

-- Populate bronze table with data from CSV file
COPY bronze.orders (
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
FROM '/Users/justinkakuyo/Desktop/Dev/Data Analytics/Projects/Gamezone/Gamezone Dataset/cleaned_csv/gamezone-orders-data(1).xlsx - orders_export.csv'
DELIMITER ','
CSV HEADER;