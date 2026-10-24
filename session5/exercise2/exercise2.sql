CREATE TABLE employees (
    emp_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

-- inset example data for TABLE
INSERT INTO employees (emp_id, full_name, department, salary) VALUES
('NV001', 'Nguyen Van An',   'IT',         18000000),
('NV002', 'Tran Thi Binh',   'IT',         25000000),
('NV003', 'Le Hoang Cuong',  'IT',         14000000),
('NV004', 'Pham Thi Dung',   'IT',         20000000),
('NV005', 'Hoang Minh Duc',  'Ke toan',    10000000),
('NV006', 'Vu Thi Hoa',      'Ke toan',    11000000),
('NV007', 'Dang Quoc Huy',   'Ke toan',     9000000),
('NV008', 'Bui Thi Lan',     'Kinh doanh', 15000000),
('NV009', 'Do Van Nam',      'Kinh doanh', 13000000),
('NV010', 'Ngo Thi Phuong',  'Nhan su',     8000000);

-- display the number of employees in each department
SELECT COUNT(emp_id) AS SL,department FROM employees
GROUP BY department 
ORDER BY SL;

-- display salary average of employees in each department
SELECT ROUND(AVG(salary),0) AS avgSalary, department FROM employees
GROUP BY department ORDER BY avgSalary;

-- display only department that have more than three employees
SELECT COUNT(emp_id) AS count, department FROM employees
GROUP BY department HAVING count > 3;

-- display only department whose avarage salary is greater than 12 million
SELECT ROUND(AVG(salary),0) AS avgSalary, department FROM employees
GROUP BY department HAVING avgSalary > 12000000;
