CREATE DATABASE practice;
CREATE DATABASE season;

DROP DATABASE practice;

ALTER DATABASE text1 RENAME TO test1;


CREATE TABLE studentform (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    cgpa NUMERIC(1,2)
);

ALTER TABLE studentform RENAME TO learners;

DROP TABLE learners;

-- create table with constraints
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    age INT DEFAULT 18
);

-- insert data
INSERT INTO users (user_id, username, email)VALUES (1, 'Islam', 'b@b.com');

-- insert multiple data
INSERT INTO users (username, email)
VALUES
('Season', 'a@a.com'),
('Rubayet', 's@s.com'),
('seas', 'r@r.com');

-- delete table row data without deleting the entire table
TRUNCATE TABLE users;

SELECT * FROM users;
for composite key
CREATE TABLE employees (
    user_id SERIAL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    age INT DEFAULT,
    PRIMARY KEY(user_id, username)
    UNIQUE(user_id, username) -- for cross double unique value
);

insert multiple data
INSERT INTO users
VALUES
(1,'Season', 'a@a.com'),
(2, 'Rubayet', 's@s.com'),
(3, 'Islam', 'r@r.com');

-- ALTER TABLE
-- 1. add, drop, chnage datatype of column
-- 2. rename, set default value to a column
-- 3. add constraints, drop constraint from a column
-- 4. rename table

-- add column
ALTER TABLE users ADD COLUMN demo INT;

-- drop column
ALTER TABLE users DROP COLUMN age;

-- change datatype
-- ALTER TABLE users
ALTER COLUMN demo type TEXT;

-- set default value
ALTER TABLE users
ALTER COLUMN demo set DEFAULT 'bangladesh';

-- remove default value
ALTER TABLE users
ALTER COLUMN demo DROP DEFAULT;

-- rename a column
ALTER TABLE users
RENAME COLUMN demo to country;

-- add a constraint
ALTER TABLE users
ALTER COLUMN country set NOT NULL;

-- drop a constraint
ALTER TABLE users
ALTER COLUMN country drop NOT NULL;

-- add unique constraint
ALTER TABLE users
ADD CONSTRAINT unique_email UNIQUE(email);

-- drop unique constraint
ALTER TABLE users
DROP CONSTRAINT unique_email;

