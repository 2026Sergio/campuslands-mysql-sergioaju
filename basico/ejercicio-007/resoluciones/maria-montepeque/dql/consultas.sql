-- basico/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

-- 1. Tabla de posiciones: puntos desc, con diferencia de goles como criterio de desempate
SELECT
    equipo,
    puntos,
    (goles_favor - goles_contra) AS diferencia_goles
FROM equipos_liga_futbol
ORDER BY puntos DESC, diferencia_goles DESC;

-- 2. Equipos ordenados alfabeticamente
SELECT
    equipo,
    ciudad
FROM equipos_liga_futbol
ORDER BY equipo ASC;

-- 3. Top 3 mejores ataques (mas goles a favor)
SELECT
    equipo,
    goles_favor
FROM equipos_liga_futbol
ORDER BY goles_favor DESC
LIMIT 3;

-- 4. Peores defensas (mas goles en contra primero)
SELECT
    equipo,
    goles_contra
FROM equipos_liga_futbol
ORDER BY goles_contra DESC;

-- 5. Equipos ordenados por mas victorias y, en empate, por menos derrotas
SELECT
    equipo,
    victorias,
    derrotas
FROM equipos_liga_futbol
ORDER BY victorias DESC, derrotas ASC;

-- 6. Equipos agrupados por ciudad y luego por nombre
SELECT
    ciudad,
    equipo
FROM equipos_liga_futbol
ORDER BY ciudad ASC, equipo ASC;
