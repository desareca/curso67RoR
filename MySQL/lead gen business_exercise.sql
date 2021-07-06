-- Consultas
-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 1. ¿Qué consulta ejecutaría para obtener los ingresos totales para marzo de 2012?
select date_format(charged_datetime, '%M %Y') as date, sum(amount) as total_amount from billing
where charged_datetime like '2012-03-%';

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 2. ¿Qué consulta ejecutaría para obtener los ingresos totales recaudados del cliente con una identificación de 2?
select bg.client_id, concat(cl.first_name, ' ', cl.last_name) as name, sum(bg.amount) as total_amount 
from billing bg
join clients cl on cl.client_id = bg.client_id
where bg.client_id=2;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 3. ¿Qué consulta ejecutaría para obtener todos los sitios que posee client = 10?
select st.client_id, concat(cl.first_name, ' ', cl.last_name) as name, st.domain_name 
from sites st
join clients cl on cl.client_id = st.client_id
where st.client_id = 10;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 4. ¿Qué consulta ejecutaría para obtener el número total de sitios creados por mes por año para el cliente con una identificación de 1? 
-- ¿Qué pasa con el cliente = 20?
-- id_client = 1
select st.client_id, concat(cl.first_name, ' ', cl.last_name) as name, count(*) as num_domain, date_format(created_datetime, '%Y %M') as date
from sites st
join clients cl on cl.client_id = st.client_id
where st.client_id = 1
group by date asc;
-- id_client = 20
select st.client_id, concat(cl.first_name, ' ', cl.last_name) as name, count(*) as num_domain, date_format(created_datetime, '%Y %M') as date
from sites st
join clients cl on cl.client_id = st.client_id
where st.client_id = 20
group by date asc;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 5. ¿Qué consulta ejecutaría para obtener el número total de clientes potenciales generados para cada uno de los sitios 
-- entre el 1 de enero de 2011 y el 15 de febrero de 2011?
select ld.site_id, st.domain_name, count(*) as n_leads
from leads ld
join sites st on st.site_id = ld.site_id
where ld.registered_datetime between '2011-01-01' and '2011-02-15'
group by ld.site_id
order by n_leads desc;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 6. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado
-- para cada uno de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011?
select cl.client_id, concat(cl.first_name, ' ', cl.last_name) as name, count(*) as n_leads
from leads ld
join sites st on st.site_id = ld.site_id
join clients cl on st.client_id = cl.client_id
where ld.registered_datetime like '2011-%'
group by cl.client_id
order by n_leads desc;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 7. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada
-- cliente cada mes entre los meses 1 y 6 del año 2011?
select cl.client_id, concat(cl.first_name, ' ', cl.last_name) as name, date_format(ld.registered_datetime, '%M %Y') as date, count(*) as n_leads
from leads ld
join sites st on st.site_id = ld.site_id
join clients cl on st.client_id = cl.client_id
where ld.registered_datetime between '2011-01-01' and '2011-06-31'
group by cl.client_id, date
order by ld.registered_datetime asc;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 8. ¿Qué consulta ejecutaría para obtener una lista de nombres de clientes y el número total de clientes potenciales que hemos generado para cada
-- uno de los sitios de nuestros clientes entre el 1 de enero de 2011 y el 31 de diciembre de 2011? Solicite esta consulta por ID de cliente.
-- Presente una segunda consulta que muestre todos los clientes, los nombres del sitio y el número total de clientes potenciales generados en cada sitio
-- en todo momento.
-- muestra el año 2011
select cl.client_id, st.domain_name,count(*) as n_leads
from leads ld
join sites st on st.site_id = ld.site_id
join clients cl on st.client_id = cl.client_id
where ld.registered_datetime like '2011-%'
group by st.site_id
order by n_leads desc;
-- muestra en todo momento
select concat(cl.first_name, ' ', cl.last_name) as name, st.domain_name,count(*) as n_leads
from leads ld
join sites st on st.site_id = ld.site_id
join clients cl on st.client_id = cl.client_id
-- where ld.registered_datetime like '2011-%'
group by st.site_id
order by n_leads desc;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 9. Escriba una sola consulta que recupere los ingresos totales recaudados de cada cliente para cada mes del año. Pídalo por ID de cliente.
-- No me queda claro la instruccion
-- por cada mes por cada año
select client_id, date_format(charged_datetime, '%M %Y') as date, sum(amount) as total_amount 
from billing
group by client_id, date
order by client_id asc, charged_datetime asc;

-- por cada mes independiente del año
select client_id, date_format(charged_datetime, '%M') as date, sum(amount) as total_amount 
from billing
group by client_id, date
order by client_id asc, charged_datetime asc;

-- ---------------------------------------------------------------------------------------------------------------------------------------------
-- 10. Escriba una sola consulta que recupere todos los sitios que posee cada cliente. Agrupe los resultados para que cada fila muestre un nuevo cliente.
-- Se volverá más claro cuando agregue un nuevo campo llamado 'sitios' que tiene todos los sitios que posee el cliente. (SUGERENCIA: use GROUP_CONCAT)
select st.client_id, concat(cl.first_name, ' ', cl.last_name) as clients_name, group_concat(st.domain_name, ' ') as sites 
from sites st
join clients cl on cl.client_id = st.client_id
group by st.client_id;
