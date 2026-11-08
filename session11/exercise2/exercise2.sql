create table accounts (
	account_id int auto_increment primary key,
    balance decimal(10,2)
    );

insert into accounts (balance) values
(5000000);

delimiter //
create procedure withdraw_money (in p_account_id int, in p_amount decimal(10,2))
begin
	declare funds decimal(10,2);
    start transaction;
    update accounts set balance = balance - p_amount where account_id = p_account_id;
    select balance into funds from accounts where account_id = p_account_id;
    if funds < 0 then
		rollback;
        select 'Not enough funds in the account';
	else 
		commit;
        select 'Withdraw is successful';
	end if;
end //
delimiter ;

call withdraw_money(1,1000000);
select * from accounts;

call withdraw_money(1,5000000);


		