CREATE TABLE department(
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE users(
    userId SERIAL PRIMARY KEY,
    userName VARCHAR(50),
    departmentId INT,
    CONSTRAINT fk_constraint_dept
        Foreign Key (departmentId) REFERENCES department(dept_id)
);

-- update and delete
CREATE TABLE courses(
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    published_data DATE
);

INSERT INTO courses(course_name, description, published_data)
VALUES('postgre for developers', 'A complete guide for the developers to learn postgresql', '2020-07-03'),
('postgre for developers', 'A complete guide for the developers to learn postgresql', NULL),
('postgre for developers', NULL, NULL),
('postgre for developers', 'A complete guide for the developers to learn postgresql', '2020-07-03'),
('postgre for developers', 'A complete guide for the developers to learn postgresql', '2020-07-03');



SELECT * FROM courses;


-- update single database row
UPDATE courses
SET
course_name = 'new data updated',
description = 'lorem ipsum'
where course_id > 3;

-- delete
DELETE FROM courses WHERE course_id = 5;

CREATE TABLE IF NOT EXISTS departments (
    deptID SERIAL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE IF NOT EXISTS employees (
    empID SERIAL PRIMARY KEY,
    name text NOT NULL,
    email text NOT NULL,
    salary integer NOT NULL,
    joining_date DATE NOT NULL,
    deptID INTEGER NOT NULL,
    CONSTRAINT fk_deptID
        Foreign Key (deptID) REFERENCES departments(deptID)
);

INSERT INTO departments
VALUES
(1,'IT'),
(2, 'HR'),
(3, 'Accounts'),
(4, 'Finance'),
(5, 'Marketing');

INSERT INTO employees 
VALUES
    (1, 'John', 'john@gmail.com', 15000, '2022-01-15', 2),
    (2, 'Emily', 'emily@gmail.com', 82000, '2021-08-05', 4),
    (3, 'Michael', 'michael@gmail.com', 55000, '2022-06-20', 3),
    (4, 'Sophia', 'sophia@gmail.com', 30000, '2021-11-30', 1),
    (5, 'Daniel', 'daniel@gmail.com', 68000, '2022-03-25', 5),
    (6, 'Olivia', 'olivia@gmail.com', 42000, '2021-12-10', 4),
    (7, 'William', 'william@gmail.com', 60000, '2022-02-18', 2),
    (8, 'Ava', 'ava@gmail.com', 53000, '2022-09-12', 1),
    (9, 'James', 'james@gmail.com', 47000, '2021-10-05', 3),
    (10, 'Isabella', 'isabella@gmail.com', 9000, '2022-11-02', 5),
    (11, 'Logan', 'logan@gmail.com', 72000, '2022-08-17', 2),
    (12, 'Mia', 'mia@gmail.com', 37000, '2021-09-25', 4),
    (13, 'Benjamin', 'benjamin@gmail.com', 65000, '2022-04-30', 1),
    (14, 'Emma', 'emma@gmail.com', 58000, '2022-01-05', 3),
    (15, 'Henry', 'henry@gmail.com', 52000, '2021-07-22', 5),
    (16, 'Aiden', 'aiden@gmail.com', 76000, '2022-03-15', 1),
    (17, 'Liam', 'liam@gmail.com', 34000, '2021-12-18', 2),
    (18, 'Avery', 'avery@gmail.com', 40000, '2022-06-11', 4),
    (19, 'Alexander', 'alexander@gmail.com', 89000, '2021-10-30', 3),
    (20, 'Ella', 'ella@gmail.com', 48000, '2022-07-05', 5),
    (21, 'Charlotte', 'charlotte@gmail.com', 47000, '2021-10-05', 3),
    (22, 'Ethan', 'ethan@gmail.com', 36000, '2022-07-02', 4),
    (23, 'Amelia', 'amelia@gmail.com', 58000, '2022-01-05', 3),
    (24, 'Henry', 'henry@gmail.com', 52000, '2021-07-22', 5),
    (25, 'Ava', 'ava@gmail.com', 34000, '2022-06-18', 2),
    (26, 'Oliver', 'oliver@gmail.com', 40000, '2021-11-15', 1),
    (27, 'Sophia', 'sophia@gmail.com', 67000, '2022-08-10', 5),
    (28, 'Liam', 'liam@gmail.com', 39000, '2022-04-30', 3),
    (29, 'Isabella', 'isabella@gmail.com', 44000, '2022-02-05', 2),
    (30, 'Lucas', 'lucas@gmail.com', 75000, '2021-12-15', 1),
     (31, 'Daniel', 'daniel@gmail.com', 38000, '2022-06-05', 4),
    (32, 'Sophia', 'sophia@gmail.com', 50000, '2021-09-10', 2),
    (33, 'Olivia', 'olivia@gmail.com', 42000, '2021-12-10', 4),
    (34, 'William', 'william@gmail.com', 60000, '2022-02-18', 2),
    (35, 'Ava', 'ava@gmail.com', 48000, '2022-07-22', 5),
    (36, 'James', 'james@gmail.com', 43000, '2022-03-15', 1),
    (37, 'Emily', 'emily@gmail.com', 78000, '2021-10-27', 3),
    (38, 'Benjamin', 'benjamin@gmail.com', 35000, '2022-04-10', 1),
    (39, 'Emma', 'emma@gmail.com', 54000, '2022-02-05', 3),
    (40, 'Michael', 'michael@gmail.com', 59000, '2021-08-10', 2),
    (41, 'Lucas', 'lucas@gmail.com', 40000, '2021-11-15', 1),
    (42, 'Isabella', 'isabella@gmail.com', 67000, '2022-08-10', 5),
    (43, 'Alexander', 'alexander@gmail.com', 47000, '2022-06-20', 3),
    (44, 'Mia', 'mia@gmail.com', 33000, '2021-12-18', 2),
    (45, 'Ethan', 'ethan@gmail.com', 46000, '2021-07-25', 4),
    (46, 'Grace', 'grace@gmail.com', 39000, '2022-05-30', 1),
    (47, 'Charlotte', 'charlotte@gmail.com', 56000, '2022-03-10', 3),
    (48, 'Logan', 'logan@gmail.com', 52000, '2021-09-05', 2),
    (49, 'Avery', 'avery@gmail.com', 43000, '2022-01-12', 4),
    (50, 'Noah', 'noah@gmail.com', 71000, '2021-12-22', 5);

select * from employees;

-- select some column
SELECT name, email from employees;


SELECT * FROM employees WHERE name <> 'John';

SELECT * FROM employees ORDER BY salary DESC LIMIT 3 OFFSET 2;

SELECT * FROM employees WHERE empid NOT IN (2,3,5);

SELECT * from employees WHERE salary BETWEEN 10000 AND 30000;

SELECT * FROM employees
WHERE name LIKE 'A%';

SELECT * FROM employees
WHERE name LIKE '%A%';

SELECT * FROM employees
WHERE name LIKE '%en';

SELECT * FROM employees;

SELECT AVG(salary) as avgSalary from employees;

SELECT departments.name, AVG(employees.salary) as average, SUM(employees.salary) as total, count(*) from employees
FULL JOIN departments on employees.deptid = departments.deptid
GROUP BY departments.name HAVING AVG(employees.salary) > 50000;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department, salary)
VALUES
    (1, 'John Doe', 'HR', 50000.00),
    (2, 'Jane Smith', 'IT', 60000.00),
    (3, 'Michael Johnson', 'Finance', 55000.00),
    (4, 'Emily Brown', 'HR', 52000.00);

SELECT emp_name, salary from employees WHERE department = 'HR';

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, total_amount)
VALUES
    (101, 1, 200.00),
    (102, 2, 300.00),
    (103, 1, 150.00),
    (104, 3, 400.00),
    (105, 2, 250.00);


