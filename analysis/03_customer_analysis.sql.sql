--Top 10 klientów wg przychodu

SELECT
	c.customer_id
	, ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id
ORDER BY revenue DESC
LIMIT 10;


--Top 10 klientów wg ilości zamówień

SELECT
	c.customer_id
	, COUNT(o.order_id) AS order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY order_count DESC
LIMIT 10;


--Średnia liczba zamówień na klienta

WITH customer_orders AS
	(
	SELECT
		c.customer_id
		, COUNT(o.order_id) AS order_count
	FROM customers c
	JOIN orders o ON c.customer_id = o.customer_id
	GROUP BY c.customer_id
	)
SELECT
	ROUND(AVG(order_count), 2) AS avg_orders_per_customer
	FROM customer_orders;


--Klienci bez zamówień

SELECT
		c.customer_id
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE order_id IS NULL;


--Przychód wg kraju klienta

SELECT
	c.country
	, ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.country
ORDER BY revenue DESC;


--Rozkład klientów wg liczby zamówień

SELECT
    	order_count,
    	COUNT(*) AS customers
FROM 
	(
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS order_count
    FROM customers c
    LEFT JOIN orders o ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
	) 
GROUP BY order_count
ORDER BY order_count;
