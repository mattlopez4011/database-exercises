use employees;

select *
from users;

# Sub-Query Example
# SELECT first_name, last_name, birth_date
# FROM employees
# WHERE emp_no IN (
#     SELECT emp_no
#     FROM dept_manager
# )
# LIMIT 10;


select *
from employees
where emp_no IN (
    select emp_no
    from dept_manager
    where  dept_no IN (
        select dept_no
        from departments
        )
);

SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no;
# WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

# Shows each department along with the name of the current manager for that department.
select concat(e.first_name, ' ', e.last_name) as Full_Name, d.dept_name as Dept_Name, dm.from_date, dm.to_date
from employees as e
    join dept_manager as dm
        on e.emp_no = dm.emp_no
    join departments as d
        on dm.dept_no = d.dept_no
where dm.to_date >= NOW();

# Find the name of all departments currently managed by women.
select concat(e.first_name, ' ', e.last_name) AS Full_Name, d.dept_name as Dept_Name
from employees as e
join dept_manager as dm
    on e.emp_no = dm.emp_no
join departments d
    on dm.dept_no = d.dept_no
where e.gender = 'f'
and dm.to_date >= NOW()
order by Dept_Name;

# Find the current titles of employees currently working in the Customer Service department.
select t.title as Title, count(t.title) as Count
from employees as e
JOIN titles as t
    on e.emp_no = t.emp_no
join dept_emp as de
    on e.emp_no = de.emp_no
join departments as d on de.dept_no = d.dept_no
# where d.dept_name = 'Customer Service'
where d.dept_no = 'd009'
and t.to_date >= NOW()
group by t.title
;

# Find the current salary of all current managers.
select d.dept_name as Department_Name, CONCAT(e.first_name, ' ', e.last_name) as Name, s.salary as Salary
from employees as e
    join dept_manager as dm
        on e.emp_no = dm.emp_no
    join departments as d
        on dm.dept_no = d.dept_no
    join salaries as s
        on e.emp_no = s.emp_no
where dm.to_date >= NOW()
and s.to_date >= NOW()
order by Department_Name
;

# Bonus Find the names of all current employees, their department name, and their current manager's name.
select concat(e.first_name, ' ', e.last_name) as Employee_Name, d.dept_name as Department_Name, CONCAT(m.first_name, ' ', m.last_name) as Manager_Name
# select *
from employees as e
    join dept_emp as de
        on e.emp_no = de.emp_no
    join departments as d
        on de.dept_no = d.dept_no
    join dept_manager as dm
        on d.dept_no = dm.dept_no
    join employees as m
        on dm.emp_no = m.emp_no
    where de.to_date >= NOW()
    and dm.to_date >= NOW();

# Find all the employees with the same hire date as employee 101010 using a subquery.
select first_name, last_name, hire_date
from employees
where hire_date IN (
    select hire_date
    from employees
    where emp_no = '101010'
    );

# Find all the titles held by all employees with the first name Aamod.
select title, count(title) as Title_Count
from titles
where emp_no IN (
    select emp_no
    from employees as e
    where e.first_name = 'Aamod'
    )
group by title;

# Find all the current department managers that are female.
select first_name, last_name
from employees
where emp_no IN (
    select emp_no
    from dept_manager as dm
    where dm.to_date >= now()
     and dm.emp_no IN (
        select emp_no
        from employees as e2
        where e2.gender = 'f'
        )
    )




# Find all the department names that currently have female managers.