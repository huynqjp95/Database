CREATE TABLE classes (
    classID VARCHAR(20) PRIMARY KEY,
    className VARCHAR(50) NOT NULL,
    schoolYear VARCHAR(50) NOT NULL
);

CREATE TABLE students (
    studentID VARCHAR(20) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    classID VARCHAR(20) NOT NULL,
    FOREIGN KEY (classID) REFERENCES classes(classID)
);
