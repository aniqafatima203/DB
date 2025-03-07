CREATE DATABASE QuizDB3;

/* Table 1 */
CREATE TABLE EmpTb(
	EmpNo INT PRIMARY KEY,
	EName VARCHAR(50) NOT NULL,
	Job VARCHAR(50) NOT NULL,
	MGR INT ,
	HireDate VARCHAR(50) NOT NULL,
	Sal INT ,
	Com INT,
	DeptNo INT
);

INSERT INTO EmpTb VALUES ('7839', 'King' , 'President', '    ', '17-NOV-81', '5000' ,'    ', '10');
INSERT INTO EmpTb VALUES ('7698', 'Blake', 'Manager'  , '7839', '01-MAY-81', '2850' ,'    ', '30');
INSERT INTO EmpTb VALUES ('7782', 'Clark', 'Manager'  , '7839', '09-JUN-81', '2450' ,'    ', '10');
INSERT INTO EmpTb VALUES ('7566', 'Jones' , 'Manager' , '7839', '02-APR-81', '2975' ,'    ', '20');
INSERT INTO EmpTb VALUES ('7654', 'Martin', 'Salesman', '7698', '28-SEP-81', '1250' ,'1400', '30');
INSERT INTO EmpTb VALUES ('7499', 'Alen'  , 'Salesman', '7698', '20-FEB-81', '1600' ,' 300', '30');
INSERT INTO EmpTb VALUES ('7844', 'Turner', 'Salesman', '7698', '08-SEP-81', '1500' ,'   0', '30');
INSERT INTO EmpTb VALUES ('7900', 'James' , 'Clerk'   , '7698', '03-DEC-81', '950 ' ,'    ', '30');
INSERT INTO EmpTb VALUES ('7521', 'Ward'  , 'Salesman', '7698', '22-FEB-81', '1250' ,' 500', '30');
INSERT INTO EmpTb VALUES ('7902', 'Ford'  , 'Analyst' , '7566', '03-DEC-81', '3000' ,'    ', '20');
INSERT INTO EmpTb VALUES ('7369', 'Smith' , 'Clerk'   , '7902', '17-DEC-80', '800 ' ,'    ', '20');
INSERT INTO EmpTb VALUES ('7788', 'Scott' , 'Analyst' , '7566', '09-DEC-82', '3000' ,'    ', '20');
INSERT INTO EmpTb VALUES ('7876', 'Adams' , 'Clerk'   , '7788', '12-JAN-83', '1100' ,'    ', '20');
INSERT INTO EmpTb VALUES ('7934', 'Miller', 'Clerk'   , '7782', '23-JAN-82', '1300' ,'    ', '10');

SELECT * FROM EmpTb;

/* Table 2 */
CREATE TABLE Depttb(
	DeptNo INT PRIMARY KEY ,
	DName VARCHAR (50) NOT NULL,
	Loc VARCHAR (50) NOT NULL
);

INSERT INTO Depttb VALUES ('10', 'Accounting' , 'NewYork');
INSERT INTO Depttb VALUES ('20', 'Research'   , 'Dallas' );
INSERT INTO Depttb VALUES ('30', 'Sales'      , 'Chicago');
INSERT INTO Depttb VALUES ('40', 'Operations' , 'Boston' );

SELECT * FROM Depttb;

/* Table 3 */
CREATE TABLE SalGradetb(
	Grade INT PRIMARY KEY,
	LoSal INT NOT NULL,
	HiSal INT NOT NULL
);

INSERT INTO SalGradetb VALUES ('1', ' 700' , '1200');
INSERT INTO SalGradetb VALUES ('2', '1201' , '1400');
INSERT INTO SalGradetb VALUES ('3', '1401' , '2000');
INSERT INTO SalGradetb VALUES ('4', '2001' , '3000');
INSERT INTO SalGradetb VALUES ('5', '3001' , '9999');

SELECT * FROM SalGradetb;

/* Part 1: Display the employee who got the maximum salary*/
SELECT * FROM EmpTb
WHERE Sal = (SELECT MAX(Sal) FROM EmpTb);

/* Part 2: Display the employees who are working in Sales department*/
SELECT * FROM EmpTb
WHERE DeptNo = (SELECT DeptNo FROM Depttb WHERE DName = 'Sales');

/* Part 3: Display the employees who are working in “New York”*/
SELECT EName
FROM EmpTb
WHERE DeptNo = (SELECT DeptNo FROM Depttb WHERE Loc = 'NewYork');

/* Part 4: Find out no. of employees working in “Sales” department*/
SELECT COUNT(*)
FROM EmpTb
WHERE DeptNo = (SELECT DeptNo FROM Depttb WHERE DName = 'Sales');

/* Part 5: List out the employees who earn more than every employee in department 30*/
SELECT * FROM EmpTb
WHERE Sal > (SELECT MAX(Sal) FROM EmpTb WHERE DeptNo = '30');

/* Part 6: List out the employees who earn more than the lowest salary in department 30*/
SELECT * FROM EmpTb
WHERE Sal > (SELECT MIN(Sal) FROM EmpTb WHERE DeptNo = '30');

/* Part 7: Find out whose department has not employees*/
SELECT DName
FROM Depttb
WHERE DeptNo NOT IN (SELECT DeptNo FROM EmpTb);

/* Part 8: Find out which department does not have any employees*/
SELECT DName
FROM Depttb
WHERE DeptNo NOT IN (SELECT DeptNo FROM EmpTb);

/* Part 9: Find out the employees who earn greater than the average salary for their department (CoRelated Sub Query)*/
SELECT * FROM EmpTb
WHERE Sal > (SELECT AVG(Sal)
                FROM EmpTb
                WHERE EmpNo = EmpNo);
SELECT AVG(Sal) FROM EmpTb;

/*Ques 2*/
CREATE TABLE BBC(BName CHAR(20) PRIMARY KEY , 
Region CHAR(20), 
Area BIGINT, 
BPopulation BIGINT, 
Gdp BIGINT
);

INSERT INTO BBC VALUES ('Afghanistan'   , 'South Asia' , '652225' , '26000000' , NULL);
INSERT INTO BBC VALUES ('Albania'       , 'Europe'     , '28728'  , '3200000'  , '6656000000');
INSERT INTO BBC VALUES ('Algeria'       , 'Middle East', '2400000', '32900000' , '75012000000');
INSERT INTO BBC VALUES ('Andorra'       , 'Europe'     , '468'    , '64000'    , NULL);
INSERT INTO BBC VALUES ('Bangladesh'    , 'South Asia' , '143998' , '152600000', '67144000000');
INSERT INTO BBC VALUES ('United Kingdom', 'Europe'     , '242514' , '59600000' , '2022824000000');

SELECT * FROM BBC;

/* Part 10: Show the name, region and population of the smallest country in each region*/
SELECT * FROM BBC b1
WHERE Area = (SELECT MIN(Area)
              FROM BBC b2
              WHERE b1.Region = b2.Region);

/* Part 11: Show the countries with a greater GDP then any country in Europe*/
SELECT * FROM BBC
WHERE Gdp > (SELECT MAX(Gdp) FROM BBC WHERE Region = 'Europe');

/* Part 12: Show the countries with population smaller than United Kingdom but bigger than Albania*/
SELECT * FROM BBC
WHERE BPopulation < (SELECT BPopulation FROM BBC WHERE BName = 'United Kingdom')
  AND BPopulation > (SELECT BPopulation FROM BBC WHERE BName = 'Albania');