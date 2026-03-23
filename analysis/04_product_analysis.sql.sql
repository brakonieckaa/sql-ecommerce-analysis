--Top 10 produktów wg przychodu

SELECT
	p.product_id
	, p.product_name
	, ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY revenue DESC
LIMIT 10;


--Top 10 produktów wg sprzedanej ilości

SELECT
	p.product_id
	, p.product_name
	, SUM(oi.quantity) AS total_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_quantity DESC
LIMIT 10;


--Produkty, które nigdy się nie sprzedały

SELECT
	p.product_id
	, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;


--Średnia cena sprzedaży produktu

SELECT
	p.product_id
	, p.product_name
	, ROUND(AVG(oi.unit_price * (1 - oi.discount)), 2) AS avg_selling_price
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY avg_selling_price DESC;


--Przychód wg kategorii produktu

SELECT
	p.category_id
	, c.category_name
	, ROUND(SUM(oi.unit_price * oi.quantity * (1 - oi.discount)), 2) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY p.category_id, c.category_name
ORDER BY revenue DESC;


--Wpływ rabatów na sprzedaż produktów

SELECT
	CASE
		WHEN oi.discount > 0 THEN 'Discounted'
        ELSE 'No discount'
	END AS discount_type
	, COUNT(*) AS order_items_count
	, ROUND(SUM(oi.quantity * oi.unit_price * (1 - oi.discount)), 2) AS revenue
FROM order_items oi
GROUP BY discount_type;