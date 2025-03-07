CREATE DATABASE Quiz2;

/* Table 1 */
CREATE TABLE EmpTab(
	EmpNo INT PRIMARY KEY,
	EName VARCHAR(50) NOT NULL,
	Job VARCHAR(50) NOT NULL,
	MGR INT ,
	HireDate VARCHAR(50) NOT NULL,
	Sal INT ,
	Com INT,
	DeptNo INT
);

INSERT INTO EmpTab VALUES ('7839', 'King' , 'President', '    ', '17-NOV-81', '5000' ,'    ', '10');
INSERT INTO EmpTab VALUES ('7698', 'Blake', 'Manager'  , '7839', '01-MAY-81', '2850' ,'    ', '30');
INSERT INTO EmpTab VALUES ('7782', 'Clark', 'Manager'  , '7839', '09-JUN-81', '2450' ,'    ', '10');
INSERT INTO EmpTab VALUES ('7566', 'Jones' , 'Manager' , '7839', '02-APR-81', '2975' ,'    ', '20');
INSERT INTO EmpTab VALUES ('7654', 'Martin', 'Salesman', '7698', '28-SEP-81', '1250' ,'1400', '30');
INSERT INTO EmpTab VALUES ('7499', 'Alen'  , 'Salesman', '7698', '20-FEB-81', '1600' ,' 300', '30');
INSERT INTO EmpTab VALUES ('7844', 'Turner', 'Salesman', '7698', '08-SEP-81', '1500' ,'   0', '30');
INSERT INTO EmpTab VALUES ('7900', 'James' , 'Clerk'   , '7698', '03-DEC-81', '950 ' ,'    ', '30');
INSERT INTO EmpTab VALUES ('7521', 'Ward'  , 'Salesman', '7698', '22-FEB-81', '1250' ,' 500', '30');
INSERT INTO EmpTab VALUES ('7902', 'Ford'  , 'Analyst' , '7566', '03-DEC-81', '3000' ,'    ', '20');
INSERT INTO EmpTab VALUES ('7369', 'Smith' , 'Clerk'   , '7902', '17-DEC-80', '800 ' ,'    ', '20');
INSERT INTO EmpTab VALUES ('7788', 'Scott' , 'Analyst' , '7566', '09-DEC-82', '3000' ,'    ', '20');
INSERT INTO EmpTab VALUES ('7876', 'Adams' , 'Clerk'   , '7788', '12-JAN-83', '1100' ,'    ', '20');
INSERT INTO EmpTab VALUES ('7934', 'Miller', 'Clerk'   , '7782', '23-JAN-82', '1300' ,'    ', '10');

SELECT * FROM EmpTab;

/* Table 2 */
CREATE TABLE Dept(
	DeptNo INT PRIMARY KEY ,
	DName VARCHAR (50) NOT NULL,
	Loc VARCHAR (50) NOT NULL
);

INSERT INTO Dept VALUES ('10', 'Accounting' , 'NewYork');
INSERT INTO Dept VALUES ('20', 'Research'   , 'Dallas' );
INSERT INTO Dept VALUES ('30', 'Sales'      , 'Chicago');
INSERT INTO Dept VALUES ('40', 'Operations' , 'Boston' );

SELECT * FROM Dept;

/* Table 3 */
CREATE TABLE SalGrade(
	Grade INT PRIMARY KEY,
	LoSal INT NOT NULL,
	HiSal INT NOT NULL
);

INSERT INTO SalGrade VALUES ('1', ' 700' , '1200');
INSERT INTO SalGrade VALUES ('2', '1201' , '1400');
INSERT INTO SalGrade VALUES ('3', '1401' , '2000');
INSERT INTO SalGrade VALUES ('4', '2001' , '3000');
INSERT INTO SalGrade VALUES ('5', '3001' , '9999');

SELECT * FROM SalGrade;

/* Part 2 */
/* Display only james */
SELECT * FROM EmpTab WHERE EName = 'James';

/* Display the data of Employees whose name has ‘a’ on its second position */
SELECT * FROM EmpTab
WHERE EName LIKE '_a%';

/* Display the data of Employees whose JOB ends with ‘MAN’. */
SELECT * FROM EmpTab 
WHERE Job LIKE '%MAN';

/*Display the data of Employees whose name starts with ‘A’.*/
SELECT * FROM EmpTab
WHERE EName LIKE 'A%';

/*Display the list of employees where department id is not equal to 30. (Using <> operator).*/
SELECT * FROM EmpTab 
WHERE DeptNo <> 30;

/*Select the list of employees that work in department 10 and 30. */
SELECT * FROM EmpTab
WHERE DeptNo = 10 OR DeptNo = 30;

