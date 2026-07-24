-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM avanzado_ejercicio_003;

SELECT *
FROM avanzado_ejercicio_003;

SELECT nombre_skin, videojuego, precio
FROM avanzado_ejercicio_003
WHERE estado = 'disponible';

SELECT nombre_skin, videojuego, precio
FROM avanzado_ejercicio_003
WHERE rareza = 'Legendaria';

SELECT nombre_skin, videojuego, precio
FROM avanzado_ejercicio_003
WHERE rareza = 'Legendaria' AND estado = 'disponible'
ORDER BY precio DESC;

SELECT videojuego, COUNT(*) AS cantidad_skins
FROM avanzado_ejercicio_003
GROUP BY videojuego;
