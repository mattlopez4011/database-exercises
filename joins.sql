SHOW DATABASES;
CREATE DATABASE  IF NOT EXISTS ceres_db;
USE ceres_db;

# ============================== JOINS

# Use joins when you need columns of data across multiple tables

# Use of foreign keys ensures referential integrity
#   (can't insert record with id for record that doesn't exist) and to clearly describe DB structure


# Posts
#
# id(PK) | title | content | user_id (FK) | created_at | updated_at
#
# Users
#
# id(PK) | email | pass    | created_at | updated_at


# ================== JOIN BASICS

CREATE TABLE owners (
                        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(30) NOT NULL,
                        address VARCHAR(255) DEFAULT 'Undisclosed'
);

CREATE TABLE pets (
                      id INT UNSIGNED AUTO_INCREMENT,
                      pet_name VARCHAR(30) NOT NULL,
                      owner_id INT UNSIGNED,
                      age INT,
                      FOREIGN KEY (owner_id) REFERENCES owners(id),
                      PRIMARY KEY (id)
);

show tables;


# seed tables

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', null, 2);

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Spot', 1, 2); -- error (referential integrity at work!)

INSERT INTO owners (name, address)
VALUES ('Darth Smith', '1138 Death Star Rd.');

INSERT INTO pets (pet_name, owner_id, age)
VALUES ('Puddle', 1, 2); -- will run


SELECT * FROM pets;
SELECT * FROM owners;

# re-migrate and seed using separate file

# BASIC JOIN
# list the name and address of a pet

SELECT pets.pet_name, owners.address
FROM pets
         JOIN owners ON owners.id = pets.owner_id;

# TODO: List the pet name, pet age, and owner name

select p.pet_name, p.age, o.name
from pets as p
         join owners as o
              on p.owner_id = o.id;

# BASIC JOIN WITH ALIASES

SELECT p.pet_name, o.address
FROM pets AS p
         JOIN owners AS o ON o.id = p.owner_id;

describe owners;
describe ceres_db.pets;


# JOIN WITH GROUP BY
# List the number of pets at each address

SELECT owners.address, COUNT(owners.address) AS `number of pets at address` FROM pets
                                                                                     JOIN owners ON owners.id = pets.owner_id
GROUP BY owners.address;


# ===============
DROP DATABASE IF EXISTS ceres_db;
CREATE DATABASE ceres_db;

USE ceres_db;

CREATE TABLE owners (
                        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
                        name VARCHAR(30) NOT NULL,
                        address VARCHAR(255) DEFAULT 'Undisclosed'
);

CREATE TABLE pets (
                      id INT UNSIGNED AUTO_INCREMENT,
                      pet_name VARCHAR(30) NOT NULL,
                      owner_id INT UNSIGNED DEFAULT NULL,
                      age INT,
                      PRIMARY KEY (id),
                      FOREIGN KEY (owner_id) REFERENCES owners(id)
);

# CREATE TABLE toys (
#   id INT UNSIGNED AUTO_INCREMENT,
#   type VARCHAR(30) NOT NULL,
#   PRIMARY KEY (id)
# );
#
# CREATE TABLE pets_toys (
#   pet_id INT UNSIGNED,
#   toy_id INT UNSIGNED,
#   FOREIGN KEY (pet_id) REFERENCES pets(id),
#   FOREIGN KEY (toy_id) REFERENCES toys(id)
# );


SELECT * from ceres_db.owners;

INSERT INTO owners (name, address)
VALUES
('Darth Smith', '1138 Death Star Rd.'),
('Padme Smith', '1138 Death Star Rd.'),
('Luke Douglas', '18 Tatooine Ln.'),
('Lando Johnson', '777 Bespin Street');

INSERT INTO pets (pet_name, owner_id, age)
VALUES
('Spot', 1, 2),
('Puddle', 1, 2),
('Elrond', 1, 5),
('Mr. Pig', 2, 10),
('Mack', 2, 7),
('Bud', 3, 2),
('Bubbles', 4, 1);

# INSERT INTO toys (type)
# VALUES
# ('ball'),
# ('bone'),
# ('squeaky toy'),
# ('rope');
#
# INSERT INTO pets_toys (pet_id, toy_id)
# VALUES
# (1, 1),
# (1, 2),
# (2, 1),
# (3, 3),
# (4, 2),
# (4, 4);






