# 1. Find all the employees with the same hire date as employee 101010 using a subquery. 69 Rows

select CONCAT(first_name, ' ', last_name) AS Full_Name, hire_date
from employees
where hire_date IN (
    select hire_date
    FROM employees
    where emp_no = '101010'
    ); -- WORKS

