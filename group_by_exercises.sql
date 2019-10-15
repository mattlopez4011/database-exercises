use employees;

select DISTINCT title
FROM titles;

SELECT last_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY last_name;

SELECT last_name, first_name
FROM employees
WHERE last_name LIKE 'E%e'
GROUP BY last_name, first_name;

SELECT last_name
FROM employees
where last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

SELECT concat(first_name, ' ', last_name ) AS Full_name, COUNT(*)
FROM employees
where last_name LIKE '%q%'
  AND last_name NOT LIKE '%qu%'
GROUP BY first_name, last_name
ORDER BY COUNT(*) desc ;

SELECT count(*), gender from employees
WHERE(
            first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya'
    )
GROUP BY gender;


