create table accounts (
	account_id int auto_increment primary key,
    balance decimal(10,2)
    );

insert into accounts (balance) values
(5000000), (3200000), (7500000), (1200000), (9800000),
(4500000), (2300000), (6100000), (8700000), (1500000);

select * from accounts;
start transaction ;
update accounts set balance = balance + 1000000 where account_id = 1;
commit;
select * from accounts;
