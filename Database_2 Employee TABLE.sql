-- CREATE DATABASE Company;

USE Company;

CREATE TABLE Employee(
FName VARCHAR(50),
Minit CHAR(1),
LName VARCHAR(50),
Ssn CHAR(9) PRIMARY KEY,
BDate DATE,
Address VARCHAR(200),
SEX CHAR(1),
Salary DECIMAL(10,2),
Super_ssn CHAR(9),
Dno INT,
CONSTRAINT fk_Sssn_SSN FOREIGN KEY (Super_ssn) REFERENCES Employee(Ssn)
);

CREATE TABLE Department(
DName VARCHAR(50),
DNumber INT PRIMARY KEY,
Mgr_ssn CHAR(9),
Mgr_start_date DATE,
CONSTRAINT mgrssn_ssn FOREIGN KEY (Mgr_ssn) REFERENCES Employee(Ssn)
);

ALTER TABLE Employee
ADD CONSTRAINT fk_dno FOREIGN KEY (Dno) REFERENCES Department (DNumber);

CREATE TABLE Dept_locations(
DNumber INT,
DLocation VARCHAR(100),
PRIMARY KEY (DNumber, DLocation),
FOREIGN KEY (DNumber) REFERENCES Department(DNumber)
);

CREATE TABLE Project(
PName VARCHAR(50),
PNumber INT PRIMARY KEY,
PLocation VARCHAR(100),
Dnum INT,
FOREIGN KEY (Dnum) REFERENCES Department (DNumber)
);

CREATE TABLE Works_On(
Essn CHAR(9),
PNo INT,
Hours DECIMAL(5,2),
PRIMARY KEY (Essn, PNo),
FOREIGN KEY (Essn) REFERENCES Employee (Ssn),
FOREIGN KEY (PNo) REFERENCES Project (PNumber)
);

CREATE TABLE Dependent(
Essn CHAR(9),
Dependent_Name VARCHAR(50), 
SEX CHAR(1),
BDate DATE,
Relationship VARCHAR(50),
PRIMARY KEY (Essn,Dependent_Name),
FOREIGN KEY (Essn) REFERENCES Employee(Ssn)
);

-- INSERT

-- SET foreign_key_checks = 1;

INSERT INTO EMPLOYEE (Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Super_ssn, Dno)
VALUES
('John', 'A', 'Doe', '123456789', '1980-06-15', '123 Main St, Bellaire', 'M', 55000, NULL, 7),
('Jane', 'B', 'Smith', '987654321', '1975-09-20', '456 Oak St, Houston', 'F', 65000, '123456789', 7),
('Franklin', 'T', 'Wong', '111223344', '1982-02-15', '789 Pine St, Stafford', 'M', 70000, '123456789', 5),
('Maria', 'C', 'Garcia', '334455667', '1990-12-10', '101 Maple St, Bellaire', 'F', 55000, NULL, 5);

INSERT INTO DEPARTMENT (Dname, Dnumber, Mgr_ssn, Mgr_start_date)
VALUES
('Research', 5, '123456789', '2015-01-01'),
('Marketing', 10, '987654321', '2017-03-15'),
('Sales', 7, '111223344', '2010-11-10');

INSERT INTO DEPT_LOCATIONS (Dnumber, Dlocation)
VALUES
(5, 'Stafford'),
(10, 'Houston'),
(7, 'Bellaire');


INSERT INTO PROJECT (Pname, Pnumber, Plocation, Dnum)
VALUES
('ProjectX', 1, 'Houston', 5),
('ProductX', 2, 'Stafford', 10),
('ResearchX', 3, 'Bellaire', 7);

INSERT INTO WORKS_ON (Essn, Pno, Hours)
VALUES
('123456789', 1, 40),
('987654321', 2, 35),
('111223344', 3, 30),
('334455667', 1, 25);

INSERT INTO DEPENDENT (Essn, Dependent_name, Sex, Bdate, Relationship)
VALUES
('123456789', 'John Jr.', 'M', '2010-07-20', 'Son'),
('987654321', 'Lisa Smith', 'F', '2012-11-12', 'Daughter'),
('334455667', 'Maria Garcia Jr.', 'F', '2015-08-22', 'Daughter');
