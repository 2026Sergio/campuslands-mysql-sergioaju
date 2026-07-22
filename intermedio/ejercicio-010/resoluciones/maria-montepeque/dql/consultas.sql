-- intermedio/ejercicio-010 - maria-montepeque
USE campuslands_mysql;

-- 1. Listado completo de pilotos (incluye a los dos homonimos "Kairo Vega",
--    distinguibles por su alias y licencia, ambos UNIQUE)
SELECT
    nombre,
    alias,
    licencia_piloto,
    vehiculo
FROM pilotos_carreras_urbanas
ORDER BY nombre, alias;

-- 2. Prueba de unicidad: ningun alias deberia repetirse (0 filas esperadas)
SELECT
    alias,
    COUNT(*) AS veces_repetido
FROM pilotos_carreras_urbanas
GROUP BY alias
HAVING COUNT(*) > 1;

-- 3. Top 5 pilotos por puntos de temporada
SELECT
    alias,
    nombre,
    puntos_temporada
FROM pilotos_carreras_urbanas
ORDER BY puntos_temporada DESC
LIMIT 5;

-- 4. Cantidad de pilotos activos por circuito
SELECT
    circuito_local,
    COUNT(*) AS pilotos_activos
FROM pilotos_carreras_urbanas
WHERE estado = 'activo'
GROUP BY circuito_local
ORDER BY pilotos_activos DESC;

-- 5. Buscar un piloto por su alias exacto (la forma correcta de identificarlo sin ambiguedad)
SELECT
    nombre,
    vehiculo,
    circuito_local,
    puntos_temporada
FROM pilotos_carreras_urbanas
WHERE alias = 'K-Vega';

-- 6. Nombres que pertenecen a mas de un piloto real (homonimos, ya que "nombre" no es UNIQUE)
SELECT
    nombre,
    COUNT(*) AS pilotos_con_este_nombre
FROM pilotos_carreras_urbanas
GROUP BY nombre
HAVING COUNT(*) > 1;
