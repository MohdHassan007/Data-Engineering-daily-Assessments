CREATE DATABASE School;
USE School;
CREATE TABLE Student (
    ROLL_NO INT,
    NAME VARCHAR(50),
    AGE INT,
    COURSE_ID INT,
    PRIMARY KEY (ROLL_NO)
);

CREATE TABLE StudentCourse (
    ROLL_NO INT,
    COURSE_ID INT,
    PRIMARY KEY (ROLL_NO, COURSE_ID),
    FOREIGN KEY (ROLL_NO) REFERENCES Student(ROLL_NO)
);

CREATE TABLE Employee (
    Emp_id INT,
    Emp_name VARCHAR(50),
    Dept_id INT,
    PRIMARY KEY (Emp_id)
);

CREATE TABLE Department (
    Dept_id INT,
    Dept_name VARCHAR(50),
    PRIMARY KEY (Dept_id)
);

INSERT INTO Student (ROLL_NO, NAME, AGE, COURSE_ID) VALUES
(1, 'Amit Kumar', 20, 101),
(2, 'Priya Sharma', 21, 102),
(3, 'Rahul Verma', 22, 103),
(4, 'Neha Singh', 20, 101),
(5, 'Sandeep Reddy', 23, 104),
(6, 'Anjali Kapoor', 21, 102),
(7, 'Raj Patel', 22, 105),
(8, 'Pooja Gupta', 20, 103),
(9, 'Vikram Singh', 23, 104),
(10, 'Sneha Sharma', 21, 105);

-- Insert 10 entries in the Employee table
INSERT INTO Employee (Emp_id, Emp_name, Dept_id) VALUES
(101, 'Suresh Kumar', 1),
(102, 'Neha Gupta', 2),
(103, 'Rajesh Sharma', 1),
(104, 'Anita Singh', 3),
(105, 'Vikas Verma', 2),
(106, 'Preeti Reddy', 3),
(107, 'Alok Kapoor', 1),
(108, 'Meera Patel', 2),
(109, 'Kiran Gupta', 3),
(110, 'Arjun Singh', 1);

-- Insert 3 entries in the Department table
INSERT INTO Department (Dept_id, Dept_name) VALUES
(1, 'IT Department'),
(2, 'HR Department'),
(3, 'Finance Department');

INSERT INTO StudentCourse (ROLL_NO, COURSE_ID) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 101),
(5, 104),
(6, 102),
(7, 105),
(8, 103),
(9, 104),
(10, 105);

SELECT Student.COURSE_ID, Student.NAME, Student.AGE 
FROM Student
INNER JOIN StudentCourse
ON Student.ROLL_NO = StudentCourse.ROLL_NO;


SELECT Student.NAME, StudentCourse.COURSE_ID 
FROM Student
LEFT JOIN StudentCourse 
ON StudentCourse.ROLL_NO = Student.ROLL_NO;


SELECT Student.NAME, StudentCourse.COURSE_ID 
FROM Student
RIGHT JOIN StudentCourse 
ON StudentCourse.ROLL_NO = Student.ROLL_NO;


SELECT  StudentCourse.COURSE_ID 
FROM Student
FULL JOIN StudentCourse 
ON StudentCourse.ROLL_NO = Student.ROLL_NO;


SELECT Employee.Emp_id, Employee.Emp_name, Employee.Dept_id, Department.Dept_name
FROM Employee
NATURAL JOIN Department;



SELECT *
FROM Employee
INNER JOIN Department ON Employee.Dept_id = Department.Dept_id;

SELECT e1.Emp_name AS Employee1, e2.Emp_name AS Employee2
FROM Employee e1
INNER JOIN Employee e2 ON e1.Dept_id = e2.Dept_id
WHERE e1.Emp_id <> e2.Emp_id;

-- Joins with GROUP BY and HAVING:
SELECT Department.Dept_name, COUNT(Employee.Emp_id) AS EmployeeCount
FROM Department
LEFT JOIN Employee ON Department.Dept_id = Employee.Dept_id
GROUP BY Department.Dept_name
HAVING EmployeeCount > 2;

-- Subquery
SELECT Emp_name
FROM Employee
WHERE Dept_id IN (SELECT Dept_id FROM Department WHERE Dept_name = 'IT Department');

-- using EXISTS
SELECT Emp_name
FROM Employee
WHERE EXISTS (SELECT 1 FROM Department WHERE Dept_id = Employee.Dept_id);

-- using any and all
SELECT Emp_name
FROM Employee
WHERE Dept_id = ANY (SELECT Dept_id FROM Department WHERE Dept_name = 'IT Department');

-- UNION
SELECT Emp_name FROM Employee WHERE Dept_id = 1
UNION
SELECT Emp_name FROM Employee WHERE Dept_id = 2;

-- intersect
SELECT Emp_name FROM Employee WHERE Dept_id = 1
INTERSECT
SELECT Emp_name FROM Employee WHERE Dept_id = 2;

-- EXCEPT
SELECT Emp_name FROM Employee WHERE Dept_id = 1
EXCEPT
SELECT Emp_name FROM Employee WHERE Dept_id = 2;

-- MErge
MERGE INTO Employee AS target
USING (SELECT Emp_id, Emp_name, Dept_id FROM Temp_Employee) AS source
ON target.Emp_id = source.Emp_id
WHEN MATCHED THEN
    UPDATE SET target.Emp_name = source.Emp_name, target.Dept_id = source.Dept_id
WHEN NOT MATCHED THEN
    INSERT (Emp_id, Emp_name, Dept_id) VALUES (source.Emp_id, source.Emp_name, source.Dept_id);




select ascii('CB');

select char(66); /*return ascii value to character*/

select len('Microsift sql');/*return length*/

select lower('JHON');/*convert to lowercase*/

select replace('Microsoft sql','sql','server');/*replace*/

select reverse('python');/*reverse the string */

select upper('yourname');/*converts to upper*/

select str(136.564,8,4);/*STR(number, length, decimals)*/
 
/* Date Functions*/
select  getdate ();/*get current date and time*/

select dateadd (mm, 2, '2023-12-07');/*add months to existed date */

select datediff ( year, convert (datetime, '2006-05-06'), convert ( datetime, '2009-01-01'));/*it will return the difference of date,months,years also*/

select datepart (mm, '2008-5-22');/*return months value*/

select day ( '2023-05-30');/*return value of date of that particular day*/

select month ('2023-05-31');/*return month value*/

select year ( '2023-05-3');/*return year value*/
 
/*Mathematical Functions*/
select abs(-101);/*returns absolute value*/

select sin(1.5);/*returns angle in radians*/

select ceiling(14.01);/*returns the smallest or greater to the specified value*/

select exp(4.5);/*returns the exponencial value*/

select floor(14.75);

select log(5.4);/*return logarithmic value*/
