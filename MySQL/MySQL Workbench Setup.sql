-- Usa MySQL Workbench para conectarse a su host local.
-- Aprende a usar MySQL workbench para hacer consultas directamente en la base de datos. Para conectarse a una base de datos específica, 
-- ejecuta USE [databasename] en la ventana de queries.
-- Una vez que hayas conectado la base de datos, intenta las consultas que necesitarías para hacer una aplicación CRUD (crear, leer, actualizar, eliminar). 
-- En otras palabras, use los comandos SQL INSERT, SELECT, UPDATE y DELETE.
-- Crea un archivo de texto con los comandos que utilizó para consultar la base de datos. Sube el archivo de texto a continuación.

-- selecciona base de datos
use twitter;

-- revisa tabla
select * from users;

-- agrega fila
INSERT INTO users (first_name, last_name, handle)
VALUES ('carlos', 'saquel', 'carlos');

-- revisa tabla
select * from users;

-- modifica fila ingresada
UPDATE users
SET first_name = 'nombre', last_name = 'apellido'
WHERE id=6;

-- revisa tabla
select * from users;

-- borra fila nueva
DELETE FROM users WHERE id=6;

-- revisa tabla
select * from users;