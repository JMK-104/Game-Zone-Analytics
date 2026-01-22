-- Check to see if data was ingested into the bronze.orders table
SELECT
    * 
FROM bronze.orders
LIMIT 20
;

-- Count the number of records in the bronze.orders table
SELECT
    COUNT(*) AS total_records
FROM bronze.orders
;
-- Result: total number of records is correct

-- Check for null values in key columns of the bronze.orders table
SELECT
    COUNT(*) AS null_customer_id,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN purchase_ts IS NULL THEN 1 ELSE 0 END) AS null_order_date
FROM bronze.orders
;
--  Result: No null values in key columns

-- Check naming format of product names
SELECT
    product_name,
    COUNT(*) AS name_count
FROM bronze.orders
WHERE product_name LIKE '%27in%'
GROUP BY product_name
;
-- Result: Product names follow same naming format issue found in Excel version