-- USE exercise

CREATE TABLE classes (
    classID VARCHAR(20) PRIMARY KEY,
    className VARCHAR(255) NOT NULL,
    year VARCHAR(50)
);

CREATE TABLE students (
    studentID VARCHAR(20) PRIMARY KEY,
    name NVARCHAR(255) NOT NULL,
    birthDay DATE,
    gender ENUM('male','female'),
    classID VARCHAR(20),
    FOREIGN KEY (classID) REFERENCES classes(classID)
);