#1. Create a db named dbemp and switch to it.
#2. Create an employee table with appropriate data types and constaints for employee details.

create database dbemp;
use dbemp;

create table employee(
EmpID int NOT NULL PRIMARY KEY,
FirstName varchar(20),
LastName varchar(20),
Gender char(1),
DateOfBirth DATE,
Designation varchar(50),
DepartmentName varchar(20),
ManagerID varchar(20),
JoinedDate DATE,
EmpSalary decimal(10,0),
EmpAddress varchar(200)

);
#3. Insert at least two emloyee records into the employee table

insert into employee(
EmpId,FirstName,LastName,Gender,DateOfBirth,Designation,DepartmentName,ManagerID,JoinedDate,EmpSalary,EmpAddress)
VALUES('001','Himal','Adhikari','M','2007-06-17','Engineer','Software Engineering','0005','2022-04-01','500000','Sanothimi-Bhaktapur')
,('002','Ram','Thapa','M','2009-06-17','Engineer','Software Engineering','0007','2022-04-05','5250000','Lokanthali-Bhaktapur');


select*from employee;

