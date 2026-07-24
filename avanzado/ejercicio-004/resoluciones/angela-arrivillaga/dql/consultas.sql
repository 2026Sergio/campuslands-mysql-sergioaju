-- campuslands mysql - avanzado ejercicio 004
-- dql/consultas.sql

USE campuslands_mysql;

-- 1. Consultar el historial de auditoria con los datos de las motos
SELECT 
    h.id AS historial_id,
    m.marca,
    m.modelo,
    h.mensaje,
    h.fecha
FROM historial_motos h
JOIN motos m ON h.moto_id = m.id
ORDER BY h.id DESC;

-- 2. Lista completa de motos disponibles ordenadas por precio (de mayor a menor)
SELECT 
    id,
    marca,
    modelo,
    cilindraje,
    precio,
    estado
FROM motos
WHERE estado = 'disponible'
ORDER BY precio DESC;

-- 3. Conteo de motos y promedio de precio segun el estado
SELECT 
    estado,
    COUNT(*) AS total_motos,
    AVG(precio) AS promedio_precio
FROM motos
GROUP BY estado
ORDER BY total_motos DESC;

-- 4. Motos de alto cilindraje (mayor a 400cc)
SELECT 
    marca,
    modelo,
    cilindraje,
    precio
FROM motos
WHERE cilindraje > 400 AND estado = 'disponible'
ORDER BY cilindraje DESC;

-- 5. Resumen general del inventario
SELECT 
    COUNT(*) AS cantidad_total,
    SUM(precio) AS valor_total_inventario,
    MIN(precio) AS moto_mas_barata,
    MAX(precio) AS moto_mas_costosa
FROM motos;