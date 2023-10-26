-- Fact Table
CREATE TABLE Sales_Fact (
    sale_id NUMBER PRIMARY KEY,
    date_id NUMBER,
    product_id NUMBER,
    store_id NUMBER,
    customer_id NUMBER,
    sales_amount NUMBER(10, 2),
    quantity_sold NUMBER,
    -- other relevant metrics
    CONSTRAINT fk_date FOREIGN KEY (date_id) REFERENCES Date_Dim(date_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES Product_Dim(product_id),
    CONSTRAINT fk_store FOREIGN KEY (store_id) REFERENCES Store_Dim(store_id),
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES Customer_Dim(customer_id)
);

-- Dimension Tables
CREATE TABLE Date_Dim (
    date_id NUMBER PRIMARY KEY,
    calendar_date DATE,
    day_of_week VARCHAR2(10),
    month VARCHAR2(20),
    quarter VARCHAR2(10),
    year NUMBER
    -- other time-related attributes
);

CREATE TABLE Product_Dim (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(50),
    category VARCHAR2(30),
    price NUMBER(8, 2),
    inventory_level NUMBER
    -- other product-related attributes
);

CREATE TABLE Store_Dim (
    store_id NUMBER PRIMARY KEY,
    store_name VARCHAR2(50),
    location VARCHAR2(50),
    region VARCHAR2(30)
    -- other store-related attributes
);

CREATE TABLE Customer_Dim (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    email VARCHAR2(50),
    age NUMBER,
    gender VARCHAR2(10)
    -- other customer-related attributes
);
