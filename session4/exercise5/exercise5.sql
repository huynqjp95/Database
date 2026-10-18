-- create TABLE
CREATE TABLE employees (
    emp_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    birth_year INT NOT NULL,
    department VARCHAR(50) NOT null,
    salary INT NOT NULL,
    phone VARCHAR(15)
);

-- insert into
INSERT INTO employees (emp_id, full_name, birth_year, department, salary, phone) VALUES
('NV001', 'Nguyen Van An',    '1995', 'IT',        18000000, '0901234567'),
('NV002', 'Tran Thi Binh',    '1998', 'Ke toan',   12000000, '0912345678'),
('NV003', 'Le Hoang Cuong',   '1990', 'IT',        30000000, '0923456789'),
('NV004', 'Pham Thi Dung',    '2000', 'Nhan su',    9000000, '0934567890'),
('NV005', 'Hoang Minh Duc',   '1993', 'Kinh doanh',22000000, '0945678901'),
('NV006', 'Vu Thi Hoa',       '1997', 'Marketing', 15000000, '0956789012'),
('NV007', 'Dang Quoc Huy',    '1988', 'IT',        27000000, '0967890123'),
('NV008', 'Bui Thi Lan',      '2001', 'Ke toan',    8000000, '0978901234'),
('NV009', 'Do Van Nam',       '1992', 'Kinh doanh',20000000, '0989012345'),
('NV010', 'Ngo Thi Phuong',   '1996', 'Nhan su',   13500000, NULL);

--  display employees whose salary between 10tr and 20tr
SELECT * FROM employees
WHERE salary BETWEEN 10000000 and 20000000;

-- display employees whose department is IT or HR / display employees in the IT or HR department
SELECT * FROM employees 
WHERE department IN ('IT','Nhan su');

-- display employees whose full name include 'Anh'
SELECT * FROM employees 
WHERE full_name LIKE '%Anh%';

-- display employees whose phone number is not set yet
SELECT * FROM employees
WHERE phone IS NULL;

-- increase the salaries of employees in the IT department by 10%
UPDATE employees
SET salary = salary * 1.1
WHERE department = 'IT';

-- update the phone number for employees whose phone number is not set yet
UPDATE employees
SET phone = '0983577578'
WHERE emp_id = 'NV010';

-- delete employees whose salary less than 5tr
DELETE FROM employees
WHERE salary <5000000;


