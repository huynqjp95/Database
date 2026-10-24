create table products (
    product_id int AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price INT NOT NULL
);
INSERT INTO products (product_name, category, price) VALUES
('Dell Inspiron 15',      'Laptop',    15000000),
('Asus Vivobook 14',      'Laptop',    12000000),
('MacBook Air M1',        'Laptop',    22000000),
('Samsung Galaxy S23',    'Phone',     18000000),
('iPhone 13',             'Phone',     16000000),
('Xiaomi Redmi Note 12',  'Phone',      5500000),
('iPad Gen 9',            'Tablet',     9000000),
('Samsung Galaxy Tab A8', 'Tablet',     6500000),
('Logitech Mouse M331',   'Accessory',   350000),
('Sony WH-CH520',         'Accessory',  1200000);

-- display products whose price is greater than average price of all products
SELECT * FROM products 
WHERE price > (select AVG(price) FROM products);

-- display products whose price is the highest in each category
SELECT * FROM products p
WHERE p.price = ( SELECT MAX(price) FROM products
                    GROUP BY category
                    HAVING p.category = category
                );

-- display products in categories that have at least one product priced above 20 million
SELECT * FROM products 
WHERE category IN ( SELECT category FROM products
                    WHERE price > 20000000
                    GROUP BY category);
 


