-- consultas usando subconsultas en MySQL
USE campuslands_mysql;

-- 1. buscar reparaciones con costo mayor al costo promedio de todo el taller
SELECT 
    moto,
    tipo_servicio,
    costo
FROM reparaciones
WHERE costo > (
    SELECT AVG(costo) 
    FROM reparaciones
);

-- 2. listar las motos que tienen los tipos de servicio mas caros (servicios con costo mayor a 100)
SELECT 
    moto,
    tipo_servicio,
    costo,
    estado
FROM reparaciones
WHERE tipo_servicio IN (
    SELECT tipo_servicio
    FROM reparaciones
    WHERE costo > 100.00
);

-- 3. mostrar la lista de reparaciones indicando la diferencia respecto al costo promedio
SELECT 
    moto,
    costo,
    (costo - (SELECT AVG(costo) FROM reparaciones)) AS diferencia_con_promedio
FROM reparaciones;

-- 4. obtener la lista de reparaciones con el precio mas alto registrado en el taller
SELECT 
    moto,
    tipo_servicio,
    costo
FROM reparaciones
WHERE costo = (
    SELECT MAX(costo) 
    FROM reparaciones
);

-- 5. consultar los servicios cuyo costo sea menor al promedio de las reparaciones completadas
SELECT 
    moto,
    tipo_servicio,
    costo,
    estado
FROM reparaciones
WHERE costo < (
    SELECT AVG(costo)
    FROM reparaciones
    WHERE estado = 'completado'
);