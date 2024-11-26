USE student_course;

-- QUESTION 1

SELECT StudentName
FROM student
WHERE Roll_No IN (SELECT RollNo FROM admission);

-- QUESTION 2

SELECT StudentName
FROM student
WHERE StudentName LIKE "A%";

-- QUESTION 3

SELECT *
FROM student
WHERE CourseID IN (SELECT CID FROM course WHERE CourseName IN ("Computer Science", "Chemistry"));

-- METHOD 2

SELECT student.*
FROM student 
INNER JOIN course ON student.CourseID = course.CID
WHERE course.CourseName IN ('Computer Science', 'Chemistry');

-- QUESTION 4

SELECT StudentName
FROM student
WHERE Roll_No LIKE "X%9" OR Roll_No LIKE "Z%9";

-- QUESTION 5

DELIMITER $$ 
CREATE PROCEDURE enrolled_students (IN students INT)
BEGIN
SELECT course.*, COUNT(admission.RollNo) AS EnrolledStudents
FROM admission
INNER JOIN course ON admission.CID = course.CID
GROUP BY admission.CID
HAVING COUNT(admission.RollNo) > students;
END $$
DELIMITER ;

CALL enrolled_students(1);

-- QUESTION 6

UPDATE student 
SET StudentName = "Shivam Gupta" 
WHERE Roll_No = "X12349";

-- QUESTION 7

SELECT course.CourseName
FROM admission
INNER JOIN course
ON admission.CID = course.CID
GROUP BY admission.CID
HAVING COUNT(admission.RollNo) > 5;

-- QUESTION 8

SELECT student.StudentName
FROM student
INNER JOIN course ON student.CourseID = course.CID
WHERE course.CourseName = "BSc(P)CS"
ORDER BY student.DOB DESC
LIMIT 1;

-- QUESTION 9

SELECT course.CourseName
FROM course
INNER JOIN admission
ON course.CID = admission.CID
GROUP BY course.CID
ORDER BY COUNT(admission.RollNo) DESC
LIMIT 1;

-- QUESTION 10

SELECT course.CourseName
FROM admission
INNER JOIN course ON admission.CID = course.CID
WHERE CourseType = "Parttime"
GROUP BY admission.CID
ORDER BY COUNT(admission.RollNo) DESC
LIMIT 2;

-- QUESTION 11

SELECT student.StudentName
FROM student
INNER JOIN course ON student.CourseID = course.CID
WHERE course.CourseType = "Fulltime";

-- QUESTION 12

SELECT course.CourseName
FROM course
INNER JOIN admission ON course.CID = admission.CID
GROUP BY course.CID
HAVING COUNT(admission.RollNo) >= 30;

-- QUESTION 13

SELECT StudentName, CourseName
FROM student
INNER JOIN course ON student.CourseID = course.CID
INNER JOIN admission ON student.Roll_No = admission.RollNo;

-- QUESTION 14

SELECT CourseName
FROM course
WHERE Teacher_in_charge LIKE "%GUPTA%" AND CourseType = "Fulltime";

-- QUESTION 15

SELECT CourseName
FROM course
LEFT JOIN admission ON admission.CID = course.CID
GROUP BY course.CID, course.TotalSeats
HAVING COUNT(admission.RollNo) = FLOOR(0.1 * course.TotalSeats);

-- QUESTION 16

SELECT course.CourseName, TotalSeats ,(course.TotalSeats - COUNT(admission.RollNo)) AS Vacant_seat
FROM course
LEFT JOIN admission
ON course.CID = admission.CID
GROUP BY course.CID;

-- QUESTION 17

UPDATE course
SET TotalSeats = TotalSeats + (0.1*TotalSeats);

-- QUESTION 18

ALTER TABLE admission
ADD COLUMN Fee_paid ENUM('Yes', 'No') DEFAULT "No";

SELECT * FROM admission;

-- QUESTION 19

UPDATE admission
SET DateOfAdmission = DATE_ADD(DateOfAdmission, INTERVAL 1 YEAR);

-- QUESTION 20

CREATE VIEW student_enrolled AS
SELECT course.CourseName, COUNT(admission.RollNo) AS `TotalEnrolledStudent`
FROM course
LEFT JOIN admission ON course.CID = admission.CID
GROUP BY course.CID;

SELECT * FROM student_enrolled;

-- QUESTION 21

SELECT COUNT(course.CID)
FROM course
INNER JOIN admission
ON course.CID = admission.CID
GROUP BY course.CourseType
HAVING COUNT(admission.RollNo) > 5;

-- QUESTION 22

ALTER TABLE student 
ADD COLUMN Mobile_Number VARCHAR(10) DEFAULT '9999999999';

SELECT * FROM student;

-- QUESTION 23

SELECT COUNT(*) AS TotalStudents
FROM student
WHERE (CURRENT_DATE() - DOB) > 18;

-- QUESTION 24

SELECT student.StudentName
FROM student
INNER JOIN admission ON student.Roll_No = admission.RollNo
INNER JOIN course ON course.CID = admission.CID
WHERE CourseType = "Parttime" AND YEAR(student.DOB) = '2001';

-- QUESTION 25

SELECT COUNT(*) AS CourseCount
FROM course
WHERE CourseName LIKE 'BSc%Science%';




