-- Consultas

-- 1. ¿Qué consulta harías para obtener todos los países que hablan esloveno? Tu consulta debe devolver el nombre del país, el idioma y el porcentaje de idioma.
-- Tu consulta debe organizar el resultado por porcentaje de idioma en orden descendente. (1)
select name, language, percentage from countries
join languages
on countries.id = languages.country_id
where language = 'Slovene'
order by percentage desc;


-- 2. ¿Qué consulta ejecutarías para mostrar el número total de ciudades para cada país? Su consulta debe devolver el nombre del país y el número total de ciudades. 
-- Tu consulta debe organizar el resultado por el número de ciudades en orden descendente. (3)
select countries.name, count(*) as cities from cities
join countries
on countries.id = cities.country_id
group by cities.country_id
order by cities desc;


-- 3. ¿Qué consulta harías para obtener todas las ciudades de México con una población de más de 500,000?
-- Tu consulta debe organizar el resultado por población en orden descendente. (1)
select cities.name, cities.population, countries.name from cities
join countries
on countries.id = cities.country_id
where countries.name = 'Mexico' and cities.population > 500000
order by cities.population desc;


-- 4. ¿Qué consulta ejecutarías para obtener todos los idiomas en cada país con un porcentaje superior al 89%?
-- Tu consulta debe organizar el resultado por porcentaje en orden descendente. (1)
select name, language, percentage from countries
join languages
on countries.id = languages.country_id
where percentage > 89
order by percentage desc;


-- 5. ¿Qué consulta haría para obtener todos los países con un área de superficie inferior a 501 y una población superior a 100,000? (2)
select name, surface_area, population
from countries
where surface_area<501 and population>100000;


-- 6. ¿Qué consulta harías para obtener países con solo Monarquía Constitucional con un capital superior a 200 y una esperanza de vida superior a 75 años? (1)
select name, government_form, capital, life_expectancy
from countries
where government_form = 'Constitutional Monarchy' and
	capital > 200 and life_expectancy > 75;


-- 7. ¿Qué consulta harías para obtener todas las ciudades de Argentina dentro del distrito de Buenos Aires y tener una población superior a 500,000? 
-- La consulta debe devolver el nombre del país, el nombre de la ciudad, el distrito y la población. (2)
select countries.name as country_name, cities.name as city_name, cities.district, cities.population
from cities
join countries
on countries.id = cities.country_id
where countries.name = 'Argentina' and 
	cities.district = 'Buenos Aires' and cities.population > 500000;
 

-- 8. ¿Qué consulta harías para resumir el número de países en cada región? La consulta debe mostrar el nombre de la región y el número de países. 
-- Además, la consulta debe organizar el resultado por el número de países en orden descendente. (2)
select region, count(*) as countries
from countries
group by region
order by countries desc;



