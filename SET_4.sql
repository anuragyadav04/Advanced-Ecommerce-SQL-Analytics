-- 1. Inventory Stock Alerts
-- Query products with stock levels below a certain threshold (e.g., less than 10 units), including last restock date and warehouse information
SELECT 
    i.inventory_id,                        -- Unique ID for the inventory record
    p.product_name,                        -- Name of the product
    i.stock_remaining AS current_stock_left, -- Current remaining stock level
    i.last_stock_date,                     -- Date of the last restock
    i.warehouse_id                         -- Warehouse ID where the product is stored
FROM 
    inventory AS i
JOIN 
    products AS p
    ON p.product_id = i.product_id         -- Join inventory with products to get product details
WHERE 
    i.stock_remaining < 10;                -- Threshold for stock alert

-- 2. Shipping Delays
-- Identify orders with shipping delays exceeding 7 days, including customer and order details as well as the delivery provider
SELECT 
    c.*,                                    -- All customer details
    o.*,                                    -- All order details
    s.shipping_provider,                    -- Name of the shipping provider
    s.shipping_date - o.order_date AS days_took_to_ship -- Number of days taken to ship
FROM 
    orders AS o
JOIN 
    customers AS c
    ON c.customer_id = o.customer_id        -- Join orders with customers to get customer details
JOIN 
    shippings AS s
    ON o.order_id = s.order_id              -- Join orders with shipping to get shipping details
WHERE 
    s.shipping_date - o.order_date > 7;     -- Shipping delay exceeding 7 days

-- 3. Payment Success Rate
-- Calculate the percentage of successful payments across all orders, with breakdowns by payment status
SELECT 
    p.payment_status,                         -- Payment status (e.g., successful, failed, pending)
    COUNT(*) AS total_count,                  -- Total count of payments for each status
    COUNT(*)::NUMERIC / 
    (SELECT COUNT(*) FROM payments)::NUMERIC * 100 AS success_rate -- Success rate as a percentage
FROM 
    orders AS o
JOIN 
    payments AS p
    ON o.order_id = p.order_id                -- Join orders with payments to get payment details
GROUP BY 
    p.payment_status;                         -- Group by payment status

-- 4. Stored Procedure for Inventory Management
-- Create a stored procedure to reduce stock in the inventory table when a product is sold
CREATE OR REPLACE FUNCTION update_inventory(
    p_product_id INT,         -- Product ID for which stock is to be updated
    p_quantity_sold INT       -- Quantity of the product sold
)
RETURNS VOID AS $$
BEGIN
    -- Check if the product exists in the inventory table
    IF EXISTS (SELECT 1 FROM Inventory WHERE product_id = p_product_id) THEN
        -- Update the stock_remaining by reducing the sold quantity
        UPDATE Inventory
        SET stock_remaining = stock_remaining - p_quantity_sold
        WHERE product_id = p_product_id;

        -- Optional: Check if the stock_remaining goes negative
        IF (SELECT stock_remaining FROM Inventory WHERE product_id = p_product_id) < 0 THEN
            RAISE EXCEPTION 'Insufficient stock for product ID %', p_product_id;
        END IF;
    ELSE
        -- Raise an error if the product does not exist in the inventory
        RAISE EXCEPTION 'Product ID % not found in inventory', p_product_id;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Example usage of the function to update stock for a product
SELECT update_inventory(101, 5); -- Reduces stock for product_id 101 by 5 units
