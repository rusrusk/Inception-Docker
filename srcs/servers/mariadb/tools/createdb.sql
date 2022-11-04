CREATE DATABASE wordpress;

CREATE USER 'rkultaev'@'%' IDENTIFIED BY 'GOGI';

-- rkultaev has the complete control and access for database wordpress
-- These privileges are intended for wordpress apply to all tables of this database, which is defined .*
GRANT ALL PRIVILEGES ON wordpress.* TO 'rkultaev'@'%';

-- Persisting the changes
FLUSH PRIVILEGES;

-- ALTER USER to change authentification or characteristics of databse resources
ALTER USER 'root'@'localhost' IDENTIFIED BY 'Ruslan1997!!';