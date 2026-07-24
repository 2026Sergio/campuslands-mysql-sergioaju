use campuslands_mysql;

-- 1. ver todos los equipos que estan participando activamente
select id, nombre, categoria, puntaje, estado 
from basico_ejercicio_001 
where estado = 'activo';

-- 2. saber cuantos equipos hay por region y su promedio de puntos
select 
    categoria as region, 
    count(*) as cantidad_equipos, 
    avg(puntaje) as promedio_puntos
from basico_ejercicio_001
group by categoria
order by promedio_puntos desc;

-- 3. sacar los 3 mejores equipos del torneo
select nombre, categoria, puntaje
from basico_ejercicio_001
where estado = 'activo'
order by puntaje desc
limit 3;

-- 4. ver cuales equipos estan descalificados o en revision
select nombre, categoria, estado
from basico_ejercicio_001
where estado != 'activo';

-- 5. buscar equipos con mas de 800 puntos
select nombre, categoria, puntaje
from basico_ejercicio_001
where puntaje > 800.00
order by puntaje desc;