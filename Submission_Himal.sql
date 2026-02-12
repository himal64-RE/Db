create database schooldb;
drop database schooldb;
show databases;

create database test;
use test;

create table Persons(
PersonID int,
Fname varchar(100),
Lname varchar(100),
Address varchar(100),
Age int,
City varchar(100)
);

create table test_table as 
	SELECT Fname, Lname
    FROM Persons;


alter table Persons
add Email varchar(100);

alter table Persons
add constraint PK_persons Primary key (PersonID);

insert into Persons(PersonID,Fname,Lname,Address,Age,City)values('1','Himal','Adhikari','Dhunchepakha','18','Bhaktapur');
insert into Persons(PersonID,Fname,Lname,Address,Age,City)values('2','Tanka','Adhikari','Dhunchepakha','45','Bhaktapur');
insert into Persons(PersonID,Fname,Lname,Address,Age,City)values('3','Chitrakala','Chauhan','Dhunchepakha','45','Bhaktapur');

select * from Persons;

select fname from Persons where lname='Adhikari';

update Persons
set age = 19
where PersonID =1;


create table Orders(
OrderID int Primary Key,
CustomerID int,
OrderDate Date


);

create table Customers(
CustomerID int Primary Key,
CustomerName varchar(100),
ContactName varchar(100),
Country varchar(100)
);

insert into Orders(OrderID,CustomerID,OrderDate)values('10308','2','1996-09-18');
insert into Orders(OrderID,CustomerID,OrderDate)values('10309','37','1996-09-19');
insert into Orders(OrderID,CustomerID,OrderDate)values('10310','77','1996-09-20');


insert into Customers(CustomerID,CustomerName,ContactName,Country)values('1','Alfreds FutterKiste','Maria Andres','Germany');


insert into Customers(CustomerID,CustomerName,ContactName,Country)values('2','Ana Trujillo Emparedados y helados','Ana Trujillo','Mexico');
insert into Customers(CustomerID,CustomerName,ContactName,Country)values('3','Antonio Moreno Taquria','Antonio Moreno','Mexico');

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

