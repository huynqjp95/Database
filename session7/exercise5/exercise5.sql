create table employees (
	id int auto_increment primary key,
    name varchar(255),
    department varchar(255),
    salary int,
    identify_id varchar(20)
);

-- create a view have name like v_employee_public
create view v_employee_public as
select id, name, department from employees;