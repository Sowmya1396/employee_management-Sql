USE empManagement;
CREATE TABLE Department(
		DepartmentID   INT(3)        NOT NULL,
        DepartmentName  VARCHAR(20)  NOT NULL,
        PRIMARY KEY(DepartmentID)
        );
        
CREATE TABLE Job(
		JobID       CHAR(7)       NOT NULL,
        JobTitle    VARCHAR(30)   NOT NULL,
        PRIMARY KEY(JobID)
        );
SHOW TABLES;

CREATE TABLE Employees(
		EmpID    INT(4)      NOT NULL,
        Name    VARCHAR(20),
        Gender  ENUM('M', 'F', 'O'),
        DeptID  INT(3),
        Salary  FLOAT(7,2),
        JobID   CHAR(7),
        PRIMARY KEY  (EmpID),
        FOREIGN KEY  (DeptID) REFERENCES Department(DepartmentID),
		FOREIGN KEY	(JobID)  REFERENCES Job(JobID)
		);
        
        
        
SHOW TABLES;
DESCRIBE employees;

SHOW CREATE TABLE employees;

ALTER TABLE employees
ADD COLUMN ManagerID INT;

ALTER TABLE employees
MODIFY COLUMN Salary
FLOAT (9,2);

ALTER TABLE employees
DROP COLUMN ManagerID;

SHOW TABLES;

SHOW databases;
SELECT *
FROM Employees;

INSERT INTO department
VALUES (10, 'Administration');

INSERT INTO department (DepartmentID, DepartmentName)
VALUES (20, 'Marketing');

INSERT INTO department (DepartmentName, DepartmentID)
VALUES ('Purchasing', 30);

SELECT * FROM department;

INSERT INTO department VALUES (40, 'IT'),
			(50, 'Security');
 
 INSERT INTO Job (JobID, JobTitle)
 VALUES ('IT_PROG', 'Programer'),
        ('MK_MAN', 'Marketing Manager'),
        ('MK_ASST', 'Marketing Assistant'),
        ('PU_MAN', 'Purchasing Manager');
 COMMIT;
 
 SELECT * FROM employees;

UPDATE employee SET Salary = 12000
WHERE EmpID = 100;

SELECT * FROM employees;
 
 DELETE FROM department
 WHERE DepartmentID = 50;
SELECT * FROM department;

INSERT INTO employees (EmpID, Name, Gender, DeptID, Salary, JobID)
	VALUES 	(201,'Lex', 'M', 40, 7000, 'IT_PROG'),
                    (202,'David','M', 20, 9000, 'MK_MAN'),
                    (203,'Leena', 'F', 20, 8000, 'MK_ASST'),
                    (204,'Bruce','M', 40, 7500, 'IT_PROG'),
                    (205,'Irene','F', 20, 8500, 'MK_ASST'),
                    (206,'Laura', 'F', 30, 5000, 'PU_MAN'),
                    (207,'Nancy', 'F', 20, 8500, 'MK_ASST'),
                    (208,'Brenda', 'F', 40, 7500, 'IT_PROG');
                    
SELECT DepartmentID, DepartmentName
FROM department;		

SELECT *
FROM department;
        
SELECT JobTitle FROM job;

SELECT EmpID, DeptID, Name
FROM Employees;

SELECT EmpID, Name, Salary, Salary*0.5 AS Bonus
FROM Employees;

SELECT DISTINCT Gender FROM Employees;        
 
SELECT * FROM Employees
WHERE Salary>8000;

SELECT * FROM Employees
WHERE Gender = 'M';

SELECT * FROM Employees
WHERE DeptID = 40 AND Salary<7500;

SELECT * FROM job
WHERE JobID = 'Programmer';

/*Using like operator*/
SELECT * FROM Employees
WHERE Name LIKE 'L%';		

SELECT * FROM Employees
WHERE JobID LIKE '%ASST';
        
SELECT * FROM Employees
WHERE Name LIKE '_e%';   

SELECT * FROM Employees
WHERE Name LIKE '%er%'; 

/*USING IN, BETWEEN Operator*/
SELECT * FROM Employees
WHERE DeptID IN (10,20);   

SELECT * FROM Employees
WHERE DeptID BETWEEN 20 AND 40;

SELECT * FROM Employees
WHERE DeptID = 10 OR DeptID = 20;

SELECT * FROM Employees
WHERE Salary BETWEEN 5000 AND 8000;
 
 SELECT * FROM Employees
 WHERE Salary >=5000 AND Salary <=8000;
 
/*ORDERBY CLAUSE*/
SELECT * FROM Employees
ORDER BY Salary;

SELECT * FROM Employees
ORDER BY Name;

