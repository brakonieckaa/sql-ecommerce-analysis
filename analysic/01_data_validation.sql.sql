--Sprawdzenie ilości pozycji w każdej tabeli

SELECT COUNT(*) FROM customers;

SELECT COUNT (*) FROM categories;

SELECT COUNT (*) FROM order_items;

SELECT COUNT (*) FROM products;

SELECT COUNT (*) FROM orders;

SELECT COUNT (*) FROM suppliers;


--Klienci bez zamówień

SELECT 
	c.customer_id
	, c.country
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


--Produkty bez sprzedaży

SELECT 
	p.product_id
	, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


--Max, min i średnia wartość zamówienia

SELECT 
	ROUND(AVG(sum), 2) AS avg_order_value
	, ROUND(MIN(sum), 2) AS min_order_value
	, ROUND(MAX(sum), 2) AS max_order_value
FROM
	(
	SELECT SUM(oi.unit_price * oi.quantity * (1 - oi.discount)) AS sum FROM order_items oi
	GROUP BY oi.order_id
	);


--Ilość pozycji na koszyk

SELECT
	MIN(item_count) AS min_items
  	, MAX(item_count) AS max_items
	, ROUND(AVG(item_count), 2) AS avg_items
FROM 
	(
    	SELECT order_id, COUNT(*) AS item_count
    	FROM order_items
    	GROUP BY order_id
	);