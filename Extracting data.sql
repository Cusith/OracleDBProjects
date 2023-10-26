-- Extracting data from POS_Transactions and transforming for Sales_Fact
INSERT INTO Sales_Fact (sale_id, date_id, product_id, store_id, customer_id, sales_amount, quantity_sold)
SELECT
    pt.transaction_id AS sale_id,
    TO_NUMBER(TO_CHAR(pt.transaction_date, 'YYYYMMDD')) AS date_id,
    pt.product_id,
    pt.store_id,
    c.customer_id,
    pt.sales_amount,
    pt.quantity_sold
FROM
    POS_Transactions pt
JOIN
    Date_Dim d ON TO_NUMBER(TO_CHAR(pt.transaction_date, 'YYYYMMDD')) = d.date_id
JOIN
    Product_Dim p ON pt.product_id = p.product_id
JOIN
    Store_Dim s ON pt.store_id = s.store_id
LEFT JOIN
    Customer_Dim c ON pt.customer_id = c.customer_id;
