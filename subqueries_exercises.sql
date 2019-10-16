# 1. Find all the employees with the same hire date as employee 101010 using a subquery. 69 Rows

select CONCAT(first_name, ' ', last_name) AS Full_Name, hire_date
from employees
where hire_date IN (
    select hire_date
    FROM employees
    where emp_no = '101010'
    ); -- WORKS

#2. Find all the titles held by all employees with the first name Aamod. 314 total titles, 6 unique titles
SELECT title
FROM titles
where emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name = 'Aamod'
);

# 3 Find all the current department managers that are female.

SELECT first_name, last_name
FROM employees
where gender = 'F'
  and emp_no IN (
    select emp_no
    from dept_manager
    where to_date > NOW()
);

#Bonus 1. Find all the department names that currently have female managers.
SELECT dept_name
FROM departments
where dept_no IN (
    SELECT dept_no
    FROM dept_manager
    WHERE to_date > NOW()
      and emp_no IN (
        SELECT emp_no
        from employees
        where gender = 'F'

    )
);