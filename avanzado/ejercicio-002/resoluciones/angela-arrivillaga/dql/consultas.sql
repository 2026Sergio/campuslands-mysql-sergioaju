-- consultas para revisar el ranking y probar el procedimiento de reporte
USE campuslands_mysql;

-- 1. probar el procedimiento almacenado para obtener el top 2 de rango 'Heroe'
CALL obtener_top_jugadores('Heroe', 2);

-- 2. consultar la tabla general de posiciones ordenada por puntos de mayor a menor
SELECT 
    id,
    nickname,
    rango,
    bajas_totales,
    puntos,
    estado
FROM jugadores_br
ORDER BY puntos DESC;

-- 3. promedio de puntos y bajas totales por cada rango de juego
SELECT 
    rango,
    COUNT(*) AS total_jugadores,
    AVG(puntos) AS promedio_puntos,
    AVG(bajas_totales) AS promedio_bajas
FROM jugadores_br
WHERE estado = 'activo'
GROUP BY rango
ORDER BY promedio_puntos DESC;

-- 4. buscar jugadores activos con mas de 1500 puntos
SELECT 
    nickname,
    rango,
    puntos
FROM jugadores_br
WHERE estado = 'activo' AND puntos > 1500
ORDER BY puntos DESC;

-- 5. contar cuantos jugadores hay segun su estado (activo, suspendido, inactivo)
SELECT 
    estado,
    COUNT(*) AS cantidad
FROM jugadores_br
GROUP BY estado;