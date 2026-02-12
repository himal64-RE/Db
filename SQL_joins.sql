create database Test;

use Test;

create table employees(
id int Primary key not null,
emplopyee_name varchar(100),
department_id int);

create table departments(
department_id int Primary Key not null,
derpartment_name varchar(100));

ALTER TABLE employees
CHANGE emplopyee_name employee_name VARCHAR(100);

alter table departments
change derpartment_name department_name varchar(100);

insert into employees(id,employee_name,department_id)values('1','Homer Simpson','4');
insert into employees(id,employee_name,department_id)values('2','Ned Flanders','1');
insert into employees(id,employee_name,department_id)values('3','Barney Gumble','5');
insert into employees(id,employee_name,department_id)values('4','Claney Wiggum','3');
insert into employees(id,employee_name,department_id)values('5','Moe Syzdak',null);


insert into departments(department_id,department_name)values('1','Sales');


insert into departments(department_id,department_name)values('2','Engineering');
insert into departments(department_id,department_name)values('3','Human Resource');
insert into departments(department_id,department_name)values('4','Customer Service');
insert into departments(department_id,department_name)values('5','Research And Development');


select * from employees;
select * from departments;

#inner join

select * from employees emp inner join 
departments dep on emp.department_id = dep.department_id;

#left join

select * from employees emp left join 
departments dep on emp.department_id = dep.department_id;
#left join

select * from departments dep left join
employees emp on emp.department_id = dep.department_id;

#right join

select * from departments dep right join
employees emp on emp.department_id = dep.department_id;


# full join
select * from departments dep full join
employees emp on emp.department_id = 
dep.department_id;

#cross join
select * from employees
cross join departments;

SELECT 
    employees.id,
    employees.employee_name,
    departments.department_name
FROM employees
LEFT JOIN departments
ON employees.department_id = departments.department_id;

