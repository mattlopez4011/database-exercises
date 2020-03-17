CREATE DATABASE adlister_db;
# DROP DATABASE IF EXISTS adlister_DB;
USE adlister_db;

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       username VARCHAR(255) NOT NULL,
                       email VARCHAR(255) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       primary key (id)
);


drop table ads;

CREATE TABLE ads (
                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     user_id INT UNSIGNED ,
                     title VARCHAR(255) NOT NULL,
                     description VARCHAR(255),
                     primary key (id),
                     FOREIGN KEY (user_id) REFERENCES users (id)
);

SELECT * FROM ads
WHERE user_id = 47 IN (
    SELECT user_id
    from users
    where id = 47
    )
    LIMIT 1;

SELECT * FROM users
WHERE id IN (
    SELECT user_id
    FROM ads
    where user_id = 47
    );


SELECT * from ads
WHERE id = 1;


SELECT * FROM users;
SELECT * FROM ads;

SELECT * FROM users WHERE id IN (SELECT user_id FROM ads where user_id = 47);



# INSERT INTO quotes (author_first_name, author_last_name, content)
# VALUES ('Charles' ,'Lemagne','Knowing a second language is to have a second soul.'),
#        ('Charles' ,'Lemagne','Knowing a second language is to have a second soul.');

INSERT INTO users (username, email, password)
VALUES ('matt123', 'matt@gmail.com', 'password'),
       ('michael456', 'intern@gmail.com', 'password456');

