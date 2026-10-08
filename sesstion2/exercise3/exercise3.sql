CREATE TABLE student_constraint (
	studentID VARCHAR(20) PRIMARY KEY,
    fullName NVARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    age INT CHECK(age>=18),
    gender ENUM("male","female")
);