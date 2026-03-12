#Tech solutions pvt. ltd.

# Employees
# Departments
# Projects


CREATE DATABASE TechSolutionsDB;
USE TechSolutionsDB;

-- Departments table
CREATE TABLE departments(
DeptID INT PRIMARY KEY,
DeptName VARCHAR(25) NOT NULL,
Location VARCHAR(25)
) ENGINE=InnoDB;

-- Employee table
CREATE TABLE employee(
EmpID INT PRIMARY KEY,
FirstName VARCHAR(25),
LastName VARCHAR(25),
Gender CHAR(1),
Salary DOUBLE,
HireDate DATE,
DeptID INT,
FOREIGN KEY (DeptID)
REFERENCES departments(DeptID)
) ENGINE=InnoDB;

-- Projects table
CREATE TABLE projects(
ProjectID INT PRIMARY KEY,
ProjectName VARCHAR(25),
StartDate DATE,
EndDate DATE,
Budget DOUBLE
) ENGINE=InnoDB;

-- Works_on table
CREATE TABLE works_on(
EmpID INT,
ProjectID INT,
HoursWorked TIME,
PRIMARY KEY (EmpID, ProjectID),
FOREIGN KEY (EmpID) REFERENCES employee(EmpID),
FOREIGN KEY (ProjectID) REFERENCES projects(ProjectID)
) ENGINE=InnoDB;

INSERT INTO departments VALUES
(1,'Human Resources','New York'),
(2,'Software Development','London'),
(3,'Marketing','Toronto'),
(4,'Finance','Sydney'),
(5,'IT Support','Berlin');

INSERT INTO employee VALUES
(101,'John','Smith','M',55000,'2022-03-15',2),
(102,'Emma','Johnson','F',60000,'2021-07-10',1),
(103,'Michael','Brown','M',72000,'2020-11-05',2),
(104,'Sophia','Davis','F',48000,'2023-01-20',3),
(105,'Daniel','Wilson','M',65000,'2019-09-12',4);

INSERT INTO projects VALUES
(201,'Website Development','2024-01-01','2024-06-30',150000),
(202,'Mobile App','2024-02-15','2024-08-15',200000),
(203,'Marketing Campaign','2024-03-01','2024-05-30',80000),
(204,'Financial System','2024-04-10','2024-10-20',120000),
(205,'IT Infrastructure','2024-05-05','2024-12-01',175000);

INSERT INTO works_on VALUES
(101,201,'04:30:00'),
(102,203,'03:45:00'),
(103,202,'05:15:00'),
(104,203,'02:30:00'),
(105,204,'06:00:00');

# Update the salary of an employee whose EmpID = 102 by increasing it by 10%

UPDATE employee
SET Salary = Salary * 1.10
WHERE EmpID = 102;

# Delete a project whose ProjectID = 5

DELETE from projects
WHERE ProjectID = 5;

# Display all employees who earn more than 50,000

SELECT *
FROM employee
WHERE Salary > 50000;

# Display FirstName, LastName, Salary of emploeyes sorted by Salary in descending order.
Select FirstName,LastName, Salary from employee order by Salary DESC;

# Display employees who belong to the IT department.
SELECT E.EmpID, E.FirstName, E.LastName, D.DeptName
FROM employee E
JOIN departments D ON E.DeptID = D.DeptID
WHERE D.DeptName = 'IT';


# Show the total number of employees in each department.
SELECT D.DeptID, COUNT(*) AS TotalEmployees
FROM employee E
JOIN departments D ON E.DeptID = D.DeptID
WHERE D.DeptName = 'IT'
GROUP BY D.DeptID;

# Display the employees who were hired after January 1, 2022.
SELECT *
FROM employee
WHERE HireDate > '2022-01-01';

# Display employee names along with their department names.
SELECT E.FirstName, E.LastName, D.DeptName
FROM employee E
JOIN departments D ON E.DeptID = D.DeptID;

# Show employees and the projects they are working on.
SELECT 
E.FirstName,
E.LastName,
P.ProjectName
FROM employee E
JOIN works_on W ON E.EmpID = W.EmpID
JOIN projects P ON W.ProjectID = P.ProjectID;

# Find the average salary of employees in each department.
SELECT 
D.DeptName,
AVG(E.Salary) AS AvgSalary
FROM employee E
JOIN departments D ON E.DeptID = D.DeptID
GROUP BY D.DeptName;

# Display the department with the highest number of employees.
SELECT D.DeptName, COUNT(E.EmpID) AS TotalEmployees
FROM employee E
JOIN departments D ON E.DeptID = D.DeptID
GROUP BY D.DeptName
ORDER BY TotalEmployees DESC
LIMIT 1;

# Find employees whose salary is greater than the average salary of all employees.
SELECT EmpID, FirstName, LastName, Salary
FROM employee
WHERE Salary > (SELECT AVG(Salary) FROM employee);

# Create a view wnamed HighSalaryEmployees that shows employees with salary greater than 60,000

CREATE VIEW HighSalaryEmployees AS
SELECT EmpID, FirstName, LastName, Salary, DeptID
FROM employee
WHERE Salary > 60000;

# Create an index on the LastName column of the Employee table.
CREATE INDEX idx_LastName
ON employee (LastName);










SELECT E.FirstName
FROM employee E
JOIN works_on W ON E.EmpID = W.EmpID;



