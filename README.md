\# E-Commerce Sales \& Customer Analytics



\## Project Overview



This project analyzes e-commerce sales and customer purchasing behavior using MySQL.



The objective is to identify sales trends, customer behavior, top-performing products, revenue contribution, profitability, and important business KPIs using SQL.
-- ============================================================
-- 1. TABLE CREATION
-- ============================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10,2),
    cost_price DECIMAL(10,2),
    stock_quantity INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(20),
    shipping_city VARCHAR(50),
    shipping_state VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ============================================================
-- 2. INSERT SAMPLE DATA
-- ============================================================

INSERT INTO customers
(customer_id, first_name, last_name, gender, age, city, state, signup_date)
VALUES
(1, 'Rahul', 'Sharma', 'Male', 28, 'Delhi', 'Delhi', '2024-01-15'),
(2, 'Priya', 'Verma', 'Female', 25, 'Mumbai', 'Maharashtra', '2024-02-10'),
(3, 'Amit', 'Kumar', 'Male', 32, 'Patna', 'Bihar', '2024-02-18'),
(4, 'Sneha', 'Singh', 'Female', 29, 'Lucknow', 'Uttar Pradesh', '2024-03-05'),
(5, 'Arjun', 'Mehta', 'Male', 35, 'Bangalore', 'Karnataka', '2024-03-20'),
(6, 'Neha', 'Gupta', 'Female', 27, 'Jaipur', 'Rajasthan', '2024-04-11'),
(7, 'Rohit', 'Yadav', 'Male', 31, 'Noida', 'Uttar Pradesh', '2024-04-25'),
(8, 'Anjali', 'Patel', 'Female', 24, 'Ahmedabad', 'Gujarat', '2024-05-08'),
(9, 'Vikas', 'Mishra', 'Male', 38, 'Kolkata', 'West Bengal', '2024-05-19'),
(10, 'Pooja', 'Das', 'Female', 30, 'Chennai', 'Tamil Nadu', '2024-06-02');

