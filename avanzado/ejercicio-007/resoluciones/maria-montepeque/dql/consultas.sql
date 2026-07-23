-- avanzado/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

-- 1. Todos los goles con jugador, equipo y datos del partido (vista base con JOIN)
SELECT *
FROM vista_goleadores_liga
ORDER BY fecha_partido, minuto;

-- 2. Ranking de goleadores (vista construida SOBRE la vista anterior, con GROUP BY)
SELECT *
FROM vista_ranking_goleadores_liga
ORDER BY total_goles DESC;

-- 3. Resumen de goles por partido, con ambos equipos (vista agregada con JOIN)
SELECT *
FROM vista_resumen_partidos_liga
ORDER BY total_goles DESC;

-- 4. Solo los jugadores activos (vista de una tabla, filtrada y actualizable)
SELECT *
FROM vista_jugadores_activos_liga
ORDER BY nombre;

-- 5. Confirmar que el UPDATE hecho A TRAVES de la vista (dorsal de Mateo Rivas)
--    se aplico correctamente sobre la tabla base
SELECT
    nombre,
    dorsal,
    estado
FROM jugadores_liga_futbol_view
WHERE nombre = 'Mateo Rivas';

-- 6. Comparar cuantos jugadores hay en la tabla base vs en la vista filtrada
--    (la diferencia son los 2 jugadores que no estan "activo": Ruben Casal y Bruno Salas)
SELECT
    (SELECT COUNT(*) FROM jugadores_liga_futbol_view) AS total_jugadores,
    (SELECT COUNT(*) FROM vista_jugadores_activos_liga) AS jugadores_activos;
