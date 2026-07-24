-- Consultas base e indicadores.
USE campuslands_mysql;

SELECT j.nickname, j.rango, p.posicion, p.eliminaciones 
    FROM intermedio_ejercicio_001_jugadores 
    j LEFT JOIN intermedio_ejercicio_001_partidas 
    p ON j.id = p.jugador_id;

SELECT j.nickname, COALESCE(SUM(p.eliminaciones), 0) AS total_eliminaciones 
    FROM intermedio_ejercicio_001_jugadores 
    j LEFT JOIN intermedio_ejercicio_001_partidas 
    p ON j.id = p.jugador_id GROUP BY j.id, j.nickname 
    ORDER BY total_eliminaciones DESC;

SELECT j.nickname, j.rango 
    FROM intermedio_ejercicio_001_jugadores 
    j LEFT JOIN intermedio_ejercicio_001_partidas 
    p ON j.id = p.jugador_id 
    WHERE p.id IS NULL;

SELECT j.nickname, ROUND(AVG(p.posicion), 2) AS posicion_promedio 
    FROM intermedio_ejercicio_001_jugadores 
    j LEFT JOIN intermedio_ejercicio_001_partidas 
    p ON j.id = p.jugador_id 
    WHERE p.posicion IS NOT NULL 
    GROUP BY j.id, j.nickname 
    ORDER BY posicion_promedio ASC;

SELECT j.rango, COUNT(p.id) AS total_partidas 
    FROM intermedio_ejercicio_001_jugadores 
    j LEFT JOIN intermedio_ejercicio_001_partidas 
    p ON j.id = p.jugador_id 
    GROUP BY j.rango 
    ORDER BY total_partidas DESC;