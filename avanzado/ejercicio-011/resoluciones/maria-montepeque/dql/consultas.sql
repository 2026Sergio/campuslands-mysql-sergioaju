-- avanzado/ejercicio-011 - maria-montepeque
USE campuslands_mysql;

-- 1. CTE simple (no recursivo) para dar nombre y reutilizar un resumen que,
--    sin CTE, habria que repetir como subconsulta en el FROM.
WITH resumen_jugador AS (
    SELECT
        jugador,
        COUNT(*) AS total_entrenamientos,
        SUM(duracion_minutos) AS minutos_totales
    FROM entrenamientos_pingpong_cte
    GROUP BY jugador
)
SELECT *
FROM resumen_jugador
ORDER BY minutos_totales DESC;

-- 2. CTE combinado con ROW_NUMBER() para armar un ranking de jugadores por
--    minutos totales entrenados.
WITH resumen_jugador AS (
    SELECT
        jugador,
        SUM(duracion_minutos) AS minutos_totales
    FROM entrenamientos_pingpong_cte
    GROUP BY jugador
)
SELECT
    ROW_NUMBER() OVER (ORDER BY minutos_totales DESC) AS posicion,
    jugador,
    minutos_totales
FROM resumen_jugador;

-- 3. CTE RECURSIVO (patron classico): genera la secuencia de numeros 1 a 10.
--    Es la forma mas simple de ver el mecanismo: un caso base (ancla) y un
--    caso recursivo que se referencia a si mismo hasta cumplir la condicion.
WITH RECURSIVE numeros AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numeros WHERE n < 10
)
SELECT n FROM numeros;

-- 4. CTE RECURSIVO aplicado al negocio: genera cada dia del calendario entre
--    2026-07-01 y 2026-07-14 (aunque no haya entrenamientos ese dia) y lo
--    cruza con la tabla real via LEFT JOIN. Sin el CTE recursivo, los dias
--    sin entrenamientos simplemente no apareceriaan en el resultado.
WITH RECURSIVE calendario AS (
    SELECT DATE('2026-07-01') AS dia
    UNION ALL
    SELECT dia + INTERVAL 1 DAY
    FROM calendario
    WHERE dia < '2026-07-14'
)
SELECT
    calendario.dia,
    COUNT(e.id) AS total_entrenamientos,
    COALESCE(SUM(e.duracion_minutos), 0) AS minutos_entrenados
FROM calendario
LEFT JOIN entrenamientos_pingpong_cte AS e ON e.fecha_entrenamiento = calendario.dia
GROUP BY calendario.dia
ORDER BY calendario.dia;

-- 5. Reutilizando el mismo CTE recursivo del calendario: dias SIN ningun
--    entrenamiento registrado (los "huecos" que el CTE hizo visibles).
WITH RECURSIVE calendario AS (
    SELECT DATE('2026-07-01') AS dia
    UNION ALL
    SELECT dia + INTERVAL 1 DAY
    FROM calendario
    WHERE dia < '2026-07-14'
)
SELECT calendario.dia AS dia_sin_entrenamiento
FROM calendario
LEFT JOIN entrenamientos_pingpong_cte AS e ON e.fecha_entrenamiento = calendario.dia
WHERE e.id IS NULL
ORDER BY calendario.dia;

-- 6. CTE simple usado para simplificar una comparacion contra un promedio:
--    jugadores cuyo total de minutos supera el promedio general de todos
--    los jugadores (sin CTE, el promedio habria que repetirlo como subconsulta).
WITH resumen_jugador AS (
    SELECT
        jugador,
        SUM(duracion_minutos) AS minutos_totales
    FROM entrenamientos_pingpong_cte
    GROUP BY jugador
)
SELECT
    jugador,
    minutos_totales
FROM resumen_jugador
WHERE minutos_totales > (SELECT AVG(minutos_totales) FROM resumen_jugador)
ORDER BY minutos_totales DESC;
