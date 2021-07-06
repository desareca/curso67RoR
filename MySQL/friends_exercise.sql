-- Modifiqué friends.sql para que borre BD friends si existe y la cree de nuevo.
-- Cada vez que se ejecute este script se debe ejecutar primero friends.sql para inicializar la BD.
use friends;

select * from users;
select * from friendships;

-- Muestra relacion amistad distintos usuarios
SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users 
JOIN friendships ON friendships.user_id=users.id
JOIN users as user2 ON friendships.friend_id=user2.id;

-- Ejercicio Adicional
-- También escriba las consultas SQL necesarias para realizar las siguientes tareas:

-- 1. Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
set @search_name = 'Kermit'; -- genera variable con el nombre a buscar
(
	select concat(users.first_name, ' ', users.last_name) as friends from users 
	join friendships on friendships.user_id=users.id
	where friendships.friend_id = (select id from users where first_name = @search_name)
)
union
(
	select concat(users.first_name, ' ', users.last_name) as friends from users 
	join friendships on friendships.friend_id=users.id
	where friendships.user_id = (select id from users where first_name = @search_name)
); -- devuelve los amigos de @search_name (Kermit)


-- 2. Devuelve el recuento de todas las amistades.
create view resume_friends as -- crea vista de cantidad de amigos por usuario
select user, sum(n) as num_friends from (
	(
		select users.id, count(*) as n , concat(users.first_name, ' ', users.last_name) as user from users 
		join friendships on friendships.user_id=users.id
		group by friendships.user_id
	)
	union all
	(
		select users.id, count(*) as n, concat(users.first_name, ' ', users.last_name) as user from users 
		join friendships on friendships.friend_id=users.id
		group by friendships.friend_id
	)
) T
group by user
order by num_friends desc;

select * from resume_friends; -- muestra cantidad de amigos por user


-- 3. Descubre quién tiene más amigos y devuelve el recuento de sus amigos.
select *
from resume_friends
where num_friends >= ALL(select num_friends from resume_friends);


-- 4. Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
insert into users (first_name, last_name, created_at)
values ('Carlos', 'Saquel', now()); -- crea el usuario Carlos Saquel
select * from users;

-- crea las variable id de cada user a trabajar.
set @id_eli = (select id from users where first_name = 'Eli');
set @id_kermit = (select id from users where first_name = 'Kermit');
set @id_marky = (select id from users where first_name = 'Marky');
set @id_carlos = (select id from users where first_name = 'Carlos');

-- Hace amigo a Carlos Saquel con Eli Byers
insert into friendships (user_id, friend_id, created_at)
values (@id_carlos, @id_eli, now()); 
-- Hace amigo a Carlos Saquel con Kermit The Frog
insert into friendships (user_id, friend_id, created_at)
values (@id_carlos, @id_kermit, now()); 
-- Hace amigo a Carlos Saquel con Marky Mark
insert into friendships (user_id, friend_id, created_at)
values (@id_carlos, @id_marky, now()); 

select * from friendships;


-- 5. Devuelve a los amigos de Eli en orden alfabético.
set @search_name = 'Eli';
(
	select concat(users.first_name, ' ', users.last_name) as friends from users 
	join friendships on friendships.user_id=users.id
	where friendships.friend_id = (select id from users where first_name = @search_name)
)
union
(
	select concat(users.first_name, ' ', users.last_name) as friends from users 
	join friendships on friendships.friend_id=users.id
	where friendships.user_id = (select id from users where first_name = @search_name)
)
order by friends asc;


-- 6. Eliminar a Marky Mark de los amigos de Eli.
-- encuentra id que relaciona a Marky con Eli
set @id_del = (select id from friendships where (user_id = @id_eli and friend_id = @id_marky) or (user_id = @id_marky and friend_id = @id_eli));
-- Borra relacion
delete from friendships where id=@id_del;
select * from friendships; -- elimina id 5 que relaciona a Eli con Mark


-- 7. Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users 
JOIN friendships ON friendships.user_id=users.id
JOIN users as user2 ON friendships.friend_id=user2.id;
