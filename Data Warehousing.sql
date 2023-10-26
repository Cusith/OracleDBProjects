-- Data Warehousing Best Practices

-- 1. Partitioning for Large Tables
CREATE TABLE Sales_Fact (
    sale_id NUMBER,
    date_id NUMBER,
    product_id NUMBER,
    store_id NUMBER,
    customer_id NUMBER,
    sales_amount NUMBER(10, 2),
    quantity_sold NUMBER,
    -- other relevant metrics
)
PARTITION BY RANGE (date_id) (
    PARTITION sales_data_2021 VALUES LESS THAN (TO_DATE('2022-01-01', 'YYYY-MM-DD')),
    PARTITION sales_data_2022 VALUES LESS THAN (TO_DATE('2023-01-01', 'YYYY-MM-DD')),
    PARTITION sales_data_future VALUES LESS THAN (MAXVALUE)
);

-- 2. Indexing for Performance
CREATE INDEX idx_product_name ON Product_Dim(product_name);
CREATE INDEX idx_customer_email ON Customer_Dim(email);

-- 3. Materialized Views for Aggregation
CREATE MATERIALIZED VIEW Monthly_Sales_View AS
SELECT
    TO_CHAR(d.calendar_date, 'YYYY-MM') AS month,
    SUM(sf.sales_amount) AS monthly_sales
FROM
    Date_Dim d
JOIN
    Sales_Fact sf ON d.date_id = sf.date_id
GROUP BY
    TO_CHAR(d.calendar_date, 'YYYY-MM');

-- 4. Parallel Processing
-- Use parallel hint for a large query
SELECT /*+ parallel(sf, 4) */ 
    p.product_name,
    SUM(sf.quantity_sold) AS total_quantity_sold
FROM
    Product_Dim p
JOIN
    Sales_Fact sf ON p.product_id = sf.product_id
GROUP BY
    p.product_name
ORDER BY
    total_quantity_sold DESC;

-- 5. Data Quality Checks
-- Check for missing values in the Customer_Dim table
SELECT
    COUNT(*) AS missing_values
FROM
    Customer_Dim
WHERE
    customer_id IS NULL OR customer_name IS NULL OR email IS NULL;

-- 6. Use of Analytic Functions
-- Rank products based on sales amount
SELECT
    product_name,
    sales_amount,
    RANK() OVER (ORDER BY sales_amount DESC) AS sales_rank
FROM
    (
        SELECT
            p.product_name,
            SUM(sf.sales_amount) AS sales_amount
        FROM
            Product_Dim p
        JOIN
            Sales_Fact sf ON p.product_id = sf.product_id
        GROUP BY
            p.product_name
    ) ranked_products;
