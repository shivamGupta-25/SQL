USE company;
SHOW TABLES;

-- QUESTION 1

SELECT * FROM employee;

-- QUESTION 2

SELECT Ssn, LName, FName, Address
FROM employee
WHERE Dno  = 7;

-- QUESTION 3

SELECT BDate, Address
FROM Employee
WHERE FName = "Franklin" AND LName = "Wong";

-- QUESTION 4

SELECT FName, LName, Salary 
FROM employee;

-- QUESTION 5

SELECT DISTINCT(Salary)
FROM employee;

-- QUESTION 6

SELECT FName, LName
FROM employee
WHERE Address LIKE "%Bellaire%";

-- QUESTION 7

SELECT *
FROM employee 
WHERE BDate BETWEEN '1950-01-01' AND '1950-12-31';

-- QUESTION 8

SELECT Fname, Lname, Salary
FROM employee
WHERE Dno = 5 AND Salary BETWEEN 50000 AND 60000;

-- QUESTION 9

SELECT Fname, Lname
FROM employee
WHERE Super_ssn IS NULL;

-- QUESTION 10

SELECT employee.Ssn, department.DName
FROM employee
INNER JOIN department
ON employee.Dno = department.DNumber;

-- QUESTION 11

SELECT employee.FName, employee.LName, employee.Address
FROM employee
INNER JOIN department
ON employee.Dno = department.DNumber
WHERE department.DName = "Research";

-- QUESTION 12

SELECT project.PNumber, project.Dnum, employee.LName, employee.Address, employee.BDate
FROM project
INNER JOIN department ON project.Dnum = department.DNumber
INNER JOIN employee ON department.Mgr_ssn = employee.Ssn
WHERE project.PLocation = "Stafford";

-- QUESTION 13

SELECT CONCAT(E1.FName, " " ,E1.LName) AS Employee_Name,  CONCAT(E2.FName, " " ,E2.LName) AS Supervisor_Name
FROM employee E1
LEFT JOIN employee E2 ON E1.Super_ssn = E2.Ssn;

-- QUESTION 14

SELECT e.FName, d.DName
FROM employee e
CROSS JOIN department d;

-- QUESTION 15

SELECT DISTINCT P.Pnumber
FROM PROJECT P
JOIN WORKS_ON W ON P.Pnumber = W.Pno
JOIN EMPLOYEE E ON W.Essn = E.Ssn
WHERE E.Lname = 'Narayan'
UNION
SELECT DISTINCT P.Pnumber
FROM PROJECT P
JOIN DEPARTMENT D ON P.Dnum = D.Dnumber
JOIN EMPLOYEE E ON D.Mgr_ssn = E.Ssn
WHERE E.Lname = 'Narayan';

-- QUESTION 16

UPDATE employee
INNER JOIN works_on ON employee.Ssn = works_on.Essn
INNER JOIN project ON works_on.PNo = project.PNumber
SET Salary = Salary + Salary * 0.15
WHERE PName = "ProjectX";

SELECT employee.FName, employee.LName, employee.Salary
FROM employee
INNER JOIN works_on ON employee.Ssn = works_on.Essn
INNER JOIN project ON works_on.PNo = project.PNumber;

-- QUESTION 17

SELECT employee.FName, employee.LName, project.PName
FROM employee
INNER JOIN works_on ON employee.Ssn = works_on.Essn
INNER JOIN project ON works_on.PNo = project.PNumber
ORDER BY employee.Dno, employee.FName;

-- QUESTION 18

SELECT FName, Lname
FROM employee
WHERE Salary NOT IN (SELECT Salary FROM employee WHERE Dno = 10);

-- QUESTION 19

SELECT employee.Fname, employee.Lname
FROM employee
INNER JOIN dependent ON employee.Ssn = dependent.Essn
WHERE SUBSTRING_INDEX(employee.Fname, ' ', 1) = SUBSTRING_INDEX(dependent.Dependent_name, ' ', 1)
AND employee.SEX = dependent.Sex;

-- QUESTION 20

SELECT COUNT(*)
FROM works_on
INNER JOIN project ON works_on.PNo = project.PNumber
WHERE project.PLocation IN ("Bellaire", "Houston", "Stafford");

-- QUESTION 21

SELECT 
    SUM(Salary) AS `Total Salary`,
    MAX(Salary) AS `Maximum Salary`,
    MIN(Salary) AS `Minimum Salary`,
    AVG(Salary) AS `Average Salary`
FROM employee;

-- QUESTION 22

SELECT 
    SUM(Salary) AS `Total Salary`,
    COUNT(*) AS `No. Of Employee`,
    MAX(Salary) AS `Maximum Salary`,
    MIN(Salary) AS `Minimum Salary`,
    AVG(Salary) AS `Average Salary`
FROM employee
INNER JOIN department ON department.DNumber = employee.Dno
WHERE department.DName = "Marketing";

-- QUESTION 23

SELECT CONCAT(FName, " " ,LName) AS `Name`
FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee WHERE Dno = 10);

-- QUESTION 24

SELECT Dno, COUNT(*) AS `No. Of Employee`, AVG(Salary)
FROM employee
GROUP BY Dno;

-- QUESTION 25

SELECT project.PNumber, project.PName, COUNT(works_on.Essn) AS `No Of Employees`
FROM works_on
INNER JOIN project ON works_on.PNo = project.PNumber
GROUP BY project.PNumber;

-- QUESTION 26

UPDATE PROJECT P
JOIN (SELECT Pno FROM WORKS_ON GROUP BY Pno HAVING COUNT(Essn) > 5) W
ON P.Pnumber = W.Pno
SET P.Plocation = 'Bellaire', P.Dnum = 6;

-- QUESTION 27

SELECT Dno, COUNT(*) AS Num_Employees_Over_40K
FROM EMPLOYEE
WHERE Salary > 40000
GROUP BY Dno
HAVING COUNT(*) > 10;

-- QUESTION 28

SELECT Fname, Lname
FROM EMPLOYEE
WHERE Ssn NOT IN (SELECT Essn FROM DEPENDENT)
ORDER BY Fname DESC;
	
-- QUESTION 29

SELECT (SELECT department.DName FROM department WHERE department.DNumber = e.Dno) AS Department,
       (SELECT COUNT(*) FROM employee e1 WHERE e1.Dno = e.Dno AND e1.Sex = 'M') AS Male_Employees,
       (SELECT COUNT(*) FROM employee e2 WHERE e2.Dno = e.Dno AND e2.Sex = 'F') AS Female_Employees
FROM employee e
GROUP BY Dno;

-- QUESTION 30

SELECT 
    E.Dno AS Department_No,
    E.Fname AS First_Name,
    E.Lname AS Last_Name,
    TIMESTAMPDIFF(YEAR, E.Bdate, CURDATE()) AS Age
FROM 
    EMPLOYEE E
WHERE 
    E.Bdate = (
        SELECT MIN(E1.Bdate)
        FROM EMPLOYEE E1
        WHERE E1.Dno = E.Dno
    );
    