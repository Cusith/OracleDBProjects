-- Data Transformation for Product_Dim
UPDATE Product_Dim p
SET
    total_sales_amount = (
        SELECT SUM(sf.sales_amount)
        FROM Sales_Fact sf
        WHERE sf.product_id = p.product_id
    ),
    total_quantity_sold = (
        SELECT SUM(sf.quantity_sold)
        FROM Sales_Fact sf
        WHERE sf.product_id = p.product_id
    );
