-- DQL: 5 Consultas analíticas para el torneo
USE campuslands_mysql;

-- 1. Ranking de Jugadores por Puntos de Clasificación
SELECT 
    nickname,
    rol,
    nivel,
    puntos_clasificacion AS puntos,
    kda
FROM jugadores
WHERE estado = 'activo'
ORDER BY puntos_clasificacion DESC;

-- 2. Promedio de KDA y Puntos agrupados por Rol
SELECT 
    rol,
    COUNT(*) AS total_jugadores,
    ROUND(AVG(kda), 2) AS kda_promedio,
    ROUND(AVG(puntos_clasificacion), 0) AS puntos_promedio
FROM jugadores
GROUP BY rol
ORDER BY kda_promedio DESC;

-- 3. Jugadores Destacados (KDA mayor a 3.50 y Activos)
SELECT 
    nickname,
    rol,
    kda,
    puntos_clasificacion
FROM jugadores
WHERE kda > 3.50 AND estado = 'activo'
ORDER BY kda DESC;

-- 4. Conteo de Jugadores por Estado
SELECT 
    estado,
    COUNT(*) AS cantidad
FROM jugadores
GROUP BY estado;

-- 5. Top 3 Jugadores de Nivel Más Alto
SELECT 
    nickname,
    rol,
    nivel,
    puntos_clasificacion
FROM jugadores
ORDER BY nivel DESC
LIMIT 3;
