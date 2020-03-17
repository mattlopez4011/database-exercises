CREATE  DATABASE spring_blog_db;

CREATE USER spring_user@localhost IDENTIFIED BY 'password';
GRANT ALL ON spring_blog_db.* TO spring_user@localhost;


