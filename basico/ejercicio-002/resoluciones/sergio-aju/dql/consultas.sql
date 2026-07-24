USE db_battle_royale;

-- 1. Ver jugadores activos ordenados por sus victorias
SELECT nombre_jugador, rango, victorias, precision_disparo 
FROM jugadores_br 
WHERE activo = TRUE 
ORDER BY victorias DESC;

-- 2. Ver el promedio de precisión de disparo agrupado por rango
SELECT rango, COUNT(*) AS total_jugadores, ROUND(AVG(precision_disparo), 2) AS promedio_precision 
FROM jugadores_br 
GROUP BY rango 
ORDER BY promedio_precision DESC;

-- 3. Top 3 de jugadores con más victorias (excluyendo inactivos)
SELECT nombre_jugador, rango, victorias 
FROM jugadores_br 
WHERE activo = TRUE 
ORDER BY victorias DESC 
LIMIT 3;

-- 4. Contar cuántos jugadores están activos y cuántos inactivos
SELECT activo, COUNT(*) AS cantidad 
FROM jugadores_br 
GROUP BY activo;

-- 5. Buscar jugadores de un rango específico con más de 20 victorias
SELECT nombre_jugador, rango, victorias, precision_disparo 
FROM jugadores_br 
WHERE rango = 'Diamante' AND victorias > 20;