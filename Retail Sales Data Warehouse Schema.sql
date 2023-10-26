-- Fact Table
CREATE TABLE Sales_Fact (
    sale_id INT PRIMARY KEY,
    date_id INT,
    product_id INT,
    store_id INT,
    customer_id INT,
    sales_amount DECIMAL(10, 2),
    quantity_sold INT,
    -- other relevant metrics
    FOREIGN KEY (date_id) REFERENCES Date_Dim(date_id),
    FOREIGN KEY (product_id) REFERENCES Product_Dim(product_id),
    FOREIGN KEY (store_id) REFERENCES Store_Dim(store_id),
    FOREIGN KEY (customer_id) REFERENCES Customer_Dim(customer_id)
);

-- Dimension Tables
CREATE TABLE Date_Dim (
    date_id INT PRIMARY KEY,
    calendar_date DATE,
    day_of_week VARCHAR(10),
    month VARCHAR(20),
    quarter VARCHAR(10),
    year INT
    -- other time-related attributes
);

CREATE TABLE Product_Dim (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(8, 2),
    inventory_level INT
    -- other product-related attributes
);

CREATE TABLE Store_Dim (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(50),
    location VARCHAR(50),
    region VARCHAR(30)
    -- other store-related attributes
);

CREATE TABLE Customer_Dim (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(50),
    age INT,
    gender VARCHAR(10)
    -- other customer-related attributes
);
