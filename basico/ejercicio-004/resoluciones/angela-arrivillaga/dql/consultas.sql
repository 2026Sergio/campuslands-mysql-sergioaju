use campuslands_mysql;

-- 1. ver todas las motos que estan disponibles para alquiler
select id, marca_modelo, tipo_moto, cilindrada_cc, precio_alquiler_dia 
from basico_ejercicio_004 
where estado = 'disponible';

-- 2. contar cuantas motos hay por tipo y el precio promedio de alquiler por dia
select 
    tipo_moto, 
    count(*) as total_motos, 
    avg(precio_alquiler_dia) as precio_promedio_dia
from basico_ejercicio_004
group by tipo_moto
order by precio_promedio_dia desc;

-- 3. buscar motos de alta cilindrada (mayores o iguales a 600 cc)
select marca_modelo, tipo_moto, cilindrada_cc, precio_alquiler_dia
from basico_ejercicio_004
where cilindrada_cc >= 600
order by cilindrada_cc desc;

-- 4. top 3 motos con el precio de alquiler mas economico
select id, marca_modelo, tipo_moto, precio_alquiler_dia
from basico_ejercicio_004
where estado = 'disponible'
order by precio_alquiler_dia asc
limit 3;

-- 5. ver las motos que se encuentran en mantenimiento o alquiladas
select id, marca_modelo, tipo_moto, estado
from basico_ejercicio_004
where estado in ('mantenimiento', 'alquilada');