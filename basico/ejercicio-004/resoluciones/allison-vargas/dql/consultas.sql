-- DQL: 5 Consultas para la verificación e inspección de datos insertados
USE campuslands_mysql;

-- 1. Listado completo de motocicletas registradas
SELECT 
    moto_id,
    placa,
    CONCAT(marca, ' ', modelo) AS motocicleta,
    anio,
    precio_alquiler_dia,
    IF(disponible, 'Disponible', 'No disponible') AS estado_alquiler
FROM motos_basico
ORDER BY moto_id ASC;

-- 2. Motocicletas disponibles para alquiler con tarifa ordenada de menor a mayor
SELECT 
    placa,
    marca,
    modelo,
    precio_alquiler_dia
FROM motos_basico
WHERE disponible = TRUE
ORDER BY precio_alquiler_dia ASC;

-- 3. Promedio de tarifa diaria y conteo de motos agrupadas por Marca
SELECT 
    marca,
    COUNT(*) AS cantidad_motos,
    ROUND(AVG(precio_alquiler_dia), 2) AS tarifa_promedio
FROM motos_basico
GROUP BY marca
ORDER BY cantidad_motos DESC;

-- 4. Motocicletas que se encuentran actualmente en taller/mantenimiento
SELECT 
    placa,
    marca,
    modelo,
    estado
FROM motos_basico
WHERE estado = 'mantenimiento';

-- 5. Top 3 motocicletas más recientes (por año de fabricación)
SELECT 
    placa,
    marca,
    modelo,
    anio,
    precio_alquiler_dia
FROM motos_basico
ORDER BY anio DESC, precio_alquiler_dia DESC
LIMIT 3;
