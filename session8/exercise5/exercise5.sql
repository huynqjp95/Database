create table employees (
	id int auto_increment primary key,
    full_name varchar(50),
    salary int,
    department varchar(20)
    );
insert into employees ( full_name, salary, department) values
('Dat Van Tay',16000000,'IT'),
('Hua Minh Dat',12000000, 'Nhan su'),
('Thuy Chi',7500000, 'HR');

-- requirement 
-- create a Stored procedure named sp_check_employee_income
-- procedure has 2 IN parameters : employee name, salary
-- inside the procedure: use IF-ELSE IF-ELSE statements
-- determine the corresponding income level
-- display the results, including : employee name, income level
/*
	要件
    sp_check_employee_incomeという名前のプロシージャを作成する
    プロシージャは二つのパラメータを持つ
    従業員の名前、給与
    プロシージャ中でIFーELSE IFーELSE文を使用して、給与に応じた所得レベルを判定する
    次の結果を表示する：従業員の名前、所得レベル（説明文字列）
    テーブルのダータを更新しない
*/

delimiter //
create procedure sp_check_employees ( IN employee varchar(50),IN salary int)
begin
	if salary >= 15000000 then
		select concat(employee,' High Income') AS message;
	elseif salary < 8000000 then
		select concat(employee, ' Low Income') as message;
	else
		select concat(employee, ' Normal Income') as message;
	end if;
end //
delimiter ;

CALL sp_check_employees('Van Tay',16000000);
call sp_check_employees('Dong Phuong',12000000);
call sp_check_employees('Dong Thuan',7000000);
