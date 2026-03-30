--Całkowity przychód (z rabatami)

SELECT 
	ROUND(SUM(oi.unit_price * oi.quantity * (1- oi.discount)), 2) AS total_revenue 
FROM order_items oi;


--Przychód miesięczny

SELECT 
	DATE_PART('month', o.order_date) AS month
	, ROUND(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;


--TOP 5 miesięcy wg przychodu

SELECT 
	DATE_PART('month', o.order_date) AS month
	, ROUND(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY month
ORDER BY revenue desc
LIMIT 5;


--Przychód wg kraju wysyłki

SELECT
	o.ship_country
	, ROUND(SUM(oi.unit_price * oi.quantity * (1 - oi.discount))) AS revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY o.ship_country
ORDER BY revenue DESC;


--Średnia wartość zamówienia

WITH order_values AS 
	(
    SELECT o.order_id, SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS order_value
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY o.order_id
	)
SELECT ROUND(AVG(order_value)) AS avg_order_value
FROM order_values;


--Liczba zamówień miesięcznie

SELECT
	COUNT(o.order_id) AS order_count
	, DATE_PART('month', o.order_date) AS month
FROM orders o
GROUP BY month
ORDER BY month;


--Przychód: zamówienia z rabatem vs bez rabatu

SELECT
	CASE
        	WHEN oi.discount > 0 THEN 'With discount'
        	ELSE 'No discount'
    	END AS discount_type
    	, ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS revenue
FROM order_items oi
GROUP BY discount_type;

