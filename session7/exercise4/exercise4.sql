create table products (
	id int auto_increment primary key,
    name varchar(255),
    category varchar(255),
    price int
);
create index idx_category_price on products(category,price);