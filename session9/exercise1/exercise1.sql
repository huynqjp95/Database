create table customers (
	customer_id int auto_increment primary key,
    customer_name varchar(50) not null,
    email varchar(100) not null,
    phone varchar(15) not null,
    address varchar(255) not null
    );
-- create a unique index for column email
create unique index idx_email on customers(email);

-- create a normal index (non-unique) for column phone
create index idx_phone on customers(phone);