INSERT INTO categories (category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Sports'),
(6, 'Beauty');

INSERT INTO products
(product_id, product_name, category_id, price, cost_price, stock_quantity)
VALUES
(101, 'Wireless Headphones', 1, 2499.00, 1600.00, 50),
(102, 'Bluetooth Speaker', 1, 1799.00, 1100.00, 40),
(103, 'Smart Watch', 1, 3999.00, 2600.00, 30),
(104, 'USB-C Charger', 1, 999.00, 550.00, 80),
(105, 'Power Bank', 1, 1499.00, 900.00, 60),
(106, 'Men T-Shirt', 2, 799.00, 400.00, 100),
(107, 'Women T-Shirt', 2, 849.00, 450.00, 90),
(108, 'Denim Jeans', 2, 1799.00, 1000.00, 70),
(109, 'Running Shoes', 2, 2499.00, 1500.00, 45),
(110, 'Non-Stick Pan', 3, 1299.00, 750.00, 55),
(111, 'Electric Kettle', 3, 1899.00, 1200.00, 35),
(112, 'Coffee Maker', 3, 3499.00, 2200.00, 25),
(113, 'Data Analytics Book', 4, 699.00, 350.00, 80),
(114, 'Python Programming Book', 4, 799.00, 400.00, 65),
(115, 'SQL Complete Guide', 4, 899.00, 450.00, 75),
(116, 'Football', 5, 999.00, 550.00, 50),
(117, 'Cricket Bat', 5, 2499.00, 1500.00, 30),
(118, 'Yoga Mat', 5, 799.00, 400.00, 60),
(119, 'Face Wash', 6, 499.00, 250.00, 100),
(120, 'Moisturizer', 6, 699.00, 350.00, 85);

INSERT INTO orders
(order_id, customer_id, order_date, order_status, shipping_city, shipping_state)
VALUES
(1001, 1, '2024-06-10', 'Delivered', 'Delhi', 'Delhi'),
(1002, 2, '2024-06-12', 'Delivered', 'Mumbai', 'Maharashtra'),
(1003, 3, '2024-06-15', 'Delivered', 'Patna', 'Bihar'),
(1004, 4, '2024-06-18', 'Delivered', 'Lucknow', 'Uttar Pradesh'),
(1005, 5, '2024-06-20', 'Shipped', 'Bangalore', 'Karnataka'),
(1006, 1, '2024-06-25', 'Delivered', 'Delhi', 'Delhi'),
(1007, 6, '2024-06-28', 'Delivered', 'Jaipur', 'Rajasthan'),
(1008, 7, '2024-07-02', 'Delivered', 'Noida', 'Uttar Pradesh'),
(1009, 8, '2024-07-05', 'Cancelled', 'Ahmedabad', 'Gujarat'),
(1010, 9, '2024-07-08', 'Delivered', 'Kolkata', 'West Bengal'),
(1011, 10, '2024-07-10', 'Delivered', 'Chennai', 'Tamil Nadu'),
(1012, 2, '2024-07-15', 'Delivered', 'Mumbai', 'Maharashtra'),
(1013, 3, '2024-07-18', 'Shipped', 'Patna', 'Bihar'),
(1014, 5, '2024-07-20', 'Delivered', 'Bangalore', 'Karnataka'),
(1015, 1, '2024-07-25', 'Delivered', 'Delhi', 'Delhi');

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 2499.00),
(2, 1001, 104, 2, 999.00),
(3, 1002, 103, 1, 3999.00),
(4, 1002, 119, 2, 499.00),
(5, 1003, 115, 1, 899.00),
(6, 1003, 114, 1, 799.00),
(7, 1004, 106, 2, 799.00),
(8, 1004, 108, 1, 1799.00),
(9, 1005, 102, 1, 1799.00),
(10, 1005, 111, 1, 1899.00),
(11, 1006, 101, 2, 2499.00),
(12, 1006, 105, 1, 1499.00),
(13, 1007, 109, 1, 2499.00),
(14, 1007, 118, 2, 799.00),
(15, 1008, 117, 1, 2499.00),
(16, 1008, 116, 1, 999.00),
(17, 1009, 103, 1, 3999.00),
(18, 1010, 112, 1, 3499.00),
(19, 1010, 110, 2, 1299.00),
(20, 1011, 120, 2, 699.00),
(21, 1011, 119, 1, 499.00),
(22, 1012, 101, 1, 2499.00),
(23, 1012, 107, 1, 849.00),
(24, 1013, 113, 2, 699.00),
(25, 1013, 115, 1, 899.00),
(26, 1014, 103, 1, 3999.00),
(27, 1014, 104, 1, 999.00),
(28, 1015, 108, 2, 1799.00),
(29, 1015, 106, 1, 799.00);

-- ============================================================
-- 3. BASIC DATA EXPLORATION
-- ============================================================

-- 3.1 View all customers
SELECT * FROM customers;

-- 3.2 View all categories
SELECT * FROM categories;

-- 3.3 View all products
SELECT * FROM products;

-- 3.4 View all orders
SELECT * FROM orders;

-- 3.5 View all order items
SELECT * FROM order_items;

-- 3.6 Product and category details
SELECT p.product_id, p.product_name, c.category_name, p.price
FROM products p
JOIN categories c ON p.category_id = c.category_id;

-- 3.7 Detailed order-item revenue
SELECT
    o.order_id,
    o.order_date,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    oi.quantity * oi.unit_price AS revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- ============================================================
-- 4. SALES KPIs
-- ============================================================

-- 4.1 Total delivered revenue
SELECT SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- 4.2 Count of delivered orders
SELECT COUNT(*) AS total_delivered_orders
FROM orders
WHERE order_status = 'Delivered';

-- 4.3 Average order value (AOV)
SELECT ROUND(
    SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id), 2
) AS average_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered';

-- 4.4 Monthly delivered revenue
SELECT
    YEAR(o.order_date) AS year,
    MONTH(o.order_date) AS month,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY YEAR(o.order_date), MONTH(o.order_date)
ORDER BY year, month;

