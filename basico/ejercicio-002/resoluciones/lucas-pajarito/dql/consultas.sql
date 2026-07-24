-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM battle_royale;

SELECT estado, COUNT(*), AVG(puntaje) AS promedio
FROM battle_royale
GROUP BY estado
ORDER BY promedio DESC;