# Exercise
# TODO: List the pet name, pet age, and owner name
SELECT pets.pet_name, pets.age, owners.name
FROM pets
JOIN owners ON pets.owner_id = owners.id;

# TODO: Write a query that will return the address and the age of each pet
SELECT owners.address, pets.age
FROM pets
JOIN owners on pets.owner_id = owners.id;

# TODO: (CHALLENGE) list of the type of each pet's toy and the pet's name (edited)












# ================== INNER, LEFT, and RIGHT JOINS

USE join_test_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       name VARCHAR(100) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       role_id INT UNSIGNED DEFAULT NULL,
                       PRIMARY KEY (id),
                       FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
('bob', 'bob@example.com', 1),
('joe', 'joe@example.com', 2),
('sally', 'sally@example.com', 3),
('adam', 'adam@example.com', 3),
('jane', 'jane@example.com', null),
('mike', 'mike@example.com', null);

SELECT * FROM roles;
SELECT * FROM users;

# output user name and role for all records with a non-null user name and role name

SELECT users.name, roles.name
FROM users
         JOIN roles -- same as INNER JOIN
              ON roles.id = users.role_id;


# output user name and their role name for all matches and all users regardless of null roles

SELECT users.name, roles.name
FROM users
         LEFT JOIN roles
                   ON roles.id = users.role_id;


# output user name and role for all non-null matches and all roles with null users

SELECT users.name, roles.name
FROM users
         RIGHT JOIN roles
                    ON roles.id = users.role_id;





# ================== MULTIPLE JOINS

# output all current employee names and their current titles
USE employees;

SELECT * FROM employees;
SELECT * FROM titles;

# Shows employees current job title
SELECT employees.first_name, employees.last_name, titles.title, titles.to_date
FROM employees
JOIN titles ON employees.emp_no = titles.emp_no
# WHERE titles.to_date > NOW();
WHERE titles.to_date = '9999-01-01';

SELECT CONCAT(employees.first_name, ' ', employees.last_name), titles.title
FROM employees
         JOIN titles
              ON titles.emp_no = employees.emp_no
WHERE titles.to_date > NOW();



# using aliases
SELECT CONCAT(e.first_name, ' ', e.last_name), t.title
FROM employees AS e
         JOIN titles as t
              ON t.emp_no = e.emp_no
WHERE t.to_date > NOW();



# output name and current department for employee number 10001
USE employees;

SELECT employees.first_name, employees.last_name, departments.dept_name
FROM employees
JOIN dept_emp on employees.emp_no = dept_emp.emp_no
JOIN departments on dept_emp.dept_no = departments.dept_no
WHERE employees.emp_no = 10001;


SELECT CONCAT(e.first_name, ' ', e.last_name) AS full_name, d.dept_name
FROM employees as e
         JOIN dept_emp as de
              ON de.emp_no = e.emp_no
         JOIN departments as d
              ON d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND e.emp_no = 10001;

SELECT * FROM departments;























# ================== ADDITIONAL PETS QUESTIONS AND ANSWERS


USE ceres_db;

# List the address with the fewest pets. If a tie occurs, return the alphabetically first address.
# Find the average age of pets for each address
# Output the "{NAME_OF_PET} is owned by {NAME_OF_OWNER}"
# Output the total age each pet owner's pets

# POSSIBLE SOLUTIONS ARE BELOW...


































# List the address with the fewest pets. If a tie occurs, return the alphabetically first address.

SELECT owners.address, COUNT(*) FROM owners
JOIN pets ON pets.owner_id = owners.id
GROUP BY owners.address
ORDER BY COUNT(*) ASC, owners.address
LIMIT 1;

# Find the average age of pets for each address

select o.address, AVG(p.age) from pets as p
join owners as o on o.id = p.owner_id
group by o.address;

# Output the "{NAME_OF_PET} is owned by {NAME_OF_OWNER}"

SELECT CONCAT(pets.pet_name, ' is owned by ', owners.name) AS Message FROM pets
JOIN owners
ON owners.id = pets.owner_id;

# Output the total age each pet owner's pets
select o.name, SUM(p.age) as total_pets_age from pets as p
join owners as o on o.id = p.owner_id
group by o.name;





























