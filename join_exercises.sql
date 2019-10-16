CREATE DATABASE join_test_db;
SHOW DATABASES;
USE join_test_db;

CREATE TABLE roles
(
    id   INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE users
(
    id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name    VARCHAR(100) NOT NULL,
    email   VARCHAR(100) NOT NULL,
    role_id INT UNSIGNED DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name)
VALUES ('admin');
INSERT INTO roles (name)
VALUES ('author');
INSERT INTO roles (name)
VALUES ('reviewer');
INSERT INTO roles (name)
VALUES ('commenter');

INSERT INTO users (name, email, role_id)
VALUES ('bob', 'bob@example.com', 1),
       ('joe', 'joe@example.com', 2),
       ('sally', 'sally@example.com', 3),
       ('adam', 'adam@example.com', 3),
       ('jane', 'jane@example.com', null),
       ('mike', 'mike@example.com', null);

SHOW TABLES;

select *
FROM users;

# INNER JOIN
select users.name, roles.name
FROM users
         join roles on users.role_id = roles.id;

# LEFT JOIN
select users.name, roles.name
FROM users
         LEFT JOIN roles ON users.role_id = roles.id;

# RIGHT JOIN
select users.name, roles.name
FROM users
         RIGHT JOIN roles ON users.role_id = roles.id;

# Count how many people are in a given role
SELECT roles.name, COUNT(roles.name)
FROM users
         JOIN roles ON users.role_id = roles.id
GROUP BY roles.name;

# write a query that shows each department along with the name of the current manager for that department.
use employees;
SELECT departments.dept_name                                  AS "Department Name",
       CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM employees
         JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
         JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date > NOW()
GROUP BY `Department Name`, `Department Manager`;
-- Works

# Find the name of all departments currently managed by women.
SELECT departments.dept_name AS "Department Name", CONCAT(employees.first_name, ' ', employees.last_name) AS "Department Manager"
FROM employees
         JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
         JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE employees.gender = 'F' AND dept_manager.to_date > NOW()
GROUP BY `Department Name`, `Department Manager`; -- Works

# Find the current titles of employees currently working in the Customer Service department.
SELECT titles.title, COUNT(titles.title), departments.dept_name
from employees
join titles on employees.emp_no = titles.emp_no
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name  = 'Customer Service'
# WHERE dept_no = 'd009'
AND dept_emp.to_date > NOW()
AND titles.to_date > NOW()
group by titles.title; -- WORKS

# 5. Find the current salary of all current managers.

