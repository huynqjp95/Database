create table orders (
	id int auto_increment primary key,
    customer_name varchar(100),
    total_amount decimal(10,2),
    order_date datetime default current_timestamp,
    status varchar(50) default ('Pending')
    check (status in('Pending', 'Shipping', 'Completed', 'Cancelled'))
    );

create table order_logs (
	log_id int auto_increment primary key,
    order_id int,
    old_status varchar(50),
    new_status varchar(50),
    log_date timestamp default current_timestamp
    );
    
insert into orders (customer_name, total_amount, order_date, status)
values ('van tay', 120, '2026-10-02 12-21-12','Pending');

delimiter //
create trigger after_order_status_update after update on orders
for each row
begin
	if old.status <> new.status then
	insert into order_logs (order_id, old_status, new_status)
    values (old.id, old.status, new.status);
    end if;
end //
delimiter ;

update orders set status = 'Shipping' where id = 1;
update orders set customer_name = 'dat van tay' where id = 1;
select * from order_logs;
select * from orders;
	
