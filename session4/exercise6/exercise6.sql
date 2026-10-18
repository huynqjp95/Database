CREATE TABLE products(
    product_id VARCHAR(20) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    quantity INT NOT NULL
);

-- insert into
INSERT INTO products(product_id, product_name, category, price, quantity) VALUES
('SP001', 'Dell Inspiron 15',     'Laptop', 15000000, 10),
('SP002', 'Asus Vivobook 14',     'Laptop', 12000000,  8),
('SP003', 'MacBook Air M1',       'Laptop', 22000000,  5),
('SP004', 'Samsung Galaxy S23',   'Phone',  18000000, 20),
('SP005', 'iPhone 13',            'Phone',  16000000, 15),
('SP006', 'Xiaomi Redmi Note 12', 'Phone',   5500000, 30),
('SP007', 'iPad Gen 9',           'Tablet',  9000000,  0),
('SP008', 'Samsung Galaxy Tab A8','Tablet',  6500000, 12),
('SP009', 'Logitech Mouse M331',  'Accessory', 350000, 50),
('SP010', 'Sony Headphone WH-CH520','Accessory',1200000, 0);

-- select all
SELECT * From products;

-- display products whose price between 5tr and 15tr
SELECT * FROM products
WHERE price BETWEEN 5000000 AND 15000000;

-- display products whose category is Laptop or Tablet
SELECT * FROM products
WHERE category IN ('Laptop','Tablet');

-- display products whose name begin with 'Sam'
SELECT * FROM products
WHERE product_name LIKE 'Sam%';

-- display products whose category is not phone
SELECT * FROM products
WHERE category != 'Phone';

-- decrease prices of products in the Laptop category by 5%
UPDATE products
SET price = price * 0.95
WHERE category = 'Laptop';

-- delete products whose quantity is 0 
DELETE FROM products 
WHERE quantity = 0;