-- 4.5 Month-over-month revenue change using LAG()
WITH monthly_sales AS (
    SELECT
        YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
        SUM(oi.quantity * oi.unit_price) AS revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY YEAR(o.order_date), MONTH(o.order_date)
)
SELECT
    year,
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS previous_month_revenue,
    revenue - LAG(revenue) OVER (ORDER BY year, month) AS revenue_change,
    ROUND(
        (revenue - LAG(revenue) OVER (ORDER BY year, month))
        / NULLIF(LAG(revenue) OVER (ORDER BY year, month), 0) * 100,
        2
    ) AS growth_percentage
FROM monthly_sales
ORDER BY year, month;

-- 4.6 Cumulative revenue by month
WITH monthly_sales AS (
    SELECT
        YEAR(o.order_date) AS year,
        MONTH(o.order_date) AS month,
        SUM(oi.quantity * oi.unit_price) AS monthly_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY YEAR(o.order_date), MONTH(o.order_date)
)
SELECT
    year,
    month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY year, month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM monthly_sales
ORDER BY year, month;

-- ============================================================
-- 5. PRODUCT ANALYSIS
-- ============================================================

-- 5.1 Revenue by product
SELECT
    p.product_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- 5.2 Best-selling products by quantity
SELECT
    p.product_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY units_sold DESC, total_revenue DESC;

-- 5.3 Top 5 products by revenue using a CTE
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT product_name, total_revenue
FROM product_sales
ORDER BY total_revenue DESC
LIMIT 5;

-- 5.4 Rank products by revenue using RANK()
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM product_sales
ORDER BY revenue_rank;

-- 5.5 Number products by revenue using ROW_NUMBER()
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    total_revenue,
    ROW_NUMBER() OVER (ORDER BY total_revenue DESC) AS row_num
FROM product_sales
ORDER BY row_num;

-- 5.6 Top 3 products in each category
WITH product_sales AS (
    SELECT
        c.category_name,
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    JOIN categories c ON p.category_id = c.category_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.category_id, c.category_name, p.product_id, p.product_name
),
ranked_products AS (
    SELECT
        category_name,
        product_name,
        total_revenue,
        ROW_NUMBER() OVER (
            PARTITION BY category_name
            ORDER BY total_revenue DESC
        ) AS product_rank
    FROM product_sales
)
SELECT category_name, product_name, total_revenue, product_rank
FROM ranked_products
WHERE product_rank <= 3
ORDER BY category_name, product_rank;

-- 5.7 Product percentage contribution to delivered revenue
WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        SUM(oi.quantity * oi.unit_price) AS product_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY p.product_id, p.product_name
)
SELECT
    product_name,
    product_revenue,
    ROUND(
        product_revenue * 100.0 / SUM(product_revenue) OVER (),
        2
    ) AS revenue_contribution_percentage
FROM product_sales
ORDER BY product_revenue DESC;

-- 5.8 Profit by product
SELECT
    p.product_name,
    SUM((oi.unit_price - p.cost_price) * oi.quantity) AS total_profit
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_profit DESC;

-- ============================================================
-- 6. CATEGORY ANALYSIS
-- ============================================================

-- 6.1 Revenue by category
SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

-- 6.2 Revenue, profit, and profit margin by category
SELECT
    c.category_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    SUM((oi.unit_price - p.cost_price) * oi.quantity) AS total_profit,
    ROUND(
        SUM((oi.unit_price - p.cost_price) * oi.quantity)
        / NULLIF(SUM(oi.quantity * oi.unit_price), 0) * 100,
        2
    ) AS profit_margin_percentage
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
WHERE o.order_status = 'Delivered'
GROUP BY c.category_id, c.category_name
ORDER BY profit_margin_percentage DESC;

-- ============================================================
-- 7. CUSTOMER ANALYSIS
-- ============================================================

-- 7.1 Revenue by customer
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_revenue DESC;

-- 7.2 Customers with more than one delivered order
SELECT
    customer_id,
    COUNT(*) AS total_orders
FROM orders
WHERE order_status = 'Delivered'
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 7.3 Repeat customer rate
SELECT
    ROUND(
        COUNT(*) * 100.0 /
        (
            SELECT COUNT(DISTINCT customer_id)
            FROM orders
            WHERE order_status = 'Delivered'
        ),
        2
    ) AS repeat_customer_rate
