-- DROP DATABASE suppliers;
-- CREATE DATABASE suppliers;

USE suppliers;

CREATE TABLE Suppliers(
SNo INT PRIMARY KEY,
Sname VARCHAR(100),
Status INT,
SCity VARCHAR(100)
);

CREATE TABLE Parts(
PNo INT PRIMARY KEY,
Pname VARCHAR(100),
Colour VARCHAR(50),
Weight FLOAT,
City VARCHAR(100)
);

CREATE TABLE Project(
JNo INT PRIMARY KEY, 
JName VARCHAR(100),
JCity VARCHAR(100)
);

CREATE TABLE Shipment(
SNo INT, 
PNo INT,
JNo INT,
Quantity INT,
CONSTRAINT fk_supplier FOREIGN KEY (SNo) REFERENCES Suppliers(SNo),
CONSTRAINT fk_parts FOREIGN KEY (PNo) REFERENCES Parts(PNo),
CONSTRAINT fk_Project FOREIGN KEY (JNo) REFERENCES Project(JNo)
);

-- SUPPLIER TABLE

INSERT INTO Suppliers (SNo, SName, Status, SCity) VALUES 
(1, 'Supplier1', 15, 'Mandi'),
(2, 'Supplier2', 25, 'Delhi'),
(3, 'Supplier3', 10, 'Mumbai'),
(4, 'Supplier4', 18, 'Mandi'),
(5, 'Supplier5', 30, 'Chennai');

-- PARTS TABLE

INSERT INTO Parts (PNo, PName, Colour, Weight, City) VALUES 
(1, 'Part1', 'Red', 1.2, 'Mandi'),
(2, 'Part2', 'Blue', 0.8, 'Mumbai'),
(3, 'Part3', 'Yellow', 1.5, 'Delhi'),
(4, 'Part4', 'Red', 2.0, 'Chennai'),
(5, 'Part5', 'Green', 0.7, 'Mandi');

-- PROJECT TABLE

INSERT INTO Project (JNo, JName, JCity) VALUES 
(1, 'Project1', 'Mumbai'),
(2, 'Project2', 'Delhi'),
(3, 'Project3', 'Chennai'),
(4, 'Project4', 'Mandi'),
(5, 'Project5', 'Jaipur');

-- SHIPMENT TABLE

INSERT INTO Shipment (SNo, PNo, JNo, Quantity) VALUES 
(1, 1, 1, 500),
(2, 2, 2, 300),
(3, 3, 3, 700),
(4, 4, 4, 450),
(5, 5, 5, 350);
