create table customers (
	customer_id int auto_increment primary key,
    customer_name varchar(50) not null
);

create table orders (
	order_id int auto_increment primary key,
    order_date date not null,
    customer_id int not null,
    foreign key (customer_id) references customers(customer_id)
);

create table order_items (
	order_id int,
    customer_id int,
    product_name varchar(100),
    quantity int check(quantity>=0),
    price int check(price > 0),
    primary key (order_id, customer_id, product_name),
    foreign key (order_id) references orders(order_id),
    foreign key (customer_id) references customers(customer_id)
);

-- insert data example
insert into customers (customer_name) values
('Nguyen Van A'),
('Tran Thi B'),
('Le Van C'),
('Pham Thi D');
insert into orders ( order_date, customer_id) values
('2025-01-05', 1),
('2025-01-10', 2),
('2025-02-01', 1),
('2025-02-15', 3),
('2025-03-03', 2);
insert into order_items (order_id, customer_id, product_name, quantity, price) values
(1, 1, 'Laptop Dell',      2, 15000000),
(1, 1, 'Chuot Logitech',   1, 500000),
(2, 2, 'Man hinh LG',      1, 8000000),
(2, 2, 'Ban phim co',      2, 1000000),
(3, 1, 'Tai nghe Sony',    3, 2000000),
(3, 1, 'Loa Bluetooth',    1, 5000000),
(4, 3, 'USB 64GB',         2, 300000),
(5, 2, 'iPhone 15',        1, 25000000),
(5, 2, 'Op lung',          1, 1200000);

-- display order_id , customer_name, total amount of the order 
SELECT o.order_id, c.customer_name, sum(i.quantity*i.price) from orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items i ON o.order_id = i.order_id
GROUP BY o.order_id, c.customer_name;

-- calculate total amount of each customer
SELECT c.customer_name, sum(i.quantity*i.price) FROM order_items i
RIGHT JOIN customers c ON i.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name;

-- display customers whose total amount is greater than 20 million
SELECT c.customer_name, sum(i.price * i.quantity) AS total_amount from orders o 
JOIN customers c     ON c.customer_id = o.customer_id
JOIN order_items i   ON i.order_id    = o.order_id
GROUP BY c.customer_id , c.customer_name 
HAVING total_amount > 20000000;


-- display customer whose total amount is highest
SELECT c.customer_name , sum(i.quantity * i.price) as total_amount FROM orders o
JOIN order_items i ON o.order_id = i.order_id
RIGHT JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_amount DESC LIMIT 1;

SELECT c.customer_name , sum(i.quantity * i.price) as total_amount FROM orders o
JOIN order_items i ON o.order_id = i.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING total_amount = (  SELECT MAX(total_amount) FROM (
    SELECT sum(i.price*i.quantity) AS total_amount FROM order_items i
    JOIN orders o ON o.order_id = i.order_id
    GROUP BY o.customer_id
)AS sub);


