-- 1. Top Revenue Categories
SELECT 
    p.product_category_name,
    ROUND(SUM(oi.price), 2) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY p.product_category_name
ORDER BY total_revenue DESC
LIMIT 5;

-- 2. Delivery Bottlenecks by State
SELECT 
    c.customer_state,
    COUNT(o.order_id) AS total_orders,
    ROUND(AVG(JULIANDAY(o.order_delivered_customer_date) - JULIANDAY(o.order_purchase_timestamp)), 2) AS avg_delivery_days
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY avg_delivery_days DESC
LIMIT 5;

-- 3. Monthly Order Volume Trends
SELECT 
    STRFTIME('%Y-%m', order_purchase_timestamp) AS year_month,
    COUNT(order_id) AS total_orders
FROM orders
WHERE order_status = 'delivered'
GROUP BY year_month
ORDER BY year_month ASC;

-- 4. High-Value VIP Customers
SELECT 
    c.customer_unique_id,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(oi.price + oi.freight_value), 2) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY c.customer_unique_id
HAVING total_spent > 1000
ORDER BY total_spent DESC
LIMIT 5;