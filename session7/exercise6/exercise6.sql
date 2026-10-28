create table orders (
	id int auto_increment primary key,
    order_date date,
    status bit(1),
    total_amount int
);
create index idx_status_date on orders(status,total_amount);
