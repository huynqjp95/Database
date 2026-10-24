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

-- customer_id can be removed from order_items table
-- but the exercise requied us to set this attribute, so i should keep it 
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

-- display order_id , order_date, customer_name
select o.order_id, o.order_date, c.customer_name from orders o
join customers c on o.customer_id = c.customer_id;

-- display the list of products in each order
select o.order_id, i.product_name from orders o
join order_items i on o.order_id = i.order_id
order by o.order_id;

-- calculate total amount for each order
select o.order_id, sum(i.price*i.quantity) as total_amount from orders o
join  order_items i on o.order_id = i.order_id
group by o.order_id;

-- display orders whose total amount is greater than 10 million
select * from orders
where order_id IN ( select order_id from order_items
					group by order_id having sum(price*quantity) > 10000000);

select o.order_id, o.order_date, sum(i.price*i.quantity) as total_amount from orders o 
join order_items i on o.order_id = i.order_id 
group by o.order_id, o.order_date
having total_amount > 10000000
order by o.order_id;
