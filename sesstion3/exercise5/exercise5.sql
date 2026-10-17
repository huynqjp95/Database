CREATE TABLE teachers (
    teacherID VARCHAR(20) PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE students (
    studentID VARCHAR(20) PRIMARY KEY,
    fullName VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE courses (
    courseID VARCHAR(20) PRIMARY KEY,
    courseName VARCHAR(255) NOT NULL,
    price INT,
    description TEXT,
    teacherID VARCHAR(20) NOT NULL,
    FOREIGN KEY (teacherID) REFERENCES teachers(teacherID)
);

CREATE TABLE enrollments (
    courseID VARCHAR(20),
    studentID VARCHAR(20),
    PRIMARY KEY (courseID,studentID),
    FOREIGN KEY (courseID) REFERENCES courses(courseID),
    FOREIGN KEY (studentID) REFERENCES students(studentID)
);

ALTER TABLE courses
ADD CONSTRAINT chk_price CHECK (price>0);

-- chay khi can
DROP TABLE enrollments;



