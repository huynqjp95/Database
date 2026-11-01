-- create a procedure named insert_customer with parameters :
-- in_customer_name, in_email, in_phone, in_address
delimiter //
create procedure insert_customer (
	in in_customer_name varchar(50),
    in in_email varchar(100),
	in in_phone varchar(15),
    in in_address varchar(255))
begin
	insert into customers (customer_name, email, phone, address) values
    (in_customer_name, in_email, in_phone, in_address);
    select 'Successfully added a new customer' as message;
end //
delimiter ;

call insert_customer('Dat Van Tay', 'vantay@example.com','0907080000', '69 bui vien, tokyo');