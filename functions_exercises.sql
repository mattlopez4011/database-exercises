use employees;

SELECT CONCAT('Hello ', 'Codeup', '!');

SELECT CONCAT(emp_no,' - ', first_name) AS 'display_name', gender
FROM employees limit 5;

SELECT CONCAT_WS('|',emp_no,' - ', first_name, '|') AS 'display_name', gender
FROM employees limit 5;

select now();
select current_timestamp(),now(), curdate(), curtime();

SELECT CONCAT(
               'Teaching people to code for ',
               ((((UNIX_TIMESTAMP() - UNIX_TIMESTAMP('2014-02-04')) / 60) / 60) /24) / 365,
               ' years'
           );

select min(birth_date), first_name, last_name from employees
group by emp_no limit 1;



USE employees;

-- Find all employees with first names 'Irena', 'Vidya', or 'Maya'
# SELECT * from employees
# WHERE first_name IN ('Irena', 'Vidya', 'Maya')
# ORDER BY first_name ASC;

# SELECT * from employees
# WHERE first_name IN ('Irena', 'Vidya', 'Maya')
# ORDER BY first_name ASC, last_name ASC;

# SELECT * from employees
# WHERE first_name IN ('Irena', 'Vidya', 'Maya')
# ORDER BY last_name ASC, first_name ;

# SELECT * from employees
# WHERE first_name IN ('Irena', 'Vidya', 'Maya')
# ORDER BY last_name DESC, first_name ;

-- Find all employees whose last name starts with 'E' — 7,330 rows.
# SELECT * from employees
# WHERE last_name LIKE 'E%'
# ORDER BY emp_no ASC;

# SELECT * from employees
# WHERE last_name LIKE 'E%'
# ORDER BY emp_no DESC;

-- Find all employees hired in the 90s — 135,214 rows.
-- SELECT * from employees
-- WHERE hire_date LIKE '199%-%-%' ;


# Find all employees born on Christmas — 842 rows.
# SELECT * FROM employees
# WHERE birth_date LIKE '%-12-25';

-- Find all employees with a 'q' in their last name — 1,873 rows.
# SELECT * FROM employees
# WHERE last_name LIKE '%q%';

-- Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
# SELECT * from employees
# WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya';

-- Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
# SELECT * from employees
# WHERE gender = 'M'
#   AND (
#             first_name = 'Irena'
#         OR first_name = 'Vidya'
#         OR first_name = 'Maya'
#     );

-- Find all employees whose last name starts or ends with 'E' — 30,723 rows.
# SELECT * FROM employees
# WHERE last_name LIKE 'E%' OR last_name LIKE '%E';

-- Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT * from employees
WHERE last_name LIKE 'E%e';
# "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
SELECT CONCAT(first_name, ' ',  last_name ) from employees
WHERE last_name LIKE 'E%e';


-- Find all employees hired in the 90s and born on Christmas — 362 rows.
# Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
SELECT * from employees
WHERE hire_date LIKE '199%-%-%'
  AND birth_date LIKE '%-12-25'
ORDER BY hire_date DESC, birth_date DESC;
# "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥"
SELECT


# Update it to find just the first 5 employees.
# SELECT * from employees
# WHERE hire_date LIKE '199%-%-%'
#   AND birth_date LIKE '%-12-25'
# ORDER BY  birth_date, hire_date DESC
# limit 10;

-- Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
# SELECT * from employees
# WHERE last_name LIKE '%q%'
#   AND last_name NOT LIKE '%qu%';