drop database if exists inventory_management;
create database inventory_management;
use inventory_management;

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
create trigger before_insert_product before insert on products
for each row
begin
	if new.quantity < 0 then
    signal sqlstate '45000' set message_text =
    'The quantity of products added in inventory is incorrect';
    end if;
end //
delimiter ;

insert into products ( product_name, quantity) values
('Redme Note 10', -1);
insert into products ( product_name, quantity) values
('Redme Note 10', 10);
select * from products;

