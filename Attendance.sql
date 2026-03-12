#Perform the following:
#Rename the table dept as department

create database Test1;
use Test1;

show databases;

create table Dept(
DEPTNO int PRIMARY KEY,
DNAME varchar(10),
LOC varchar(10)
);




#Rename table dept as department.

rename table dept to department;


alter table department
ADD PINCODE int;

#Add column PINCODE

alter table department
modify column PINCODE int not null default 0;

#change DNAME to DEPT_NAME

alter table department 
change DNAME DEPT_NAME varchar(20);

#Change the data type of column LOC to Char
alter table department modify LOC Char(20);

#Drop the table department
drop table department;

select * from departments


