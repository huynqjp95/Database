create table products (
	id int auto_increment primary key,
    product_name varchar(50),
    price int,
    category varchar(50)
    );
insert into products ( product_name, price, category) values
('iphone 18',25000000,'Phone'),
('Macbook pro 2025', 40000000, 'Laptop'),
('Magsafe 100v', 2000000, 'Phu kien');

-- create a procedure named sp_get_products_by_category
-- procedure have one parameter is category
-- procedure performs : retrieve products belonging to the category passed as a parameter
-- procedure処理内容：引数として渡されたカテゴリ属する商品を取得する
-- write the Call to revoke the procedure with a specific value

delimiter //
create procedure sp_get_products_by_category (in p_category int)
begin
	select * from products where category = p_category;
end //
delimiter ;

CALL sp_get_products_by_category('Phone');



