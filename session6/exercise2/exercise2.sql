create table categories (
	id int auto_increment primary key,
    name varchar(255) 
);
create table products (
	id int auto_increment primary key,
    name varchar(255),
    price double,
    category_id int,
    foreign key (category_id) references categories(id)
);
create table customers (
	id int auto_increment primary key,
    name varchar(255),
    email varchar(255)
);
create table orders (
	id int auto_increment primary key,
    customer_id int,
    order_date date,
    foreign key (customer_id) references customers(id)
);
create table order_details (
	order_id int,
    product_id int,
    quantity int,
    price double,
    primary key (order_id,    product_id),
    foreign key (order_id)    references orders(id),
    foreign key (product_id)  references products(id)
);

-- 1. categories
insert into categories (name) values
('Điện thoại'),
('Laptop'),
('Phụ kiện'),
('Đồng hồ thông minh'),
('Máy tính bảng');

-- 2. products
insert into products (name, price, category_id) values
('iPhone 15',            22000000, 1),
('Samsung Galaxy S24',   19000000, 1),
('Xiaomi 14',            14000000, 1),
('MacBook Air M2',       27000000, 2),
('Dell XPS 13',          30000000, 2),
('Lenovo ThinkPad X1',   32000000, 2),
('Tai nghe AirPods Pro',  5500000, 3),
('Sạc nhanh 65W',          600000, 3),
('Chuột Logitech MX',     1800000, 3),
('Apple Watch S9',        9500000, 4),
('iPad Air',             16000000, 5),
('Samsung Galaxy Tab S9',18000000, 5),
('Ốp lưng iPhone',         250000, 3);

-- 3. customers
insert into customers (name, email) values
('Nguyễn Văn An',   'an.nguyen@gmail.com'),
('Trần Thị Bình',   'binh.tran@gmail.com'),
('Lê Hoàng Cường',  'cuong.le@yahoo.com'),
('Phạm Minh Dũng',  'dung.pham@gmail.com'),
('Hoàng Thị Em',    'em.hoang@outlook.com'),
('Vũ Quang Phúc',   'phuc.vu@gmail.com');

-- 4. orders
insert into orders (customer_id, order_date) values
(1, '2024-01-05'),
(1, '2024-02-14'),
(2, '2024-01-20'),
(3, '2024-03-02'),
(3, '2024-03-15'),
(4, '2024-02-28'),
(5, '2024-04-10'),
(2, '2024-04-22');

-- 5. order_details (order_id, product_id, quantity, price)
insert into order_details (order_id, product_id, quantity, price) values
(1, 1,  1, 22000000),
(1, 7,  1,  5500000),
(1, 13, 2,   250000),
(2, 4,  1, 27000000),
(2, 9,  1,  1800000),
(3, 2,  1, 19000000),
(3, 8,  2,   600000),
(4, 5,  1, 30000000),
(4, 9,  2,  1800000),
(5, 10, 1,  9500000),
(5, 7,  1,  5500000),
(6, 11, 1, 16000000),
(6, 8,  1,   600000),
(7, 3,  2, 14000000),
(7, 13, 1,   250000),
(8, 12, 1, 18000000),
(8, 1,  1, 22000000);

-- display customers with at least one order
select c.name, count(o.id) as order_number from orders o
join customers c on o.customer_id = c.id
group by c.name, c.id;

-- display customers who have no orders
select customers.* from customers
left join orders on orders.customer_id = customers.id
where orders.id is null;

-- calculate total amount of each customer
select c.name, sum(d.price*d.quantity) from orders o
right join customers c on c.id = o.customer_id
left join order_details d on d.order_id = o.id
group by c.id , c.name;

-- identify customers who have purchased the product with the highest price
select c.id, c.name, d.price, p.name as product from orders o
join order_details d on o.id = d.order_id
join customers c on o.customer_id = c.id
join products p on p.id = d.product_id
where d.price = (
	select max(price) from order_details
    );




