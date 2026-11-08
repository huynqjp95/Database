-- create stored procedure named sp_create_order
delimiter //
create procedure sp_create_order (p_customer_id int, p_product_id int, p_quantity int, p_price decimal(10,2))
begin
	declare v_stock int;
	declare exit handler for sqlexception
    begin 
		rollback;
        select 'Transaction failed, rolled back' as message;
	end;
    
    start transaction;
    select stock_quantity into v_stock from inventory 
    where product_id = p_product_id;
    if v_stock < p_quantity then
		rollback;
        select 'Not enough quantity in the stock' as message;
	else
		insert into orders (customer_id) values (p_customer_id);
        
		insert into order_items (order_id, product_id, quantity, price)
        values (last_insert_id(),p_product_id, p_quantity, p_price);
        
        update inventory set stock_quantity = stock_quantity - p_quantity 
        where product_id = p_product_id;
        
        commit;
        select 'Add order is successful' as message;
	end if;
end //
delimiter ;

-- stored procedure sp_pay_order
delimiter //
create procedure sp_pay_order (p_order_id int, p_payment_method varchar(50))
begin
	declare v_status varchar(10);
    declare v_amount decimal(10,2);
	declare exit handler for sqlexception
    begin 
		rollback;
        select 'Transaction failed, rolled back' as message;
	end;
    
    start transaction;
    select status,total_amount into v_status,v_amount from orders where order_id = p_order_id;
    if v_status <> 'Pending' then
		rollback;
        select 'Status is not pending' as message;
	else 
		insert into payments (order_id, amount, payment_method) 
        values (p_order_id,v_amount, p_payment_method);
        update orders set status = 'Completed' where order_id = p_order_id;
		
        commit;
        select 'Pay order is successful' as message;
	end if;
end //
delimiter ;

-- stored procedure sp_cancel_order
delimiter //
create procedure sp_cancel_order (p_order_id int)
begin
	declare v_status varchar(10);
	declare exit handler for sqlexception
    begin
		rollback;
        select 'Transaction failed, rolled back' as message;
	end;
    
    start transaction;
    select status into v_status from orders
    where order_id = p_order_id;
    
    if v_status is null or v_status <> 'Pending' then
		rollback;
        select 'Status is incorrect' as message;
	else 
		update orders set status = 'Cancelled'
        where order_id = p_order_id;
        
        -- update inventory by update ... join 
        update inventory i join (
        select product_id , sum(quantity) as tqy from order_items
        where order_id = p_order_id
        group by product_id) oi on i.product_id = oi.product_id
        set i.stock_quantity = i.stock_quantity + oi.tqy;
        
        delete from order_items where order_id = p_order_id;
        
        commit;
        select 'Cancel order is successful' as message;
        
	end if;
end //
delimiter ;

        
    