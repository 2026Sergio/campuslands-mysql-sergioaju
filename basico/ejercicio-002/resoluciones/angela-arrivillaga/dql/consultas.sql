use campuslands_mysql;

-- 1. ver todos los jugadores activos en la temporada
select id, nickname, rango, bajas_totales, puntaje_ranking 
from basico_ejercicio_002 
where estado = 'activo';

-- 2. promedio de bajas y puntaje agrupados por rango
select 
    rango, 
    count(*) as total_jugadores, 
    avg(bajas_totales) as promedio_bajas,
    avg(puntaje_ranking) as promedio_puntaje
from basico_ejercicio_002
where estado = 'activo'
group by rango
order by promedio_puntaje desc;

-- 3. top 3 mejores jugadores (podio de la temporada)
select nickname, rango, ratio_victorias, puntaje_ranking
from basico_ejercicio_002
where estado = 'activo'
order by puntaje_ranking desc
limit 3;

-- 4. buscar jugadores sospechosos o baneados
select nickname, rango, bajas_totales, estado
from basico_ejercicio_002
where estado = 'baneado';

-- 5. jugadores pro con mas del 50% de victorias
select nickname, rango, ratio_victorias, puntaje_ranking
from basico_ejercicio_002
where ratio_victorias >= 50.00 and estado = 'activo'
order by ratio_victorias desc;