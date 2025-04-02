/*
CREATE TABLE customers(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders(
  order_id INTEGER PRIMARY KEY AUTOINCREMENT,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE products(
  product_id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) CHECK (price>0),
  stock INT DEFAULT 10
  );

INSERT INTO customers(name , email)
VALUES
('Ali', 'ali@example.com'),
('Ayşe', 'ayse@example.com'),
('Mehmet', 'mehmet@example.com');

SELECT * FROM customers;

INSERT INTO orders(customer_id,order_date)
VALUES
(1, '2024-03-28'),
(2, '2024-03-29'),
(3, '2024-03-30');


SELECT * FROM orders;


SELECT customers.name , orders.order_date
FROM customers
JOIN orders ON customers.id = orders.customer_id;

INSERT INTO products (name, price, stock) 
VALUES 
('Laptop', 1500, 5),
('Mouse', 30, 20),
('Klavye', 75, 15),
('Monitor', 200, 10);


SELECT * FROM products WHERE price > 50;



UPDATE products 
SET stock = stock + 10
WHERE stock < 5 ;



SELECT * FROM products;



DELETE FROM products WHERE price < 20 ;



SELECT * FROM products;



SELECT * FROM products
WHERE price = (SELECT MAX(price) FROM products);



SELECT * FROM products 
WHERE price > (SELECT AVG(price) FROM products);



SELECT * FROM products 
WHERE stock = (SELECT MIN(stock) FROM products);




SELECT SUM(stock) AS total_stock FROM products;



SELECT stock,COUNT(*) AS product_count
FROM products
GROUP BY stock;


SELECT stock,COUNT(*) AS product_count
FROM products
GROUP BY stock
HAVING stock > 5;



SELECT name , price,
	CASE
    	WHEN price < 50 THEN 'Ucuz'
		WHEN price BETWEEN 50 AND 200 THEN 'Orta'
        ELSE 'Pahalı'
    END AS price_category
FROM products;



SELECT * FROM products WHERE price > 100
UNION
SELECT * FROM products WHERE stock < 10 ;



SELECT * FROM customers
WHERE EXISTS (SELECT 1 FROM orders WHERE orders.customer_id = customers.id);



SELECT * FROM products
ORDER BY price DESC
LIMIT 3;
*/
