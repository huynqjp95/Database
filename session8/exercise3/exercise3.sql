create table employees (
	id int auto_increment primary key,
    full_name varchar(20),
    salary int
    );
insert into employees (full_name, salary) values
('Van Tay',20000000),('Han Lap',25000000),('Hua Thanh',15000000);

-- requirement , 要件
-- create a procedure named sp_get_avg_salary
-- sp_get_avg_salaryとして名前のストアどプロシージャを作成する
-- inside the procedure、プロシージャ内：
-- declare a variable to store the avarage salary
-- 平均給与を格納する変数を宣言する
-- assign a value to the variable using the result of a query
-- クエリの実行結果を使って、変数に値を代入する
-- display the value of the variable on the screen
-- 変数の値を画面に表示する

delimiter //
create procedure sp_get_avg_salary ()
begin
	declare avg_salary int;
    select IFNULL(avg(salary),0) into avg_salary from employees;
    select avg_salary;
end //
delimiter ;


