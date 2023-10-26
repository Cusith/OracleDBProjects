-- Inserting data into Date_Dim
INSERT INTO Date_Dim (date_id, calendar_date, day_of_week, month, quarter, year)
VALUES
    (1, TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'Sunday', 'January', 'Q1', 2023),
    (2, TO_DATE('2023-01-02', 'YYYY-MM-DD'), 'Monday', 'January', 'Q1', 2023),
    -- Add more rows as needed
    (N, TO_DATE('2023-MM-DD', 'YYYY-MM-DD'), 'DayOfWeek', 'Month', 'Quarter', 2023);

-- Populating Product_Dim table
INSERT INTO Product_Dim (product_id, product_name, category, price, inventory_level)
VALUES
(1, 'Product A', 'Electronics', 499.99, 100),
(2, 'Product B', 'Clothing', 39.99, 200);
-- Add more rows as needed

-- Populating Store_Dim table
INSERT INTO Store_Dim (store_id, store_name, location, region)
VALUES
(1, 'Store X', 'City A', 'Region 1'),
(2, 'Store Y', 'City B', 'Region 2');
-- Add more rows as needed

-- Populating Customer_Dim table
INSERT INTO Customer_Dim (customer_id, customer_name, email, age, gender)
VALUES
(1, 'John Doe', 'john.doe@example.com', 30, 'Male'),
(2, 'Jane Smith', 'jane.smith@example.com', 25, 'Female');
-- Add more rows as needed

-- Populating Sales_Fact table
INSERT INTO Sales_Fact (sale_id, date_id, product_id, store_id, customer_id, sales_amount, quantity_sold)
VALUES
(1, 1, 1, 1, 1, 199.99, 2),
(2, 2, 2, 2, 2, 79.98, 3);
-- Add more rows as needed
