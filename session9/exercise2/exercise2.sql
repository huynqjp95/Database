create table customers (
	customer_id int auto_increment primary key,
    customer_name varchar(50) not null,
    email varchar(100) not null,
    phone varchar(15) not null,
    address varchar(255) not null
    );

insert into customers (customer_name, email, phone, address) values
('Nguyen Van An',   'an.nguyen@gmail.com',   '0901234567', '12 Le Loi, Quan 1, TP.HCM'),
('Tran Thi Binh',   'binh.tran@gmail.com',   '0912345678', '45 Nguyen Hue, Quan 1, TP.HCM'),
('Le Van Cuong',    'cuong.le@yahoo.com',    '0923456789', '78 Tran Hung Dao, Hoan Kiem, Ha Noi'),
('Pham Thi Dung',   'dung.pham@gmail.com',   '0934567890', '23 Bach Dang, Hai Chau, Da Nang'),
('Hoang Van Em',    'em.hoang@outlook.com',  '0945678901', '56 Hung Vuong, Ninh Kieu, Can Tho'),
('Vu Thi Phuong',   'phuong.vu@gmail.com',   '0956789012', '89 Pham Van Dong, Cau Giay, Ha Noi'),
('Dang Van Giang',  'giang.dang@gmail.com',  '0967890123', '34 Hai Ba Trung, Quan 3, TP.HCM'),
('Bui Thi Hoa',     'hoa.bui@yahoo.com',     '0978901234', '67 Ly Thuong Kiet, Hue, Thua Thien Hue'),
('Do Van Hung',     'hung.do@gmail.com',     '0901234567', '12 Le Loi, Quan 1, TP.HCM'),
('Ngo Thi Lan',     'lan.ngo@outlook.com',   '0989012345', '90 Tran Phu, Nha Trang, Khanh Hoa');

-- create a view named view_customer_contact that contrains only following information
-- customer_id, customer_name, email, phone
create view view_customer_contact as
select customer_id, customer_name, email, phone from customers;

select * from view_customer_contact;