SELECT * FROM Employees
ORDER BY Salary DESC;

SELECT * FROM Employees
ORDER BY Salary ASC;

SELECT EmpID, Name, DeptID
FROM Employees
ORDER BY 2;

SELECT * FROM Employees
ORDER BY DeptID, Salary DESC;

SELECT * FROM Employees
ORDER BY DeptID, Salary ASC;

SELECT COUNT(*) FROM Employees;

SELECT SUM(Salary), AVG(Salary), MIN(Salary), MAX(Salary)
FROM Employees;

SELECT DeptID, SUM(Salary)
FROM Employees
GROUP BY DeptID;

SELECT * FROM Employees
WHERE JobID LIKE '%MK' AND Salary <9000 AND Gender='M';

SELECT *
FROM Employees
WHERE EmpID BETWEEN 104 AND 108;

SELECT * 
FROM Employees
ORDER BY GENDER;

SELECT COUNT(*) AS TotalEmployees
FROM Employees
WHERE DeptID = 40;

SELECT DeptID, COUNT(*) AS TotalEmployees
FROM Employees
WHERE DeptID = 40
GROUP BY DeptID;

/*TO FIND JOB WISE AVERAGE SALARY OF THE EMPLOYEESAND THEIR SALARIES IN ASCENDING ORDER*/
SELECT JobID, AVG(Salary)
FROM Employees
GROUP BY JobID
ORDER BY AVG(Salary) ASC;

/* TOP 3 HIGHEST PAID Employees*/
SELECT EmpID, Name, Salary
FROM Employees
ORDER BY Salary DESC
LIMIT 3;

/*JOINS*/

INSERT INTO Employees (EmpID, Name, Gender, DeptID, JobID, Salary)
VALUES (109, 'SMS Kumar', 'M', NULL, 'AD_PRES', 15000);

SELECT *
FROM Employees;

/*HR Wants to see the Department name of the employees along with their details. For this we need data from employee and department table to join them*/
SELECT E.EmpID, E.Name, E.Gender, E.DeptID, D.DepartmentName
FROM Employees E INNER JOIN department D
ON E.DeptID = D.DepartmentID;

/*HR Manager would like to see the Department Name of the employees along with their details of the employees working in department 20*/
SELECT E.EmpID, E.Name, E.Gender, E.DeptID, D.DepartmentName
FROM Employees E INNER JOIN department D
ON E.DeptID = D.DepartmentID
WHERE E.DeptID =20;

/*HR Manager asks for a report displaying employees department as well as job information which are residing in department and job table respectively*/
SELECT E.EmpID, E.Name, E.Gender, E.DeptID, D.DepartmentName, E.JobID, J.JobTitle
FROM Employees E INNER JOIN department D
ON E.DeptID = D.DepartmentID
INNER JOIN job J
ON E.JobID = J.JobID

/*OUTER Left JOIN*/
/*HR Manager would like to see all the employees information along with their departments data. Some employees have a department ID record associated with them and the other doesn't, but both
employees must appear in the query output*/

SELECT E.EmpID, E.Name, E.Gender, E.DeptID, D.DepartmentName
FROM Employees E LEFT OUTER JOIN department D
ON E.DeptID = D.DepartmentID;

/*OUTER RIGHT JOIN*/
SELECT E.EmpID, E.Name, E.Gender, E.DeptID, D.DepartmentName
FROM department D RIGHT OUTER JOIN Employees E
ON E.DeptID = D.DepartmentID;

/*Subqueries*/
/*HR Manager would like to see the details of the employees who are earning lesser than the employee, Bruce*/
SELECT * FROM Employees
WHERE Salary < (SELECT Salary FROM Employees
				WHERE Name = 'Bruce');

/*HR Manager would like to see the details of the employees who are earning lesser than the average salary of the department 20*/
SELECT * FROM Employees
WHERE Salary < (SELECT AVG(Salary) FROM Employees
				WHERE DeptID = 20);
                
/*HR Manager would like to see the details of the employees who are earning lesser than the average salary of their own department*/
SELECT * FROM Employees E1
WHERE Salary < (SELECT AVG(Salary) FROM Employees E2
				WHERE E2.DeptID = E1.DeptID);
			
SELECT * FROM Employees
WHERE DeptID = (SELECT DeptID FROM Employees
				WHERE Name = 'Leena' LIMIT 1)
AND Salary < (SELECT Salary FROM Employees
				WHERE Name = 'Leena' LIMIT 1);
                
/*Write an SQL command to display the details of the people who are earning lesser than the average salary of their own job*/
SELECT * FROM Employees E
WHERE Salary < (SELECT AVG(Salary) FROM Employees
				WHERE JobID = E.JobID);
