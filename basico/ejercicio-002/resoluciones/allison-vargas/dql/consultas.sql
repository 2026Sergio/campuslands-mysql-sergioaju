-- DQL: 5 Consultas analíticas
USE campuslands_mysql;

-- 1. Leaderboard Global ordenado por Puntuación de Temporada
SELECT 
    tag_jugador,
    nivel_cuenta,
    puntuacion_temporada AS puntos,
    porcentaje_precisión AS precisión,
    modo_preferido
FROM estadisticas_br
WHERE estado = 'activo'
ORDER BY puntuacion_temporada DESC;

-- 2. Promedio de Precisión y Puntos por Modo Preferido
SELECT 
    modo_preferido,
    COUNT(*) AS total_jugadores,
    ROUND(AVG(porcentaje_precisión), 2) AS precision_promedio,
    ROUND(AVG(puntuacion_temporada), 2) AS puntos_promedio
FROM estadisticas_br
GROUP BY modo_preferido
ORDER BY puntos_promedio DESC;

-- 3. Jugadores VIP (Con Pase de Batalla Activo y Puntuación > 2000)
SELECT 
    tag_jugador,
    nivel_cuenta,
    puntuacion_temporada,
    IF(pase_batalla_activo, 'Sí', 'No') AS pase_activo
FROM estadisticas_br
WHERE pase_batalla_activo = TRUE AND puntuacion_temporada > 2000.00
ORDER BY nivel_cuenta DESC;

-- 4. Distribución de Jugadores por Estado de Cuenta
SELECT 
    estado,
    COUNT(*) AS cantidad_jugadores
FROM estadisticas_br
GROUP BY estado;

-- 5. Top 3 Jugadores con Mayor Porcentaje de Precisión
SELECT 
    tag_jugador,
    nivel_cuenta,
    CONCAT(porcentaje_precisión, '%') AS precisión,
    modo_preferido
FROM estadisticas_br
WHERE estado = 'activo'
ORDER BY porcentaje_precisión DESC
LIMIT 3;
