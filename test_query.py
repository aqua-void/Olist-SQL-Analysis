import sqlite3
import pandas as pd

conn = sqlite3.connect("olist.db")

query = """
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
"""

df = pd.read_sql_query(query, conn)
print(df)

conn.close()