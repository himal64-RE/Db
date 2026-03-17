#1 Create a database named BankDB and create a table 
#accounts with the fields: account_id,
#account_holder, balance
create database BankDB;
use BankDB;
create table accounts(
account_id int primary key,
account_holder varchar(100),
balance decimal(10,2)
);

#2 Insert the following records into the accounts table:
#(1,'Ram',50000),(2,'Shyam', 30000), (3,'Sita',20000)

insert into accounts values(1,'Ram',50000),
(2,'Shyam', 30000),
(3,'Sita', 20000);



#3 Write a transaction that transfers Rs.5000 from Ram's account to Shyam's account.

start transaction;
update accounts set balance = balance - 5000
where account_id =1;
commit;

#4 Write a transaction that transfers Rs. 10000 from Shyam's account to Sita's account and demonstrate the use of ROLLBACK
START TRANSACTION;

UPDATE accounts
SET balance = balance - 10000
WHERE account_id = 2;

UPDATE accounts
SET balance = balance + 10000
WHERE account_id = 3;

ROLLBACK;

#Write a transaction that demonstrates the use of SAVEOIUBT while updating account balanaces.

START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE account_id = 1;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 2;

ROLLBACK TO sp1;

COMMIT;

SELECT * FROM accounts;


select * from accounts;

# Triggers
#1. Create a table employees with the fields: emp_id, name, salary

CREATE TABLE employees(
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

#2. Create another table salary_log to record employee salary changes with fields log_id, emp_id

CREATE TABLE salary_log(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


#3. Create a BEFORE INSERT trigger on employees that prevents inserting employees whose
#   salary is less than 10000.
Delimiter $$
CREATE TRIGGER check_salary
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be at least 10000';
    END IF;
END $$

DELIMITER ;

#4. Create an AFTER UPDATE trigger on employees that records salary changes into the salary_log table.
DELIMITER $$

CREATE TRIGGER log_salary_update
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO salary_log(emp_id, old_salary, new_salary)
    VALUES(OLD.emp_id, OLD.salary, NEW.salary);
END $$

DELIMITER ;

# Stored prodecure
#1. Create a stored procedure that retrieves all records from the employees table.
DELIMITER $$

CREATE PROCEDURE getEmployees()
BEGIN
    SELECT * FROM employees;
END $$

DELIMITER ;

CALL getEmployees();

#2. Create a stored procedure that inserts a new employee into the employees table using parameters.
DELIMITER $$
CREATE PROCEDURE addEmployee(
    IN p_name VARCHAR(100),
    IN p_salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO employees(name, salary)
    VALUES (p_name, p_salary);
END $$

DELIMITER ;

CALL addEmployee('Hari',20000);

#3. Create a stored procedure that updates the salary of an employee based on employee ID.
Delimiter $$
create procedure updateSalary(
in p_id int, in new_salary decimal (10,2))
begin
update employees
set salary = new_salary
where emp_id = p_id;
end $$
Delimiter ;
call updateSalary(1,30000);

#4. Create a stored procedure that transfers money between two accounts using a transaction.
DELIMITER $$

DELIMITER $$

CREATE PROCEDURE transferMoney(
    IN from_acc INT,
    IN to_acc INT,
    IN amount DECIMAL(10,2)
)
BEGIN
    START TRANSACTION;

    UPDATE accounts
    SET balance = balance - amount
    WHERE account_id = from_acc;

    UPDATE accounts
    SET balance = balance + amount
    WHERE account_id = to_acc;

    COMMIT;

END $$

DELIMITER ;


CALL transferMoney(1,2,5000);
