-- create table
create table students (
	student_id varchar(10) primary key,
    full_name varchar(50) NOT NULL,
    birth_year int check (birth_year >1900),
    gender varchar(10) check ( gender in('Nam','Nu')) not null,
    score decimal(4,2)
);

-- insert into example data
insert into students (student_id, full_name, birth_year, gender,score)
values 
('S001', 'Nguyen Van An',    2005, 'Nam', 8.50),
('S002', 'Tran Thi Binh',    2004, 'Nu',  9.20),
('S003', 'Le Hoang Cuong',   2005, 'Nam', 6.75),
('S004', 'Pham Thu Dung',    2006, 'Nu',  7.80),
('S005', 'Hoang Minh Duc',   2004, 'Nam', 5.50),
('S006', 'Vu Ngoc Ha',       2005, 'Nu',  8.50),
('S007', 'Dang Quoc Huy',    2006, 'Nam', 9.00),
('S008', 'Bui Thanh Lan',    2004, 'Nu',  4.90),
('S009', 'Ngo Anh Khoa',     2005, 'Nam', NULL),
('S010', 'Do Mai Phuong',    2006, 'Nu',  7.25);

-- query select
select student_id , upper(full_name) from students;

-- full name , age of student
select full_name, (2026-birth_year)AS Age from students;

-- display average score rounded to one decimal place
SELECT ROUND(AVG(score),1) AS Average FROM students;

-- display total students, max score, min score
select COUNT(student_id), MAX(score), MIN(score) FROM students;




