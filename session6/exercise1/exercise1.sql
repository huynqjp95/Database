create table categories (
	id int auto_increment primary key,
    name varchar(255) );
create table products (
	id int auto_increment primary key,
    name varchar(255),
    price double,
    category_id int,
    foreign key (category_id) references categories(id)
    );

-- insert example data
insert into categories (name) values
('Dien thoai'),  
('Laptop'),       
('Phu kien'),     
('May tinh bang');

insert into products (name, price, category_id) values
('iPhone 15',          25000000, 1),
('Xiaomi Redmi 13',     5000000, 1),
('MacBook Air M2',     28000000, 2),
('Laptop Dell XPS',    35000000, 2),
('Chuot Logitech',       500000, 3),
('Ban phim co',         1200000, 3),
('Tai nghe Sony',       3000000, 3);

-- update data
update products
set price = 20000000
where id = 1; 

-- delete one product
delete from products where id = 6;

-- display all of products order by price
select * from products order by price desc;

-- count the number of products for each category
select count(p.category_id), c.name from products p
join categories c on c.id = p.category_id
group by c.id , c.name;
