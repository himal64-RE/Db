
where EmpID = 002;

select * from employee;

#5. Display the first name, current date, date of birth, and age
# of the employees who are older than 30 years.

select FirstName, curdate() as CurrentDate,
DateofBirth,
timestampdiff(YEAR, DateOfBirth, CURDATE()) as Age from employee 
where
timestampdiff(YEAR, DateofBirth, CURDATE())>25;

#6. Write a query to find the oldest employye.

select * from employee 
where DateOfBirth=(select MIN(DateOfBirth)
from employee);

#7. youngest employee

select * from employee 
where DateOfBirth=(select MAX(DateOfBirth)
from employee); 

#8. Display the maximum salary department-wise.

select DepartmentName, Max(EmpSalary) as MaxEmpSalary 
from employee Group by DepartmentName;


#9. List the employees who act as managers.
select * from employee;
select FirstName from employee where 
EmpID in (Select ManagerID from employee); 





#10. Display the details of the most recently joined 
#employee.

select * from employee where
JoinedDate=(select Max(JoinedDate) from employee);


select * from employee
where FirstName like 'r%';
select * from employee
where LastName like '%a';
select * from employee where FirstName Like 's%n';

select * from employee where EmpAddress like 'l%';

