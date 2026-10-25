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

-- display product names along with their corresponding category names
select p.name, c.name from categories c
join products p on p.category_id = c.id;

-- count the number of orders for each customer
select c.name, count(c.id) from customers c
left join orders o on o.customer_id = c.id
group by c.id, c.name;

-- identify the five customers with the highest total spending 
select c.id, c.name, sum(d.quantity*d.price) as total_spending from orders o
join customers c on c.id = o.customer_id 
join order_details d on d.order_id = o.id
group by c.id ,c.name
order by total_spending desc limit 5;

-- find products that have never appeared in any order
select p.* from products p
left join order_details d on p.id = d.product_id 
where d.order_id is null;

-- find customers who have purchased products from the category with the largest number of products
select distinct c.id, c.name from customers c
join orders o on c.id = o.customer_id
join order_details d on o.id = d.order_id
join products p on p.id = d.product_id
where p.category_id  = ( 
	select category_id from products
    group by category_id 
    order by count(category_id) desc limit 1
);

select distinct c.id, c.name from customers c
join orders o on c.id = o.customer_id
join order_details d on o.id = d.order_id
join products p on p.id = d.product_id
where p.category_id  = ( 
	select category_id from products
    group by category_id 
    having count(*) = (
		select max(cnt) from (
			select count(*) as cnt from products
            group by category_id) as t )
);

