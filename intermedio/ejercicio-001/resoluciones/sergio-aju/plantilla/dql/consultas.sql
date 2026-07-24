USE db_moba_torneo;

-- 1. Jugadores con su equipo y región
SELECT j.alias, j.rol, j.kda, e.nombre AS equipo, e.region 
FROM jugadores j 
INNER JOIN equipos e ON j.id_equipo = e.id 
ORDER BY j.kda DESC;

-- 2. Promedio de KDA por equipo
SELECT e.nombre AS equipo, COUNT(j.id) AS total_jugadores, ROUND(AVG(j.kda), 2) AS promedio_kda 
FROM equipos e 
INNER JOIN jugadores j ON e.id = j.id_equipo 
GROUP BY e.id, e.nombre 
ORDER BY promedio_kda DESC;

-- 3. Top 3 jugadores con mejor KDA en equipos activos
SELECT j.alias, j.rol, j.kda, e.nombre AS equipo 
FROM jugadores j 
INNER JOIN equipos e ON j.id_equipo = e.id 
WHERE e.estado = 'Activo' 
ORDER BY j.kda DESC 
LIMIT 3;

-- 4. Jugadores de la región Latinoamérica
SELECT j.alias, j.rol, j.kda, e.nombre AS equipo 
FROM jugadores j 
INNER JOIN equipos e ON j.id_equipo = e.id 
WHERE e.region = 'Latinoamérica';

-- 5. Rendimiento promedio por rol
SELECT j.rol, COUNT(j.id) AS total, ROUND(AVG(j.kda), 2) AS kda_promedio 
FROM jugadores j 
INNER JOIN equipos e ON j.id_equipo = e.id 
GROUP BY j.rol 
ORDER BY kda_promedio DESC;