FROM (
    SELECT customer_id
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS repeat_customers;

-- 7.4 Top 5 customers by revenue
SELECT
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 7.5 Customer segmentation by delivered revenue
WITH customer_sales AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_name,
    total_revenue,
    CASE
        WHEN total_revenue >= 10000 THEN 'High Value'
        WHEN total_revenue >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customer_sales
ORDER BY total_revenue DESC;

-- 7.6 Customer lifetime value and customer AOV
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS lifetime_value,
    ROUND(
        SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id),
        2
    ) AS customer_aov
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY lifetime_value DESC;

-- 7.7 Customer purchase frequency
SELECT
    total_orders,
    COUNT(*) AS number_of_customers
FROM (
    SELECT customer_id, COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
) AS customer_orders
GROUP BY total_orders
ORDER BY total_orders;

-- 7.8 Rank customers by revenue
WITH customer_sales AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT
    customer_name,
    total_revenue,
    RANK() OVER (ORDER BY total_revenue DESC) AS customer_rank
FROM customer_sales
ORDER BY customer_rank;

-- 7.9 Overall KPI summary
WITH customer_order_counts AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders
    FROM orders
    WHERE order_status = 'Delivered'
    GROUP BY customer_id
),
sales_kpis AS (
    SELECT
        SUM(oi.quantity * oi.unit_price) AS total_revenue,
        COUNT(DISTINCT o.order_id) AS total_delivered_orders
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE o.order_status = 'Delivered'
)
SELECT
    sk.total_revenue,
    sk.total_delivered_orders,
    (SELECT COUNT(DISTINCT customer_id)
     FROM orders WHERE order_status = 'Delivered') AS customers_with_delivered_orders,
    ROUND(sk.total_revenue / NULLIF(sk.total_delivered_orders, 0), 2) AS average_order_value,
    (SELECT COUNT(*)
     FROM customer_order_counts WHERE total_orders > 1) AS repeat_customers,
    ROUND(
        (SELECT COUNT(*) FROM customer_order_counts WHERE total_orders > 1) * 100.0
        / NULLIF((SELECT COUNT(*) FROM customer_order_counts), 0),
        2
    ) AS repeat_customer_rate
FROM sales_kpis sk;

-- ============================================================
-- 8. DATA QUALITY CHECKS
-- ============================================================

-- 8.1 Duplicate customer IDs (should return no rows because customer_id is a PK)
SELECT customer_id, COUNT(*) AS id_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- 8.2 Products with invalid/nonpositive prices
SELECT *
FROM products
WHERE price IS NULL OR price <= 0 OR cost_price IS NULL OR cost_price < 0;

-- 8.3 Order items with nonpositive quantities
SELECT *
FROM order_items
WHERE quantity IS NULL OR quantity <= 0;

-- 8.4 Orders with missing/invalid customers
SELECT o.*
FROM orders o
LEFT JOIN customers c ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- 8.5 Cancelled orders that have order items
SELECT DISTINCT o.order_id, o.order_status
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Cancelled';

-- 8.6 NULL checks for customers
SELECT *
FROM customers
WHERE customer_id IS NULL
   OR first_name IS NULL
   OR last_name IS NULL
   OR signup_date IS NULL;

-- 8.7 NULL checks for products
SELECT *
FROM products
WHERE product_id IS NULL
   OR product_name IS NULL
   OR category_id IS NULL
   OR price IS NULL
   OR cost_price IS NULL;

-- 8.8 NULL checks for orders
SELECT *
FROM orders
WHERE order_id IS NULL
   OR customer_id IS NULL
   OR order_date IS NULL
   OR order_status IS NULL;

-- 8.9 NULL checks for order items
SELECT *
FROM order_items
WHERE order_item_id IS NULL
   OR order_id IS NULL
   OR product_id IS NULL
   OR quantity IS NULL
   OR unit_price IS NULL;

-- ============================================================
-- END OF PROJECT SCRIPT
-- ============================================================

## Author
Ayush Raj
B.Tech - Electronics \& Communication Engineering


