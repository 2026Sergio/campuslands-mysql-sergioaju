use campuslands_mysql;

-- 1. ver todas las ordenes de trabajo pendientes o en proceso
select id, descripcion_servicio, tipo_mantenimiento, costo_estimado, estado 
from basico_ejercicio_005 
where estado in ('pendiente', 'en_proceso');

-- 2. total de ordenes y costo promedio segun el tipo de mantenimiento
select 
    tipo_mantenimiento, 
    count(*) as total_servicios, 
    avg(costo_estimado) as costo_promedio
from basico_ejercicio_005
group by tipo_mantenimiento
order by costo_promedio desc;

-- 3. total recaudado en servicios que ya fueron completados
select 
    count(*) as servicios_completados, 
    sum(costo_estimado) as total_recaudado
from basico_ejercicio_005
where estado = 'completado';

-- 4. top 3 servicios mas costosos del taller
select id, descripcion_servicio, tipo_mantenimiento, costo_estimado
from basico_ejercicio_005
order by costo_estimado desc
limit 3;

-- 5. buscar mantenimientos preventivos que cuesten menos de 50 dolares
select id, descripcion_servicio, costo_estimado, estado
from basico_ejercicio_005
where tipo_mantenimiento = 'preventivo' and costo_estimado < 50.00;