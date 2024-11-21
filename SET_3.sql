-- Problem 1: Top Customers by State
-- Identify the top customer in each state based on the total number of orders placed.
-- Include the customer's name, state, and the total number of orders.

SELECT 
    C.state,
    CONCAT(C.first_name, ' ', C.last_name) AS customer_name,
    COUNT(O.order_id) AS total_orders
FROM 
    Customers C
LEFT JOIN 
    Orders O ON C.customer_id = O.customer_id
GROUP BY 
    C.state, C.customer_id
ORDER BY 
    C.state, total_orders DESC;

-- ------------------------------------------------------

-- Problem 2: Low Performing Products
-- Identify products with less than 50 units sold in total.
-- Include product name, total units sold, and product category.

SELECT 
    P.product_name,
    SUM(OI.quantity) AS total_units_sold,
    C.category_name
FROM 
    Products P
LEFT JOIN 
    Order_items OI ON P.product_id = OI.product_id
LEFT JOIN 
    Category C ON P.category_id = C.category_id
GROUP BY 
    P.product_id, P.product_name, C.category_name
HAVING 
    SUM(OI.quantity) < 50
ORDER BY 
    total_units_sold ASC;

-- ------------------------------------------------------

-- Problem 3: Orders by Quarter
-- Calculate the total number of orders placed in each quarter of the last year.
-- Include the quarter (Q1, Q2, etc.) and the total number of orders.

SELECT 
    CASE 
        WHEN MONTH(order_date) BETWEEN 1 AND 3 THEN 'Q1'
        WHEN MONTH(order_date) BETWEEN 4 AND 6 THEN 'Q2'
        WHEN MONTH(order_date) BETWEEN 7 AND 9 THEN 'Q3'
        WHEN MONTH(order_date) BETWEEN 10 AND 12 THEN 'Q4'
    END AS quarter,
    COUNT(order_id) AS total_orders
FROM 
    Orders
WHERE 
    YEAR(order_date) = YEAR(CURDATE()) - 1
GROUP BY 
    quarter
ORDER BY 
    quarter;

-- ------------------------------------------------------

-- Problem 4: Sellers Without Sales
-- Identify sellers who have not made any sales in the current year.
-- Include seller name, origin, and the last sale date.

SELECT 
    S.seller_name,
    S.origin,
    MAX(O.order_date) AS last_sale_date
FROM 
    Sellers S
LEFT JOIN 
    Orders O ON S.seller_id = O.seller_id
WHERE 
    (O.order_date IS NULL OR YEAR(O.order_date) != YEAR(CURDATE()))
GROUP BY 
    S.seller_id, S.seller_name, S.origin
ORDER BY 
    last_sale_date DESC;

-- ------------------------------------------------------

-- Problem 5: Top Products by Profit
-- Find the top 5 products with the highest profit.
-- Include product name, total profit, and category.

SELECT 
    P.product_name,
    (SUM(OI.quantity * (P.price - P.cogs))) AS total_profit,
    C.category_name
FROM 
    Products P
LEFT JOIN 
    Order_items OI ON P.product_id = OI.product_id
LEFT JOIN 
    Category C ON P.category_id = C.category_id
GROUP BY 
    P.product_id, P.product_name, C.category_name
ORDER BY 
    total_profit DESC
LIMIT 5;
