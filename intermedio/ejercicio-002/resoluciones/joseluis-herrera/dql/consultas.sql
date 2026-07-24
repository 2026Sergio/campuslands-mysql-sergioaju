SELECT 
    r.nombre_equipo, 
    r.puntos_ranking, 
    p.nombre_patrocinador 
FROM ranking_royale r
LEFT JOIN patrocinadores p ON r.id_equipo = p.id_equipo_patrocinado;