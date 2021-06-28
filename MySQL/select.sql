-- Select --
-- Qué consulta ejecutarías para obtener todos los usuarios? --
SELECT * 
FROM users;

-- Qué consulta ejecutarías para obtener solo los nombres de todos los usuarios? --
SELECT first_name 
FROM users;

-- Qué consulta ejecutarías para obtener solo el nombre y los apellidos de todos los usuarios? --
SELECT first_name, last_name 
FROM users;

-- Qué consulta ejecutarías para obtener solo el nombre de los usuarios con un ID de 2? --
SELECT first_name
FROM users
WHERE id = 2;

-- Qué consulta ejecutarías para obtener los apellidos de los usuarios con un ID de 2 o 3? --
SELECT last_name
FROM users
WHERE id = 2 OR id = 3;

-- Qué consulta ejecutarías para obtener todos los usuarios con una identificación mayor que 2? --
SELECT *
FROM users
WHERE id > 2;

-- Qué consulta ejecutaría para obtener todos los usuarios con una identificación menor o igual a 3? --
SELECT *
FROM users
WHERE id <= 3;

-- Qué consulta ejecutarías para obtener todos los usuarios con nombres que terminan en "e"? --
SELECT * 
FROM users
WHERE first_name LIKE "%e";

-- Qué consulta ejecutaría para obtener todos los usuarios con nombres que comienzan en "K"? --
SELECT * 
FROM users
WHERE first_name LIKE "K%";

-- Qué consulta ejecutaría para obtener todos los usuarios con los usuarios más jóvenes en la parte superior de la tabla? --
SELECT *
FROM users
ORDER BY birthday DESC;

-- Qué consulta ejecutaría para obtener todos los usuarios con los usuarios más antiguos en la parte superior de la tabla? --
SELECT *
FROM users
ORDER BY birthday ASC;

-- Qué consulta ejecutaría para obtener todos los usuarios con el primer nombre que termina con "e" con los usuarios más jóvenes en la parte superior de la tabla? --
SELECT *
FROM users
WHERE first_name LIKE "%e"
ORDER BY birthday DESC;

-- Qué consulta ejecutaría para obtener solo los nombres de todos los usuarios en orden alfabético? --
SELECT first_name
FROM users
ORDER BY first_name;


