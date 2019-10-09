USE codeup_test_db;

DROP TABLE IF EXISTS pets;

CREATE TABLE pets (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    author  VARCHAR(50) NOT NULL DEFAULT 'Unknown',
    date_published VARCHAR(10) NOT NULL,
    description TEXT,
    bestseller_weeks VARCHAR(15) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
);

-- ================================================================================================================
-- 2. A pets table with the following columns (you choose which columns should be null, unsigned, default, etc.)...
--  id,
--  name,
--  dob,
--  weight,
--  is_sterlized,
--  breed,
--  description,
--  date_adopted

-- CREATE TABLE books (
--     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--     title VARCHAR(50) NOT NULL,
--     author  VARCHAR(50) NOT NULL DEFAULT 'Unknown',
--     date_published VARCHAR(10) NOT NULL,
--     description TEXT,
--     bestseller_weeks VARCHAR(15) NOT NULL DEFAULT '0',
--     PRIMARY KEY (id)
-- );