SELECT
    p.category,
    SUM(sf.sales_amount) AS total_sales_amount
FROM
    Product_Dim p
JOIN
    Sales_Fact sf ON p.product_id = sf.product_id
GROUP BY
    p.category;
