create table customers (
	id int auto_increment primary key,
    name varchar(50)
);
create table orders (
	id int auto_increment primary key,
    order_date date,
    customer_id int,
    foreign key (customer_id) references customers(id)
);

-- create a view with name is v_order_info
create view v_order_info as
select o.id, o.order_date, c.name from customers c
join orders o on o.customer_id = c.id;
