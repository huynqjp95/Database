create table products (
	product_id int auto_increment primary key,
    product_name varchar(50) not null,
    price decimal(10,2) not null check (price > 0),
    stock int not null check (stock > 0)
    );
insert into products (product_name, price, stock) values
('Chuot khong day Logitech',       350000,  120),
('Ban phim co Keychron K2',       1890000,   60),
('Cap sac USB-C 1m',               120000,  300),
('Man hinh Dell 27 inch',         4990000,   25),
('Gia do laptop nhom',             280000,   80),
('Webcam Full HD 1080p',           650000,   50),
('Tai nghe Bluetooth Sony',       1590000,   90),
('SSD ngoai Samsung 500GB',       1790000,   40),
('USB Kingston 64GB',              190000,  200),
('Ban di chuot gaming',            150000,  150),
('Op lung dien thoai cao cap',     180000,  250),
('Pin sac du phong 10000mAh',      420000,  110),
('Cap HDMI 2m',                    130000,  180),
('Router Wi-Fi TP-Link AX',       1250000,   35),
('Den ban LED chong can',          390000,   70),
('Loa Bluetooth JBL',             2290000,   65),
('Cap mang LAN 5m',                110000,  140),
('Balo laptop chong nuoc',         550000,   55),
('Sac khong day 15W',              320000,   95),
('May in mini Canon',             3990000,   20);

-- create a procedure named get_high_value_products
-- to take all products whose price greater than 1million
delimiter //
create procedure get_high_value_products ()
begin
	select * from products where price > 1000000;
end //
delimiter ;

call get_high_value_products;
