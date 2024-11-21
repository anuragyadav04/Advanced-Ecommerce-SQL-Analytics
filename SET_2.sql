-- 1. List All Products With No Sales
-- Problem: Identify products that have not been sold at all.
-- Challenge: Include product name and category details.

SELECT 
    P.product_name,
    C.category_name
FROM 
    Products P
LEFT JOIN 
    Order_items OI ON P.product_id = OI.product_id
LEFT JOIN 
    Category C ON P.category_id = C.category_id
WHERE 
    OI.order_id IS NULL;

-- 2. Customers with the Highest Spending
-- Problem: Find the top 5 customers with the highest total spending.
-- Challenge: Include customer name and total spending amount.

SELECT 
    CONCAT(C.first_name, ' ', C.last_name) AS customer_name,
    SUM(OI.quantity * OI.price_per_unit) AS total_spent
FROM 
    Customers C
JOIN 
    Orders O ON C.customer_id = O.customer_id
JOIN 
    Order_items OI ON O.order_id = OI.order_id
GROUP BY 
    C.customer_id, C.first_name, C.last_name
ORDER BY 
    total_spent DESC
LIMIT 5;

-- 3. Most Frequently Purchased Product
-- Problem: Find the product that has been purchased the most times.
-- Challenge: Include product name and total quantity purchased.

SELECT 
    P.product_name,
    SUM(OI.quantity) AS total_quantity_purchased
FROM 
    Products P
JOIN 
    Order_items OI ON P.product_id = OI.product_id
GROUP BY 
    P.product_name
ORDER BY 
    total_quantity_purchased DESC
LIMIT 1;

-- 4. Orders Without Payments
-- Problem: Find orders that have not yet received any payment.
-- Challenge: Include order ID, customer name, and order date.

SELECT 
    O.order_id,
    CONCAT(C.first_name, ' ', C.last_name) AS customer_name,
    O.order_date
FROM 
    Orders O
LEFT JOIN 
    Payments P ON O.order_id = P.order_id
JOIN 
    Customers C ON O.customer_id = C.customer_id
WHERE 
    P.payment_id IS NULL;

-- 5. Products with the Highest Stock
-- Problem: Find the top 5 products with the highest remaining stock.
-- Challenge: Include product name, stock remaining, and last restock date.

SELECT 
    P.product_name,
    I.stock_remaining,
    I.last_stock_date
FROM 
    Inventory I
JOIN 
    Products P ON I.product_id = P.product_id
ORDER BY 
    I.stock_remaining DESC
LIMIT 5;

