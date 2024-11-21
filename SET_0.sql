-- ================================
-- Amazon Project - Advanced SQL
-- ================================

-- Problem: Solve 20+ Advanced Business Problems with SQL
-- Purpose: To create tables, import data, and write queries for analytics.
-- --------------------------------

-- ===============================
-- Database Schema Creation
-- ===============================

-- CATEGORY TABLE
CREATE TABLE category (
    category_id INT PRIMARY KEY, -- Unique identifier for each product category
    category_name VARCHAR(25) -- Name of the product category
);

-- CUSTOMERS TABLE
CREATE TABLE customers (
    customer_id INT PRIMARY KEY, -- Unique identifier for each customer
    first_name VARCHAR(30), -- First name of the customer
    last_name VARCHAR(30), -- Last name of the customer
    state VARCHAR(30), -- State where the customer resides
    address VARCHAR(5) DEFAULT ('xxx') -- Placeholder for address; default value is 'xxx'
);

-- SELLERS TABLE
CREATE TABLE sellers (
    seller_id INT PRIMARY KEY, -- Unique identifier for each seller
    seller_name VARCHAR(30), -- Name of the seller
    origin VARCHAR(100) -- Origin of the seller (updated to VARCHAR(100) to avoid truncation issues)
);

-- PRODUCTS TABLE
CREATE TABLE products (
    product_id INT PRIMARY KEY, -- Unique identifier for each product
    product_name VARCHAR(50), -- Name of the product
    price FLOAT, -- Selling price of the product
    cogs FLOAT, -- Cost of goods sold
    category_id INT, -- Foreign key to the category table
    CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES category(category_id) -- Ensures category integrity
);

-- ORDERS TABLE
CREATE TABLE orders (
    order_id INT PRIMARY KEY, -- Unique identifier for each order
    order_date DATE, -- Date when the order was placed
    customer_id INT, -- Foreign key referencing the customers table
    seller_id INT, -- Foreign key referencing the sellers table
    order_status VARCHAR(30), -- Status of the order (e.g., completed, pending)
    CONSTRAINT orders_fk_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id), -- Customer reference
    CONSTRAINT orders_fk_seller FOREIGN KEY (seller_id) REFERENCES sellers(seller_id) -- Seller reference
);

-- ORDER_ITEMS TABLE
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY, -- Unique identifier for each item in an order
    order_id INT, -- Foreign key referencing the orders table
    product_id INT, -- Foreign key referencing the products table
    quantity INT, -- Quantity of the product in the order
    price_per_unit FLOAT, -- Selling price per unit of the product
    CONSTRAINT order_items_fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id), -- Order reference
    CONSTRAINT order_items_fk_product FOREIGN KEY (product_id) REFERENCES products(product_id) -- Product reference
);

-- PAYMENTS TABLE
CREATE TABLE payments (
    payment_id INT PRIMARY KEY, -- Unique identifier for each payment
    order_id INT, -- Foreign key referencing the orders table
    payment_date DATE, -- Date when the payment was made
    payment_status VARCHAR(30), -- Status of the payment (e.g., completed, failed)
    CONSTRAINT payments_fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Order reference
);

-- SHIPPINGS TABLE
CREATE TABLE shippings (
    shipping_id INT PRIMARY KEY, -- Unique identifier for each shipping record
    order_id INT, -- Foreign key referencing the orders table
    shipping_date DATE, -- Date when the order was shipped
    return_date DATE, -- Date when the order was returned (if applicable)
    shipping_provider VARCHAR(30), -- Name of the shipping provider
    delivery_status VARCHAR(30), -- Status of the delivery (e.g., delivered, pending)
    CONSTRAINT shippings_fk_order FOREIGN KEY (order_id) REFERENCES orders(order_id) -- Order reference
);

-- INVENTORY TABLE
CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY, -- Unique identifier for each inventory record
    product_id INT, -- Foreign key referencing the products table
    stock_remaining INT, -- Remaining stock of the product
    warehouse_id INT, -- Identifier for the warehouse
    last_stock_date DATE, -- Date when the stock was last updated
    CONSTRAINT inventory_fk_product FOREIGN KEY (product_id) REFERENCES products(product_id) -- Product reference
);

-- ===============================
-- Data Validation Queries
-- ===============================

-- View all tables before importing data to ensure proper schema creation
SELECT * FROM category;
SELECT * FROM customers;
SELECT * FROM inventory;
SELECT * FROM order_items;
SELECT * FROM orders;
SELECT * FROM payments;
SELECT * FROM sellers;
SELECT * FROM shippings;
SELECT * FROM products;

-- ===============================
-- Data Importing Order
-- ===============================
-- 1. Import data for `category`
-- 2. Import data for `customers`
-- 3. Import data for `sellers`
--     -- Note: Ensure `origin` column is updated to VARCHAR(100) if necessary to avoid data truncation
-- 4. Import data for `products`
-- 5. Import data for `orders`
-- 6. Import data for `order_items`
-- 7. Import data for `payments`
-- 8. Import data for `shippings`
-- 9. Import data for `inventory`
-- IMPORTANT: The CSV files must follow the same column order as the table schema to avoid errors.

-- Alter `sellers` table to update column size
ALTER TABLE sellers
ALTER COLUMN origin TYPE VARCHAR(100);

-- ===============================
-- Final Notes
-- ===============================
-- Ensure all foreign key constraints are respected during data import.
-- Write SQL queries to solve the business problems once the data is loaded.

-- End of Schema and Comments.
