-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM intermedio_ejercicio_003;

SELECT *
FROM inventario_skins_shooter;

SELECT skin, juego, precio
FROM inventario_skins_shooter
WHERE estado = 'disponible';

SELECT skin, juego, precio
FROM inventario_skins_shooter
WHERE rareza = 'Legendaria';

SELECT skin, juego, precio
FROM inventario_skins_shooter
ORDER BY precio DESC;

SELECT skin, juego, precio
FROM inventario_skins_shooter
ORDER BY precio DESC
LIMIT 5;