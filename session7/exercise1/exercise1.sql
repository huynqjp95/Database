create table students (
	id int auto_increment primary key,
    full_name varchar(100),
    birth_year int check ( year >1900),
    class varchar(20),
    address varchar(255)
);

-- create a view have view name is v_student_basis
create view v_student_basis
as 
select id, full_name, class from students;