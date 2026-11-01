create table orders (
	id int auto_increment primary key,
    total_amount int
    );
insert into orders ( total_amount) values
(7000000),(2500000),(5000000);

-- requirement 
-- create a procedure named sp_check_order_value
-- the procedure has one IN parameter representing total order amount 
-- use if statement inside the procedure 
-- display a message 'High-value order' or 'Normal order'
-- do not access data from any other table 
-- 要件
-- sp_check_order_valueとして名前のストアドプロシージャを作成する
-- 注文の合計金額を示すINパラメーターを一つ持つ
-- プロシーしゃ内でIF文を使用する
-- 次にいずれかのメッセージを表示する：’高額注文’　または　’通常注文’
-- 他のテーブルのデータにアクセスしない

delimiter //
create procedure sp_check_order_value (in total_amount int)
begin
	if total_amount >= 5000000 then
		select 'High-value order' as message;
	else
		select 'Normal order' as messge;
	end if;
end //
delimiter ;