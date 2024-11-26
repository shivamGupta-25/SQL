-- CREATE DATABASE student_course;

USE student_course;

CREATE TABLE student(
Roll_No CHAR(6) PRIMARY KEY,
StudentName VARCHAR(20),
CourseID VARCHAR(10),
DOB DATE
);

CREATE TABLE course(
CID CHAR(6) PRIMARY KEY,
CourseName VARCHAR(20),
CourseType CHAR(8),
Teacher_in_charge VARCHAR(15),
TotalSeats INT UNSIGNED,
Duration INT UNSIGNED
);

CREATE TABLE admission(
RollNo CHAR(6),
CID CHAR(6),
DateOfAdmission DATE,
PRIMARY KEY (RollNo, CID),
CONSTRAINT fk_rollno FOREIGN KEY (RollNo) REFERENCES student(Roll_No),
CONSTRAINT fk_cid FOREIGN KEY (CID) REFERENCES course(CID)
);

-- INSERT 

INSERT INTO STUDENT (Roll_No, StudentName, CourseID, DOB) VALUES
('X12349', 'Alice', 'CS001', '2002-05-14'),
('Z56789', 'Alex', 'CS002', '2000-07-23'),
('Y11111', 'Bob', 'CS001', '2001-09-12'),
('A22222', 'Amy', 'CH003', '2003-10-02'),
('B33333', 'Charlie', 'CS002', '1998-02-14');

INSERT INTO STUDENT (Roll_No, StudentName, CourseID, DOB) VALUES
('B33334', 'Charlie', 'CS002', '1998-02-14');


INSERT INTO COURSE (CID, CourseName, CourseType, Teacher_in_charge, TotalSeats, Duration) VALUES
('CS001', 'Computer Science', 'Fulltime', 'Dr. Gupta', 50, 6),
('CS002', 'Data Science', 'Parttime', 'Mr. Smith', 30, 4),
('CH003', 'Chemistry', 'Fulltime', 'Dr. Patel', 40, 6),
('PH004', 'Physics', 'Parttime', 'Ms. Gupta', 20, 3),
('SC005', 'BSc Mathematics', 'Fulltime', 'Dr. Brown', 60, 8);


INSERT INTO ADMISSION (RollNo, CID, DateOfAdmission) VALUES
('X12349', 'CS001', '2022-01-10'),
('Z56789', 'CS002', '2022-03-15'),
('Y11111', 'CS001', '2021-07-20'),
('A22222', 'CH003', '2023-05-25'),
('B33333', 'CS002', '2020-09-12');
