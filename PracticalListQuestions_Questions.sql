USE student_society;

-- QUESTIONS

-- QUESTION 1
SELECT StudentName
FROM student
WHERE Roll_No IN (SELECT RollNo FROM enrollment);

-- QUESTION 2
SELECT SocName 
FROM society;

-- QUESTION 3

SELECT StudentName
FROM student
WHERE StudentName LIKE "A%";

-- QUESTION 4

SELECT *
FROM student
WHERE Course IN ("CS", "Chemistry");

-- QUESTION 5

SELECT StudentName
FROM student
WHERE Roll_No LIKE "X%9" OR Roll_No LIKE "Z%9";

-- QUESTION 6

DELIMITER $$
CREATE PROCEDURE society_seats(IN seats INT)
BEGIN
SELECT *
FROM society WHERE TotalSeats > seats;
END $$
DELIMITER ;

CALL society_seats(15);

-- QUESTION 7

UPDATE society
SET MentorName = "Mrs. Mehta"
WHERE SocID = "S3";

-- QUESTION 8

SELECT society.SocName
FROM society
INNER JOIN enrollment
ON society.SocID = enrollment.SID
GROUP BY society.SocID
HAVING COUNT(enrollment.RollNo) > 5;

-- QUESTION 9

SELECT student.StudentName
FROM student
INNER JOIN enrollment
ON student.Roll_No = enrollment.RollNo
WHERE enrollment.SID = "S3"
ORDER BY DOB DESC
LIMIT 1;

-- QUESTION 10

SELECT society.SocName
FROM society
INNER JOIN enrollment
ON society.SocID = enrollment.SID
GROUP BY enrollment.SID
ORDER BY COUNT(enrollment.RollNo) DESC
LIMIT 1;

-- QUESTION 11

SELECT society.SocName, COUNT(enrollment.RollNo)
FROM society
INNER JOIN enrollment
ON society.SocID = enrollment.SID
GROUP BY enrollment.SID
ORDER BY COUNT(enrollment.RollNo)
LIMIT 1;

-- QUESTION 12

SELECT *
FROM student
WHERE Roll_No NOT IN (SELECT RollNo FROM enrollment);

-- QUESTION 13

SELECT student.StudentName
FROM student
INNER JOIN enrollment
ON student.Roll_No = enrollment.RollNo
GROUP BY enrollment.RollNo
HAVING COUNT(enrollment.SID) >= 2;

-- QUESTION 14

SELECT society.SocName 
FROM society
JOIN enrollment ON society.SocID = enrollment.SID 
GROUP BY society.SocID
HAVING COUNT(enrollment.RollNo) = (
    SELECT MAX(student_count) 
    FROM (SELECT COUNT(enrollment.RollNo) AS student_count 
          FROM enrollment
          GROUP BY enrollment.SID) subquery
);

-- QUESTION 15

SELECT DISTINCT(StudentName)
FROM student
INNER JOIN enrollment
ON student.Roll_No = enrollment.RollNo
UNION
SELECT DISTINCT(SocName)
FROM society
INNER JOIN enrollment
ON society.SocID = enrollment.SID;

-- QUESTION 16

SELECT DISTINCT(StudentName)
FROM student
INNER JOIN enrollment ON student.Roll_No = enrollment.RollNo
INNER JOIN society ON society.SocID = enrollment.SID
WHERE society.SocName IN ('Debating', 'Dancing', 'Sashakt');

-- QUESTION 17

SELECT SocName
FROM society
WHERE MentorName LIKE "%Gupta%";

-- QUESTION 18

SELECT society.SocName
FROM society
LEFT JOIN enrollment ON society.SocID = enrollment.SID
GROUP BY society.SocID, society.TotalSeats
HAVING COUNT(enrollment.RollNo) = 0.1 * society.TotalSeats;

-- QUESTION 19

SELECT society.SocName, (society.TotalSeats - count(enrollment.RollNo)) AS "Vacent Seats"
FROM society
LEFT JOIN enrollment
ON society.SocID = enrollment.SID 
GROUP BY society.SocID;

-- question 20

UPDATE society
SET TotalSeats = TotalSeats + (TotalSeats * 0.1);

-- QUESTION 21

ALTER TABLE enrollment
ADD COLUMN EnrollmentFeesPaid ENUM('Yes', 'No') DEFAULT "No";

SELECT * FROM enrollment;

-- QUESTION 22

UPDATE enrollment
SET DateOfEnrollment = CASE
WHEN SID = "S1" THEN "2018-01-15"
WHEN SID = "S2" THEN CURRENT_DATE()
WHEN SID = "S3" THEN "2018-01-02"
ELSE DateOfEnrollment
END;

SELECT * FROM enrollment;

-- QUESTION 23

CREATE VIEW SocietyEnrollments AS
SELECT society.SocName, COUNT(enrollment.RollNo) AS "TotalEnrollment"
FROM society
INNER JOIN enrollment
ON society.SocID = enrollment.SID
GROUP BY enrollment.SID;

SELECT * FROM SocietyEnrollments;

-- QUESTION 24

SELECT s.StudentName 
FROM STUDENT s 
JOIN ENROLLMENT e ON s.Roll_No = e.RollNo 
GROUP BY s.Roll_No 
HAVING COUNT(DISTINCT e.SID) = (SELECT COUNT(SocID) FROM SOCIETY);

-- QUESTION 25

SELECT COUNT(SID)
FROM enrollment
GROUP BY SID
HAVING COUNT(RollNo) > 5;

-- QUESTION 26

ALTER TABLE student
ADD COLUMN MobileNo VARCHAR(10) DEFAULT '9999999999';

-- QUESTION 27

SELECT COUNT(*)
FROM student
WHERE (YEAR(CURRENT_DATE()) - YEAR(DOB)) > 20;

-- QUESTION 28

SELECT DISTINCT(student.StudentName)
FROM student
INNER JOIN enrollment
ON student.Roll_No = enrollment.RollNo
WHERE student.DOB LIKE "2001%";

-- QUESTION 29

SELECT COUNT(*)
FROM society
INNER JOIN enrollment 
ON society.SocID = enrollment.SID
WHERE SocName LIKE "S%t"
GROUP BY enrollment.SID
HAVING COUNT(enrollment.RollNo) >= 5;

-- QUESTION 30

SELECT society.SocName, society.MentorName, TotalSeats, COUNT(enrollment.RollNo) As TotalEnrolled,
 (society.TotalSeats - COUNT(enrollment.RollNo)) AS UnfilledSeats
FROM society
INNER JOIN enrollment
ON society.SocID = enrollment.SID
GROUP BY society.SocID;

