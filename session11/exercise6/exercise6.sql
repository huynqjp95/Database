create table products (
	id int auto_increment primary key,
    product_name varchar(100),
    price decimal(10,2),
    stock int
    );
create table orders ( 
	id int auto_increment primary key,
    product_id int,
    quantity int,
    total_price decimal(10,2),
    order_date datetime default current_timestamp
    );

insert into products ( product_name, price, stock) values
('Laptop Gaming',2000000,10);

-- exercise 6
	-- update table orders add column status
alter table orders
add column status enum('Pending','Shipping','Completed','Cancelled') default 'Pending';

	-- check data table orders
select * from orders;
	-- update the column status for all records to completed
set sql_safe_updates = 0;
update orders set status = 'Completed';
set sql_safe_updates = 1;

	-- create stored procedure named cancel_order
delimiter //
create procedure cancel_order (in p_order_id int)
begin
	declare v_quantity int;
    declare v_status varchar(10);
    
    declare exit handler for sqlexception
    begin
		rollback;
        select 'Transaction faild, rolled back';
	end;
    
    start transaction;
    
    select quantity, status into v_quantity, v_status
    from orders
    where id = p_order_id;
    
    if v_quantity is null then
		rollback;
        select 'Order does not exist' as message;
	elseif v_status = 'Cancelled' then
		rollback;
        select 'Order has already been cancelled' as message;
	else
		update products set stock = stock + v_quantity 
        where id = (
			select product_id from orders where id = p_order_id
        );
        update orders set status = 'Cancelled'
        where id = p_order_id;
        commit;
        select 'Cancel is successful' as message;
    end if;
end //
delimiter ;

call place_order(1,2);

select * from orders;
select * from products;

call cancel_order(2);