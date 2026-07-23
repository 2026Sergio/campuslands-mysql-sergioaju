/* Script unificado de consultas SQL para el torneo eSports MOBA (INNER JOIN, Agregaciones por Relación, UPDATE, DELETE y Métricas Competitivas) */

SELECT 
    j.nickname,
    j.rol,
    j.kda_promedio,
    e.nombre_equipo,
    e.tag,
    e.region
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
WHERE e.region IN ('KR', 'CN') 
  AND j.kda_promedio >= 5.00;

SELECT 
    e.nombre_equipo,
    e.region,
    COUNT(j.jugador_id) AS total_jugadores,
    ROUND(AVG(j.kda_promedio), 2) AS kda_promedio_equipo,
    SUM(j.salario_mensual) AS nomina_total_mensual
FROM equipos e
INNER JOIN jugadores j ON e.equipo_id = j.equipo_id
GROUP BY e.equipo_id, e.nombre_equipo, e.region
HAVING kda_promedio_equipo > 4.20;

UPDATE jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
SET j.salario_mensual = j.salario_mensual * 1.12
WHERE e.region = 'EUW' 
  AND j.kda_promedio >= 4.50;

DELETE j FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
WHERE e.region = 'NA' 
  AND j.kda_promedio < 3.80;

SELECT 
    j.nickname,
    j.rol,
    j.kda_promedio,
    j.salario_mensual,
    e.nombre_equipo,
    e.tag
FROM jugadores j
INNER JOIN equipos e ON j.equipo_id = e.equipo_id
ORDER BY j.kda_promedio DESC
LIMIT 5;