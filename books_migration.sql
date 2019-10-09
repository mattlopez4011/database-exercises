USE codeup_test_db;

DROP TABLE IF EXISTS books;

CREATE TABLE books (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(50) NOT NULL,
    author  VARCHAR(50) NOT NULL DEFAULT 'Unknown',
    date_published VARCHAR(10) NOT NULL,
    description TEXT,
    bestseller_weeks VARCHAR(15) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
);


-- ==================================================
-- Create a migration file for the following tables: √
-- 1. A books table with the following columns... √
--  id , required and will be primary key √
--  title , required √
--  author , required and 'Unknown' by default √
--  date_published , required √
--  description , √
--  bestseller_weeks , required and 0 by default √

-- CREATE TABLE quotes (
--     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
--     author_first_name VARCHAR(50) DEFAULT 'NONE',
--     author_last_name  VARCHAR(100) NOT NULL,
--     content TEXT NOT NULL,
--     PRIMARY KEY (id)
-- );

