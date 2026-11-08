create table products (
	product_id int auto_increment primary key,
    product_name varchar(100),
    quantity int
    );
create table inventory_changes (
	change_id int auto_increment primary key,
    product_id int,
    old_quantity int,
    new_quantity int,
    change_date datetime
    );

insert into products (product_name, quantity) values
('IPhone 18 promax',21),('Samsung dueo',19);

delimiter //
create trigger after_product_update after update on products
for each row
begin 
	if new.quantity < 0 then 
    signal sqlstate '45000' set message_text =
    'Not enough product in stock to place the order';
    elseif new.quantity <> old.quantity then
	insert into inventory_changes (product_id,old_quantity, new_quantity,change_date)
    values (new.product_id,old.quantity, new.quantity,now());
    end if;
end //
delimiter ;

update products set quantity = quantity - 3 where product_id = 1;
update products set quantity = quantity - 19 where product_id = 1;
select * from inventory_changes;

