-- Section1
    SELECT orders.id AS order_id FROM orders
    WHERE orders.status = 'warehouse'
    ORDER BY orders.id DESC;
-- Section2
    SELECT customers.id AS customer_id, customers.name AS customer_name FROM customers
    LEFT JOIN orders ON customers.id = orders.customer_id
    WHERE orders.customer_id IS NULL
    ORDER BY customers.name ASC;
-- Section3 
    SELECT orders.created_at AS 'date',
    FORMAT(COUNT(CASE status WHEN 'canceled' THEN 1 ELSE NULL END) / COUNT(*) * 100, 2) AS cancellation_rate
    FROM orders
    LEFT JOIN customers
    ON orders.customer_id = customers.id
    WHERE customers.is_blocked = 0 OR customers.is_blocked IS NULL
    GROUP BY orders.created_at;
