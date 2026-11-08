create table accounts (
	account_id int auto_increment primary key,
    balance decimal(10,2)
    );

insert into accounts (balance) values
(5000000), (0);

delimiter //
create procedure transfer_money (
	in p_sender_id int,
    in p_receiver_id int,
    in p_amount decimal(10,2)
    )
begin
	declare funds decimal(10,2);
    
	declare exit handler for sqlexception
    begin
		rollback;
        select 'Transaction failed, rolled back';
	end;
    
    start transaction;
    select balance into funds from accounts where account_id = p_sender_id;
    if funds >= p_amount then
		update accounts set balance = balance - p_amount where account_id = p_sender_id;
        update accounts set balance = balance + p_amount where account_id = p_receiver_id;
		commit;
        select 'Transfer is successful' as message;
    else
		rollback;
        select 'Insufficient balance in the sender account' as message;
	end if;
end //
delimiter ;

call transfer_money(1,2,2000000);
select * from accounts;

call transfer_money(1,2,6000000);

	