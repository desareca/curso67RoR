select * from users;
select * from friendships;

SELECT users.first_name, users.last_name, user2.first_name as friend_first_name, user2.last_name as friend_last_name FROM users 
JOIN friendships ON friendships.user_id=users.id
JOIN users as user2 ON friendships.friend_id=user2.id;

-- Ejercicio Adicional
-- También escriba las consultas SQL necesarias para realizar las siguientes tareas:

-- Devuelva a todos los usuarios que son amigos de Kermit, asegúrese de que sus nombres se muestren en los resultados.
(
	select concat(users.first_name, ' ', users.last_name) as friends from users 
	join friendships on friendships.user_id=users.id
	where friendships.friend_id = (select id from users where first_name = 'Kermit')
)
union
(
	select concat(users.first_name, ' ', users.last_name) as friends from users 
	join friendships on friendships.friend_id=users.id
	where friendships.user_id = (select id from users where first_name = 'Kermit')
);


-- Devuelve el recuento de todas las amistades.
create view resume_friends as
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

select * from resume_friends;
-- Descubre quién tiene más amigos y devuelve el recuento de sus amigos.


-- Crea un nuevo usuario y hazlos amigos de Eli Byers, Kermit The Frog y Marky Mark.
-- Devuelve a los amigos de Eli en orden alfabético.
-- Eliminar a Marky Mark de los amigos de Eli.
-- Devuelve todas las amistades, mostrando solo el nombre y apellido de ambos amigos
