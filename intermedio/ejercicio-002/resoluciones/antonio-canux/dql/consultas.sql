-- Consultas base e indicadores usando LEFT JOIN.
USE campuslands_mysql;

SELECT e.nombre AS escuadron, e.region, j.nickname 
    FROM intermedio_ejercicio_002_escuadrones 
    e LEFT JOIN intermedio_ejercicio_002_jugadores 
    j ON e.id = j.escuadron_id;

SELECT e.nombre AS escuadron, COUNT(j.id) AS total_miembros 
    FROM intermedio_ejercicio_002_escuadrones 
    e LEFT JOIN intermedio_ejercicio_002_jugadores 
    j ON e.id = j.escuadron_id 
    GROUP BY e.id, e.nombre 
    ORDER BY total_miembros DESC;

SELECT e.nombre, e.region 
    FROM intermedio_ejercicio_002_escuadrones 
    e LEFT JOIN intermedio_ejercicio_002_jugadores 
    j ON e.id = j.escuadron_id 
    WHERE j.id IS NULL;

SELECT j.nickname, j.nivel, COALESCE(e.nombre, 'Sin Escuadron') AS escuadron 
    FROM intermedio_ejercicio_002_jugadores 
    j LEFT JOIN intermedio_ejercicio_002_escuadrones 
    e ON j.escuadron_id = e.id 
    ORDER BY j.nivel DESC;

SELECT e.region, ROUND(AVG(j.nivel), 2) AS nivel_promedio 
    FROM intermedio_ejercicio_002_escuadrones 
    e LEFT JOIN intermedio_ejercicio_002_jugadores 
    j ON e.id = j.escuadron_id 
    WHERE j.nivel IS NOT NULL 
    GROUP BY e.region 
    ORDER BY nivel_promedio DESC;