SELECT customer_id, avg(total_amount) as average_total_amount from orders GROUP BY customer_id HAVING avg(total_amount) >= 250;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    credits INT
);

INSERT INTO students (student_id, student_name, age, gender)
VALUES
    (1, 'Alice', 22, 'Female'),
    (2, 'Bob', 21, 'Male'),
    (3, 'Charlie', 23, 'Male');

INSERT INTO courses (course_id, course_name, credits)
VALUES
    (101, 'Mathematics', 3),
    (102, 'History', 4),
    (103, 'Physics', 3);

-- Enrollment table with student-course relationships
CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT
);

INSERT INTO enrollment (enrollment_id, student_id, course_id)
VALUES
    (1, 1, 101),
    (2, 1, 102),
    (3, 2, 103),
    (4, 3, 101);


SELECT s.student_name, cr.course_name, cr.credits
FROM students s
JOIN enrollment e on e.student_id = s.student_id
JOIN courses cr on cr.course_id = e.course_id;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (emp_id, emp_name, department_id)
VALUES
    (1, 'John Doe', 1),
    (2, 'Jane Smith', 2),
    (3, 'Michael Johnson', 1),
    (4, 'Emily Brown', 3);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'IT'),
    (3, 'Finance');

INSERT INTO salaries (emp_id, salary)
VALUES
    (1, 50000.00),
    (2, 60000.00),
    (3, 55000.00),
    (4, 52000.00);

SELECT d.department_name, avg(s.salary)
from employees e
JOIN salaries s on s.emp_id = e.emp_id
join departments d on e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY avg(s.salary) DESC;


CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO orders (order_id, customer_id, order_date, total_amount)
VALUES
    (101, 1, '2023-01-05', 200.00),
    (102, 2, '2023-01-06', 300.00),
    (103, 1, '2023-02-10', 150.00),
    (104, 3, '2023-02-15', 400.00),
    (105, 2, '2023-03-20', 250.00);


SELECT to_char(order_date, 'Month'), SUM(total_amount), count(*)
FROM orders
GROUP BY to_char(order_date, 'Month');


SELECT * from employees WHERE salary = (
SELECT max(salary) from employees
);

SELECT * from employees WHERE salary IN (
SELECT salary from employees where name LIKE '%a%'
);


SELECT * from employees WHERE salary > (
SELECT avg(salary) from employees
);

SELECT name, email, (SELECT avg(salary) from employees) from employees;


CREATE VIEW info_view
AS
SELECT name, email from employees;

create Procedure deactivate_unpaid_accounts()
LANGUAGE SQL
AS $$
UPDATE accounts SET acount = false WHERE balance = 0;
$$;

CALL deactivate_unpaid_accounts();

create FUNCTION deactivate_unpaid_accounts(account TYPE text) RETURNS INTEGER
LANGUAGE PLPGSQL
AS $$
DECLARE account_count int;
    BEGIN
    SELECT count(*) into acount_count from accounts WHERE balance = 0;
    RETURN account_count;
    END;
$$;

CREATE Table products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    base_price FLOAT8 NOT NULL,
    final_price FLOAT8
);

SELECT * from products;

INSERT into products VALUES(1, 'Apple', 100);


CREATE or REPLACE Trigger add_tax_trigger
AFTER
INSERT on products
FOR EACH ROW
EXECUTE FUNCTION update_final_price();

CREATE or REPLACE Function update_final_price()
RETURNS TRIGGER
LANGUAGE PLPGSQL
as $$
BEGIN
NEW.final_price := NEW.base_price * 1.05; 
RETURN NEW;
END;
$$;

EXPLAIN ANALYSE SELECT name, email from employees WHERE empid = 1;

CREATE INDEX name_idx on employees(name);

 EXPLAIN ANALYSE SELECT name from employees WHERE name = 'Logan';