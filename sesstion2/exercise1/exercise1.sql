-- CREATE DATABASE exercise
-- USE exercise

CREATE TABLE students (
    studentID VARCHAR(20) PRIMARY KEY,
    fullName NVARCHAR(255) NOT NULL,
    birthDay DATE,
    gender ENUM('male','female')
);