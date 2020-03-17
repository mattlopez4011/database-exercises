# CREATE DATABASE adlister_DB;
# DROP DATABASE IF EXISTS adlister_DB;
USE adlister_DB;

CREATE TABLE users (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    primary key (id)
);
DROP TABLE ads;
DROP TABLE users;

DROP TABLE ad_category;

SHOW TABLES;
SELECT * FROM ads limit 10;

CREATE TABLE ads (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id INT UNSIGNED DEFAULT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    primary key (id),
    FOREIGN KEY (user_id) REFERENCES users (id)
);

CREATE TABLE category (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    primary key (id)
);

CREATE TABLE ad_category (
    ad_id INT UNSIGNED DEFAULT NULL,
    FOREIGN KEY (ad_id) REFERENCES ads (id),
    category_id INT UNSIGNED DEFAULT NULL,
    FOREIGN KEY (category_id) REFERENCES category (id)
);

SELECT email
FROM users
WHERE id IN (
    SELECT id
    FROM ads

);

SELECT name
FROM category
WHERE id IN (
    SELECT category_id
    FROM ad_category
    WHERE ad_id In (
        SELECT ID
        from ads
    )
);

# For a given category, show all the ads that are in that category.
SELECT *
FROM ads
WHERE id IN (
    SELECT ad_id
    FROM ad_category
    WHERE category_id IN (
        SELECT id
        FROM category

    )
);

# For a given user, show all the ads they have posted.
SELECT *
FROM ads
WHERE user_id IN (
    SELECT ID
    FROM users
);