/*. Select the data of employees where commission is known and salary lies in the range 1200
and 4700.*/
SELECT * FROM EmpTab
WHERE Com IS NOT NULL
AND Sal BETWEEN 1200 AND 4700;

/*Select the data of employees where commission is unknown*/
SELECT * FROM EmpTab
WHERE Com = 0;


/*Display the list of employees whose employee id lies in 7566 and 7900 and salary is greater
than 3700*/
SELECT * FROM EmpTab
WHERE EmpNo BETWEEN 7566 AND 7900
AND Sal > 3700;
SELECT * FROM EmpTab ;

/*Write a query which will retrieve the values of job of all employees getting job in employee
table without any repeats job title.*/
SELECT DISTINCT Job
FROM EmpTab;

/*Write a SQL query to display the department ID followed by department name that is
holding the location Chicago. */
SELECT DeptNo,DName FROM Dept
WHERE Loc = 'Chicago';

/*Write a SQL query to give the higher grade salary since 1400.*/
SELECT * FROM SalGrade
WHERE LoSal > 1400;
Select * from EmpTab;

/* Write a SQL query to show all the department number data of MGR 7698 except the job
title Clerk */
SELECT DeptNo
FROM EmpTab
WHERE MGR = 7698
  AND Job != 'Clerk';

/*Write a SQL query to display all employee names where employee salary is less than 1500 or
exclude those employee names whose hiring date is on or greater than 2nd April, 81 and
employee id is below 7566. (DATE - format YYYY-MM-DD)*/
SELECT EName
FROM EmpTab
WHERE Sal < 1500
 OR (HireDate < '1981-04-02' AND EmpNo >= 7566);

 /*Write a SQL statement to display all the employee names which are either
 belongs to the unknown community or not had a salary above 1500.*/
SELECT EName FROM EmpTab 
WHERE Com IS NULL
OR Sal <= 1500;
SELECT * FROM EmpTab;

/*Display the names of Employees who have hiring date 09-June-81. */
SELECT EName FROM EmpTab
WHERE HireDate = '09-JUN-81';
                                 /*Lab 5 */
/*. Find the highest, lowest, sum, and average salary of all employees. Label the columns Maximum, Minimum,
Sum, and Average, respectively. Round your results to the nearest whole number.*/
SELECT
    (MAX(Sal)) AS Maximum,
    (MIN(Sal)) AS Minimum,
    (SUM(Sal)) AS Sum,
    (AVG(Sal)) AS Average
FROM EmpTab;

/*Modify the above query to display the minimum, maximum, sum, and average salary for each job type.*/
SELECT Job,
    (MIN(Sal)) AS Minimum,
    (MAX(Sal)) AS Maximum,
    (SUM(Sal)) AS Sum,
    (AVG(Sal)) AS Average
FROM EmpTab
GROUP BY Job;

/*Write a query to display the number of people with the same job*/
SELECT Job, COUNT(*) AS NumberOfPeople
FROM EmpTab
GROUP BY Job;

/*Determine the number of managers without listing them. Label the column Number of Managers. Hint: Use
the MANAGER_ID column to determine the number of managers*/
SELECT COUNT(DISTINCT MGR) AS NumberOfManagers
FROM EmpTab
WHERE MGR IS NOT NULL;

/*Find the difference between the highest and lowest salaries. Label the column DIFFERENCE.*/
SELECT (MAX(Sal)) - (MIN(Sal)) AS DIFFERENCE
FROM EmpTab;

/*Display number of employees work in each department*/
SELECT DeptNo, COUNT(*) AS NumberOfEmployees
FROM EmpTab
GROUP BY DeptNo;

/* Display total salary paid to employees work in each department.*/
SELECT DeptNo, SUM(Sal) AS TotalSalary
FROM EmpTab
GROUP BY DeptNo;

/*Display number of employees, total salary paid to employees work in each department.*/
SELECT DeptNo,
       COUNT(*) AS NumberOfEmployees,
       SUM(Sal) AS TotalSalary
FROM EmpTab
GROUP BY DeptNo;

/*Display the department No, job, total salary paid to employees group by department_id, job_id*/
SELECT DeptNo, Job, SUM(Sal) AS TotalSalary
FROM EmpTab
GROUP BY DeptNo, Job;

/*Display the department no, number of employees of those groups that have more than 2 employees.*/
SELECT DeptNo, COUNT(*) AS NumberOfEmployees
FROM EmpTab
GROUP BY DeptNo
HAVING COUNT(*) > 2;
SELECT * FROM EmpTab;
