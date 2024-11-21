USE suppliers;

-- QUESTION 1

SELECT SNo
FROM suppliers
WHERE SCity = "Mandi" AND Status < 20;

-- QUESTION 2

SELECT suppliers.*
FROM suppliers
INNER JOIN shipment
ON suppliers.SNo = shipment.SNo
WHERE shipment.PNo = 2 
ORDER BY suppliers.SNo DESC;

-- QUESTION 3

SELECT suppliers.sname
FROM suppliers
INNER JOIN shipment
ON suppliers.SNo = shipment.SNo
WHERE shipment.PNo != 2 ;

-- METHOD 2

SELECT SName 
FROM Suppliers 
WHERE SNo NOT IN (SELECT SNo FROM Shipment WHERE PNo = 2);

-- QUESTION 4

SELECT shipment.*, (parts.Weight * shipment.Quantity) AS TotalShipmentWeight
FROM shipment 
INNER JOIN Parts
ON shipment.PNo = parts.PNo;

-- QUESTION 5

SELECT * 
FROM Shipment 
WHERE Quantity BETWEEN 300 AND 750;

-- QUESTION 6

SELECT parts.PNo
FROM parts
INNER JOIN shipment
ON parts.PNo = shipment.PNo
WHERE parts.Weight > 1 OR shipment.SNo = 2;

-- OUESTION 7

SELECT City AS 'City-Parts'
FROM Parts 
WHERE Colour = 'Red' 
GROUP BY City 
HAVING COUNT(*) > 2;

-- QUESTION 8

UPDATE suppliers
SET SCity = "Delhi"
WHERE SNo = 1;

-- QUESTION 9

SELECT shipment.PNo
FROM shipment
INNER JOIN suppliers ON shipment.SNo = suppliers.SNo
INNER JOIN project ON shipment.JNo = project.JNo
WHERE suppliers.SCity = "Allahabad" AND project.JCity = "Chennai"; 

-- QUESTION 10

SELECT Pname
FROM parts
WHERE Colour LIKE "B%";

-- QUESTION 11

ALTER TABLE parts
MODIFY COLUMN Weight FLOAT;

-- QUESTION 12

SELECT Colour, COUNT(*) AS PartCount
FROM parts
GROUP BY Colour;

-- QUESTION 13

SELECT project.JName
FROM project
INNER JOIN shipment
ON project.JNo = shipment.JNo
WHERE project.JCity = "Jaipur" AND shipment.SNo = 3;

-- QUESTION 14

DELETE FROM project
WHERE JCity = "Madras";

-- QUESTION 15

SELECT parts.*
FROM shipment
INNER JOIN parts ON shipment.PNo = parts.PNo
INNER JOIN project ON shipment.JNo = project.JNo
WHERE project.JCity = "Mumbai";

-- QUESTION 16

SELECT COUNT(DISTINCT(JNo)) AS UniqueProjects
FROM shipment
WHERE SNo = 1;

-- QUESTION 17

ALTER TABLE shipment
ADD COLUMN SDate DATE;

SELECT * FROM shipment;

-- QUESTION 18

SELECT suppliers.Sname, COUNT(shipment.PNo) AS TotalParts 
FROM Suppliers
INNER JOIN Shipment ON suppliers.SNo = shipment.SNo
GROUP BY suppliers.SNo;

-- QUESTION 19

SELECT Suppliers.SName, Parts.PName, project.JName, Suppliers.SCity AS City 
FROM Suppliers
INNER JOIN Parts ON suppliers.SCity = parts.City
INNER JOIN Project ON suppliers.SCity = project.JCity;

-- QUESTION 20

SELECT City 
FROM Parts 
WHERE Colour = 'Yellow' 
GROUP BY City 
HAVING COUNT(*) > 3;

-- QUESTION 21

SELECT DISTINCT SCity AS "All-Cities" 
FROM Suppliers
UNION
SELECT DISTINCT City FROM Parts
UNION
SELECT DISTINCT JCity FROM Project;

-- QUESTION 22

SELECT DISTINCT SCity AS "Common-Cities"
FROM suppliers
INNER JOIN parts ON suppliers.SCity = parts.City
INNER JOIN project ON parts.City = project.JCity;

-- QUESTION 23

DESC shipment;

ALTER TABLE shipment
MODIFY COLUMN Quantity BIGINT;

DESC shipment;

