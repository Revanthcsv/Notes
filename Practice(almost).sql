CREATE TABLE EmployeeDemographics
(EmployeeID int,
FirstName varchar(50),
LastName varchar(50),
Age int,
Gender varchar(50))

CREATE TABLE EmployeeSalary
(EmployeeID int,
JobTitle varchar(50),
Salary int)

INSERT INTO EmployeeDemographics VALUES
(1001,'Jim','Halpert',30,'Male')

INSERT INTO EmployeeDemographics VALUES
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

INSERT INTO EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)

SELECT FirstName 
FROM EmployeeDemographics

SELECT *
FROM EmployeeDemographics

SELECT TOP 5*
FROM EmployeeDemographics

SELECT DISTINCT(Gender)
FROM EmployeeDemographics

SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'jim'

SELECT *
From EmployeeDemographics
WHERE Age >=30 AND Gender ='Male'

SELECT *
From EmployeeDemographics
WHERE Age >=30 OR Gender ='Male'

SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%'

SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL

SELECT *
From EmployeeDemographics
WHERE FirstName IN ('JIM','Michael')

SELECT Gender,Age,COUNT(Gender),count(Age)
FROM EmployeeDemographics
GROUP BY Gender,Age

SELECT Age,count(Age)
FROM EmployeeDemographics
GROUP BY Age

SELECT Gender,COUNT(Gender)
FROM EmployeeDemographics
WHERE Age >29
GROUP BY Gender
ORDER BY GENDER DESC

SELECT *
FROM EmployeeDemographics
ORDER BY Age,FirstName ASC

Insert into EmployeeDemographics VALUES
(1011, 'Ryan', 'Howard', 26, 'Male'),
(NULL, 'Holly', 'Flax', NULL, NULL),
(1013, 'Darryl', 'Philbin', NULL, 'Male')

SELeCT *
FROM EmployeeDemographics
INNER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELeCT *
FROM EmployeeDemographics
FULL OUTER JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
 
INSERT INTO EmployeeSalary VALUES
(1010,NULL,47000),(NULL,Salesman,43000)

SELECT EmployeeDemographics.EmployeeID,FirstName,LastName,JobTitle,Salary
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE FirstName<>'Michael'
ORDER BY Salary DESC

SELECT JobTitle,AVg(Salary)
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
Where JobTitle='salesman'
GROUP BY JobTitle

CREATE TABLE WareHouseEmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)

INSERT INTO WareHouseEmployeeDemographics VALUES
(1013, 'Darryl', 'Philbin', NULL, 'Male'),
(1050, 'Roy', 'Anderson', 31, 'Male'),
(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
(1052, 'Val', 'Johnson', 31, 'Female')

SELECT *
FROM EmployeeDemographics
FULL outer join WareHouseEmployeeDemographics
ON EmployeeDemographics.EmployeeID=WareHouseEmployeeDemographics.EmployeeID

SELECT *
FROM EmployeeDemographics
union ALL
SELECT*
FROM WareHouseEmployeeDemographics

SELECT FirstName,LastName,Age,
CASE
    WHEN Age>30 THEN 'OLD'
	WHEN Age betweeN 27 AND 30 Then 'YOUNG' 
	ELSE 'BABY'
	END
FROM EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

SELECT FirstName,LastNAme,JobTitle,Salary,
CASE 
    WHEN JobTitle='Salesman' THEN Salary+(Salary*.10)
	WHEN JobTitle='Accountant' THEN Salary+(Salary*.5)
	WHEN JobTitle='HR' THEN Salary+(Salary*.3)
	ELSE Salary+(Salary*0.1)
	END as NEWSALARY
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

SELECT JobTitle,COUNT(JobTitle)
FROM EmployeeDemographics
JOIN EmployeeSalary
on EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
GROUP BY JobTitle
HAVING COUNT(JobTitle)>1

UPDATE EmployeeDemographics
SET Age=31,Gender='Female'
WHERE FirstName='Holly'

DELETE From EmployeeDemographics
WHERE EmployeeID=1005

SELECT FirstName+''+LastName AS FullName
FROM EmployeeDemographics

SELECT EMPLOYEEID
FROM EmployeeDemographics as ed

SELECT FirstName,LastName,Gender,Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID

WITH CTE_Employee as
(SELECT FirstName,LastName,Gender,Salary,
COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM EmployeeDemographics
JOIN EmployeeSalary
ON EmployeeDemographics.EmployeeID=EmployeeSalary.EmployeeID
WHERE Salary >'45000')

SELECT*
FROM CTE_Employee

CREATE TABLE #temp_Employee(
EmployeeID int,
JobTitle varchar(100),
Salary int
)
Insert into #temp_employee values (
'1001', 'HR', '45000'
)
Insert into #temp_Employee 
SELECT *
FROM EmployeeSalary


