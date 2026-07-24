use campuslands_mysql;

-- 1. ver todas las skins disponibles en la tienda
select id, nombre_skin, tipo_arma, rareza, precio_monedas 
from basico_ejercicio_003 
where estado = 'disponible';

-- 2. contar cuantas skins hay por rareza y sacar el precio promedio
select 
    rareza, 
    count(*) as total_skins, 
    avg(precio_monedas) as precio_promedio
from basico_ejercicio_003
where estado = 'disponible'
group by rareza
order by precio_promedio desc;

-- 3. top 3 skins mas caras de la tienda
select id, nombre_skin, tipo_arma, precio_monedas
from basico_ejercicio_003
where estado = 'disponible'
order by precio_monedas desc
limit 3;

-- 4. buscar skins de rifles de asalto
select nombre_skin, rareza, precio_monedas, estado
from basico_ejercicio_003
where tipo_arma = 'rifle de asalto';

-- 5. buscar skins legendarias o epicas con su ID unico
select id, nombre_skin, tipo_arma, rareza, precio_monedas
from basico_ejercicio_003
where rareza in ('legendario', 'epico')
order by precio_monedas desc;