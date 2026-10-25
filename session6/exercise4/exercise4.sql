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

-- insert new order into orders , and order_details
insert into orders (customer_id , order_date)
value (6,'2024-11-1');
insert into order_details (order_id, product_id, quantity, price) values
(last_insert_id(),6,2,32000000),
(last_insert_id(),5,1,30000000);

-- calculate total amount of the shop
select sum(price*quantity) as total_amount from order_details;

-- calculate average price of each order
select avg(price*quantity), order_id from order_details
group by order_id;

-- display the order whose total amount is the highest in orders
select order_id, sum(price*quantity) as total_amount from order_details
group by order_id order by total_amount desc limit 1 ;

-- display list products whose quantity is best seller 
select d.product_id, p.name , sum(d.quantity) as quantity from order_details d
join products p on d.product_id = p.id
group by d.product_id,p.name
order by quantity desc limit 3; 



