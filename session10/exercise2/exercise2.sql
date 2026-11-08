create table products (
	product_id int auto_increment primary key,
    product_name varchar(100),
    quantity int
    );
create table inventory_changes (
	change_id int auto_increment primary key,
    product_id int references products(product_id),
    old_quantity int,
    new_quantity int,
    change_date datetime
    );

insert into products (product_name, quantity) values
('IPhone 17 promax',18),('Samsung 24 ultra ', 14);

delimiter //
create trigger before_product_delete before delete on products
for each row
begin 
	if old.quantity > 10 then
		signal sqlstate '45000' set message_text =
        'Product quantity greater than 10';
	end if;
end //
delimiter ;


delete from products where product_id = 1;
select * from products;
update products set quantity = quantity - 15 where product_id = 1;



