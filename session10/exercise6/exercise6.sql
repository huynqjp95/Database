create table products (
	product_id int auto_increment primary key,
    product_name varchar(100),
    quantity int
    );
    
create table cart_items (
	id int auto_increment primary key,
    product_id int,
    quantity int,
    foreign key (product_id) references products(product_id)
    );

delimiter //
create trigger before_cart_add before insert on cart_items
for each row
begin
	declare stock int;
    select quantity into stock from products where product_id = new.product_id;
    if new.quantity > stock then
		signal sqlstate '45000' set message_text =
		'Not enough the quantity of product in the stock';
	end if;
end //
delimiter ;

insert into products (product_name, quantity) values
('Iphone 15',5);

insert into cart_items( product_id, quantity) values
	(1,2);
insert into cart_items (product_id, quantity) values
	(1,10);
select * from cart_items;