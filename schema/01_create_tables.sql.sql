CREATE TABLE customers
	(
	customer_id SERIAL NOT NULL PRIMARY KEY
	, first_name VARCHAR(50) NOT NULL
	, last_name VARCHAR(50) NOT NULL
	, email VARCHAR(100) UNIQUE
	, country VARCHAR(50) NOT NULL DEFAULT 'Unknown'
	, signup_date DATE NOT NULL DEFAULT CURRENT_DATE
	);

CREATE TABLE categories
	(
	category_id SERIAL NOT NULL PRIMARY KEY
	, category_name VARCHAR(100) NOT NULL UNIQUE
	);

CREATE TABLE suppliers
	(
	supplier_id SERIAL NOT NULL PRIMARY KEY
	, company_name VARCHAR(100) NOT NULL UNIQUE
	, country VARCHAR(50) NOT NULL
	);

CREATE TABLE products
	(
	product_id SERIAL NOT NULL PRIMARY KEY
	, product_name VARCHAR(150) NOT NULL 
	, category_id INT NOT NULL REFERENCES categories(category_id)
	, supplier_id INT NOT NULL REFERENCES suppliers(supplier_id)
	, unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price>=0)
	, units_in_stock INT NOT NULL DEFAULT 0 CHECK (units_in_stock>=0)
	, discontinued BOOL NOT NULL DEFAULT FALSE
	);

CREATE TABLE orders 
	(
	order_id SERIAL NOT NULL PRIMARY KEY
	, customer_id INT NOT NULL REFERENCES customers(customer_id)
	, order_date DATE NOT NULL DEFAULT CURRENT_DATE
	, ship_country VARCHAR(50) NOT NULL
	);

CREATE TABLE order_items
	(
	order_item_id SERIAL NOT NULL PRIMARY KEY
	, order_id INT NOT NULL REFERENCES orders(order_id)
	, product_id INT NOT NULL REFERENCES products(product_id)
	, quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0)
	, unit_price NUMERIC(10,2) NOT NULL CHECK (unit_price >= 0)
	, discount NUMERIC(3,2) NOT NULL DEFAULT 0 CHECK (discount >= 0 AND discount <= 1)
	);