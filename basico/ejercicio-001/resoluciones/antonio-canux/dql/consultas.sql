-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT estado, COUNT(*) AS total
FROM basico_ejercicio_001
GROUP BY estado;

SELECT categoria, AVG(puntaje) AS promedio_puntaje
FROM basico_ejercicio_001
GROUP BY categoria;

SELECT nombre, categoria, puntaje
FROM basico_ejercicio_001
WHERE estado = 'activo'
  AND puntaje > 50
ORDER BY puntaje DESC;

SELECT categoria,
       MAX(puntaje) AS puntaje_maximo,
       MIN(puntaje) AS puntaje_minimo
FROM basico_ejercicio_001
GROUP BY categoria;

SELECT estado,
       COUNT(*) AS cantidad,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM basico_ejercicio_001), 2) AS porcentaje
FROM basico_ejercicio_001
GROUP BY estado;