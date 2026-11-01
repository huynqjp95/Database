-- create a procedure name add_order with IN parameter: _customer_id, _product_id, _quantity
-- OUT parameter : _message
delimiter //
create procedure add_order 
	(in _customer_id int,
	in _product_id int,
    in _quantity int,
    out _message varchar(255))
begin
	declare _stock int;
    declare _price decimal(12,2);
    select stock,price into _stock,_price from products where product_id = _product_id;
    if _quantity > _stock then
		set _message = 'Not enough products in stock to place the order';
	else
		insert into orders ( customer_id, product_id, quantity, total_amount) values
        (_customer_id, _product_id, _quantity, _quantity*_price);
        update products set stock = stock - _quantity where product_id = _product_id;
        set _message = 'Successfully added a new order';
	end if;
end //
delimiter ;

call add_order (2,3,2,@message);
select @message as message;

call add_order (10,4,500,@message);
select @message as message;


		
