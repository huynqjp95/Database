-- create table
CREATE TABLE students (
	student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(10) CHECK(gender IN('MALE','FEMALE')),
    email VARCHAR(255) 
);

-- insert data
INSERT INTO students (student_id, full_name, birth_date, gender, email)
VALUES ('001', 'Tran Van Dong', '19910302', 'MALE', 'dong@gmail.com'),
('002', 'Dat Van Tay','19930908','MALE', 'vantay@gmail.com'),
('003', 'Hua Manh Hung','19900528','MALE', 'hung@gmail.com'),
('004', 'Luu Diep Phi','19920415','FEMALE', 'diepphi@gmail.com'),
('005', 'Co Thien Nac','19930908','MALE',NULL);

-- show full table
SELECT * FROM students;

-- show ma sinh vien , ho ten , email
SELECT student_id, full_name,email FROM students;