Create table #temp_employee2 (
EmployeeID int,
JobTitle varchar(100),
Salary int
)
DROP TABLE IF EXISTS #temp_employee3
Create table #temp_employee3 (
JobTitle varchar(100),
EmployeesPerJob int ,
AvgAge int,
AvgSalary int
)
Insert into #temp_employee3
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by Jo bTitle

Select * 
From #temp_employee3

CREATE TABLE EmployeeErrors (
EmployeeID varchar(50)
,FirstName varchar(50)
,LastName varchar(50)
)

Insert into EmployeeErrors Values 
('1001  ', 'Jimbo', 'Halbert')
,('  1002', 'Pamela', 'Beasely')
,('1005', 'TOby', 'Flenderson - Fired')

Select lTRIM(EmployeeID)
From Employeeerrors
TRIM,LTRIM,RTRIM

SELECT REPLACE(LastName,'- Fired','')
FROM EmployeeErrors

SELECT SUBSTRING(FirstName,1,3)
FROM EmployeeErrors

SELECT SUBSTRING(EmployeeErrors.FirstName,1,3),SUBSTRING(EmployeeDemographics.FirstName,1,3)
FROM EmployeeErrors
join EmployeeDemographics
on SUBSTRING(EmployeeErrors.FirstName,1,3)=SUBSTRING(EmployeeDemographics.FirstName,1,3)

SELECT FirstName,LOWER(FirstName)
From EmployeeErrors

SELECT FirstName,UPPER(FirstName)
From EmployeeDemographics

CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics

exec TEsT


DROP PROCEDURE IF EXISTS Temp_E
CREATE PROCEDURE Temp_E
AS
DROP TABLE IF EXISTS #temp_employee
CREATE table #temp_employee
(JobTitle varchar(100),
Employeesperjob int,
Avgage int,
AvgSalary int)

insert into #temp_employee
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

Select *
FROM #temp_employee

exec temp_e

----EXTRA-------

DROP PROCEDURE IF EXISTS Temp_E

CREATE PROCEDURE Temp_EE
@JobTitle nvarchar(100)
AS
DROP TABLE IF EXISTS #temp_empl
CREATE table #temp_empl
(JobTitle varchar(100),
Employeesperjob int,
Avgage int,
AvgSalary int)

insert into #temp_empl
SELECT JobTitle, Count(JobTitle), Avg(Age), AVG(salary)
FROM EmployeeDemographics emp
JOIN EmployeeSalary sal
	ON emp.EmployeeID = sal.EmployeeID
WHERE JobTitle=@JobTitle
group by JobTitle

Select *
FROM #temp_empl

exec temp_ee @JobTitle='salesman'



Select EmployeeID, JobTitle, Salary
From EmployeeSalary

-- Subquery in Select

Select EmployeeID, Salary, (Select AVG(Salary) From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

-- How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

-- Why Group By doesn't work
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmployeeID, Salary
order by EmployeeID


-- Subquery in From

Select a.EmployeeID, AllAvgSalary
From 
	(Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
	 From EmployeeSalary) a
Order by a.EmployeeID


-- Subquery in Where


Select EmployeeID, JobTitle, Salary
From EmployeeSalary
where EmployeeID in (
	Select EmployeeID 
	From EmployeeDemographics
	where Age > 30)




