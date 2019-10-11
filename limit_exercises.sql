use titles;

SELECT DISTINCT title FROM titles;

# List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC limit 10;

SELECT first_name, last_name
FROM employees

LIMIT 25 OFFSET 50;

SELECT * from employees
WHERE hire_date LIKE '199%-%-%'
  AND birth_date LIKE '%-12-25'
ORDER BY  birth_date, hire_date DESC
limit 5 offset 45;