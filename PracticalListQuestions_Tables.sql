-- CREATE DATABASE student_society;
-- USE student_society;

-- STUDENT TABLE

CREATE TABLE student(
Roll_No CHAR(6) PRIMARY KEY,
StudentName VARCHAR(20),
Course VARCHAR(10),
DOB DATE
);

-- SOCIETY TABLE

CREATE TABLE society(
SocID CHAR(6) PRIMARY KEY,
SocName VARCHAR(20),
MentorName VARCHAR(15),
TotalSeats INT UNSIGNED
);

-- ENROLLMENT TABLE

CREATE TABLE enrollment(
RollNo Char(6),
SID CHAR(6),
DateOfEnrollment DATE,
CONSTRAINT fk_RollNo_student FOREIGN KEY (RollNo) REFERENCES student(Roll_No),
CONSTRAINT fk_Sid_society FOREIGN KEY (SID) REFERENCES society(SocID)
);


-- INSERTING DATA

INSERT INTO student VALUES
('S0001', 'Alice', 'Chemistry', '2002-05-20'),
('S0002', 'Arjun', 'CS', '2001-10-12'),
('S0003', 'Zoya', 'Bio', '1999-12-01'),
('S0004', 'Xander', 'Math', '1998-07-15'),
('S0005', 'Anita', 'Physics', '2003-01-25'),
('S0006', 'Rahul', 'Chemistry', '2000-06-17'),
('S0007', 'Neha', 'CS', '2001-11-30');

INSERT INTO society VALUES
('S1', 'Debating', 'Dr. Gupta', 20),
('S2', 'Dancing', 'Ms. Roy', 30),
('S3', 'NSS', 'Mr. Mehta', 50),
('S4', 'Sashakt', 'Ms. Gupta', 15),
('S5', 'Photography', 'Dr. Sharma', 25);

INSERT INTO enrollment VALUES
('S0001', 'S1', '2022-01-15'),
('S0002', 'S2', '2023-03-10'),
('S0003', 'S3', '2023-01-05'),
('S0004', 'S1', '2023-05-20'),
('S0005', 'S4', '2023-06-10'),
('S0006', 'S2', '2023-02-14'),
('S0001', 'S3', '2022-02-01'),
('S0002', 'S3', '2023-03-25'),
('S0003', 'S5', '2023-06-05');


