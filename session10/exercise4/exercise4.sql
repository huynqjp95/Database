
create table employees (
	id int auto_increment primary key,
    first_name varchar(50),
    last_name varchar(50),
    salary decimal(10,2),
    email varchar(100) unique,
    phone_number varchar(15)
    );
create table salary_log (
	log_id int auto_increment primary key,
    employee_id int ,
    old_salary decimal(10,2),
    new_salary decimal(10,2),
    change_date datetime default current_timestamp,
    foreign key (employee_id) references employees(id)
    );
insert into employees (first_name, last_name, salary, email, phone_number)
values ('Tay', 'Van', 18000000, 'vantay@example.com', 0987123123),
('Binh',   'Tran',   22000000, 'binh.tran@example.com',     '0902345678'),
('Cuong',  'Le',     15000000, 'cuong.le@example.com',      '0903456789'),
('Dung',   'Pham',   25000000, 'dung.pham@example.com',     '0904567890'),
('Em',     'Hoang',  17500000, 'em.hoang@example.com',      '0905678901'),
('Phuong', 'Vu',     20000000, 'phuong.vu@example.com',     '0906789012'),
('Giang',  'Dang',   13000000, 'giang.dang@example.com',    '0907890123'),
('Hoa',    'Bui',    24000000, 'hoa.bui@example.com',       '0908901234'),
('Khoa',   'Do',     16000000, 'khoa.do@example.com',       '0909012345'),
('Lan',    'Ngo',    19500000, 'lan.ngo@example.com',       '0910123456');

delimiter //
create trigger trg_after_update_salary after update on employees
for each row
begin 
	if old.salary <> new.salary then
		insert into salary_log (employee_id, old_salary, new_salary)
		values (old.id, old.salary, new.salary);
    end if;
end //
delimiter ;

update employees set salary = 21000000 where id = 1;
update employees set phone_number = '0908712312' where id = 1;
select * from employees;
select * from salary_log;
