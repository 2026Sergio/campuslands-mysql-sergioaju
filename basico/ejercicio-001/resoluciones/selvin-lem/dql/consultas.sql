-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

-- 1. Listado general
SELECT * FROM basico_ejercicio_001;

-- 2. Promedio de puntaje por categoria (rol)
SELECT categoria, COUNT(*) AS total_registros, AVG(puntaje) AS promedio
FROM basico_ejercicio_001
GROUP BY categoria
ORDER BY promedio DESC;

-- 3. Top 5 ranking general
SELECT nombre, categoria, puntaje
FROM basico_ejercicio_001
ORDER BY puntaje DESC
LIMIT 5;

-- 4. Jugadores activos con puntaje mayor a 70
SELECT nombre, categoria, puntaje
FROM basico_ejercicio_001
WHERE estado = 'activo' AND puntaje > 70
ORDER BY puntaje DESC;

-- 5. Registros en revision o inactivos (caso limite)
SELECT nombre, categoria, estado
FROM basico_ejercicio_001
WHERE estado IN ('revision', 'inactivo');