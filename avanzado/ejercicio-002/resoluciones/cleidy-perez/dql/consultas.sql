-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

-- ==============================================================================
-- Consulta 1: Probar Stored Procedure 1 (Registrar partida para NoobMaster)
-- ==============================================================================
CALL sp_registrar_partida(8, 'Oro', 2150.00, 1);

-- ==============================================================================
-- Consulta 2: Probar Stored Procedure 2 (Obtener Top 2 de LATAM Norte)
-- ==============================================================================
CALL sp_obtener_ranking_region('LATAM Norte', 2);

-- ==============================================================================
-- Consulta 3: Ranking general global con promedios y máximos
-- ==============================================================================
SELECT 
    j.nickname,
    j.region,
    j.nivel,
    COALESCE(SUM(p.puntaje), 0) AS puntaje_acumulado,
    COALESCE(AVG(p.puntaje), 0) AS promedio_puntaje,
    COALESCE(MIN(p.posicion_final), 0) AS mejor_posicion
FROM jugadores j
LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
WHERE j.estado = 'activo'
GROUP BY j.id_jugador, j.nickname, j.region, j.nivel
ORDER BY puntaje_acumulado DESC;

-- ==============================================================================
-- Consulta 4: Consulta de casos límite (Jugadores sin partidas o inactivosa)
-- ==============================================================================
SELECT 
    j.nickname,
    j.estado,
    j.region
FROM jugadores j
LEFT JOIN partidas p ON j.id_jugador = p.id_jugador
WHERE p.id_partida IS NULL OR j.estado != 'activo';

-- ==============================================================================
-- Consulta 5: Estadísticas agrupadas por categoría
-- ==============================================================================
SELECT 
    categoria,
    COUNT(id_partida) AS total_partidas,
    AVG(puntaje) AS puntaje_promedio,
    MAX(puntaje) AS puntaje_maximo
FROM partidas
GROUP BY categoria
ORDER BY puntaje_promedio DESC;
