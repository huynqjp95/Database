create table accounts (
	account_id int auto_increment primary key,
    balance decimal(10,2)
    );

insert into accounts (balance) values
(5000000), (3200000), (7500000), (1200000), (9800000),
(4500000), (2300000), (6100000), (8700000), (1500000);

create table transactions (
	transaction_id int auto_increment primary key,
    account_id int,
    amount decimal(10,2),
    log_message varchar(255),
    transaction_date datetime default current_timestamp,
    foreign key (account_id) references accounts(account_id)
    );

delimiter //
create procedure deposit_with_logging (in p_account_id int, in p_amount decimal(10,2))
begin
	declare exit handler for sqlexception
    begin
		rollback;
        select 'Deposit failed, tracsaction rolled back' as message;
	end;
	start transaction;
		update accounts set balance = balance + p_amount where account_id = p_account_id;
		insert into transactions (account_id, amount, log_message)
		values (p_account_id, p_amount,'Deposit into the account');
	commit;
		select 'Deposit is successful' as message;
end //
delimiter ;

call deposit_with_logging (1,55500);
select * from accounts where account_id = 1;
select * from transactions;

call deposit_with_logging(222,22222);
select * from transactions;

		