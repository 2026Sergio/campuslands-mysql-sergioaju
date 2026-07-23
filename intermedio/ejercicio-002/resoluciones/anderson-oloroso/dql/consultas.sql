SELECT 
    j.jugador_id,
    j.nombre_jugador,
    j.region,
    r.puesto,
    r.puntos,
    r.temporada
FROM jugadores_battle_royale j
LEFT JOIN ranking_battle_royale r
    ON j.jugador_id = r.jugador_id;

SELECT 
    j.nombre_jugador,
    j.region,
    r.puesto,
    r.puntos
FROM jugadores_battle_royale j
LEFT JOIN ranking_battle_royale r
    ON j.jugador_id = r.jugador_id
WHERE r.ranking_id IS NULL;

SELECT 
    j.nombre_jugador,
    j.region,
    r.puesto,
    r.puntos
FROM jugadores_battle_royale j
LEFT JOIN ranking_battle_royale r
    ON j.jugador_id = r.jugador_id
WHERE r.puntos > 8000;

SELECT 
    j.nombre_jugador,
    j.nivel,
    r.puesto,
    r.puntos
FROM jugadores_battle_royale j
LEFT JOIN ranking_battle_royale r
    ON j.jugador_id = r.jugador_id
WHERE j.nivel >= 50
ORDER BY j.nivel DESC;

SELECT 
    j.region,
    COUNT(r.ranking_id) AS jugadores_ranked
FROM jugadores_battle_royale j
LEFT JOIN ranking_battle_royale r
    ON j.jugador_id = r.jugador_id
GROUP BY j.region
ORDER BY jugadores_ranked DESC;