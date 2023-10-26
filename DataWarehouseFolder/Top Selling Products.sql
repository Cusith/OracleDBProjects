SELECT
    p.product_name,
    SUM(sf.quantity_sold) AS total_quantity_sold
FROM
    Product_Dim p
JOIN
    Sales_Fact sf ON p.product_id = sf.product_id
GROUP BY
    p.product_name
ORDER BY
    total_quantity_sold DESC
FETCH FIRST 10 ROWS ONLY;
