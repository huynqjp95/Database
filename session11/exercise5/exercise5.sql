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

delimiter //
create procedure place_order (in p_product_id int, in p_quantity int)
begin
	declare v_stock int;
    declare v_price decimal(10,2);
	declare exit handler for sqlexception
    begin
		rollback;
        select 'Transaction failed, rolled back' as message;
	end;
    
    start transaction;
    select stock,price into v_stock,v_price from products where id = p_product_id;
    if v_stock >= p_quantity then
		update products set stock = stock - p_quantity
        where id = p_product_id;
	
        insert into orders (product_id,quantity, total_price) values
        (p_product_id, p_quantity, v_price*p_quantity);
        
        commit;
        select 'Order is successful' as message;
	else
		rollback;
        select 'Not enough quantity in the stock' as message;
	end if;
end //
delimiter ;

call place_order(1,4);
select * from orders;
select * from products;

call place_order(1,10);