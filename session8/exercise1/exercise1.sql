create table students ( 
	id int auto_increment primary key,
    full_name varchar(50),
    class varchar(10)
    );
insert into students( full_name, class) values
('Dat Van Tay', 'A1'),('Tay Phuong That Bai','A1'),('La Kiet','A2');

-- create a stored procudure named sp_get_all_students
-- procedure have no parameters

delimiter //
create procedure sp_get_all_students ()
begin
	select * from students;
end //
delimiter ;

