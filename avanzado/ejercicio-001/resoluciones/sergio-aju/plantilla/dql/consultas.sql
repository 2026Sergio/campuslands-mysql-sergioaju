USE db_moba_transacciones;

-- 1. Listado general de equipos ordenados por sus fondos de premio disponibles
SELECT nombre, region, fondos_premio 
FROM equipos 
ORDER BY fondos_premio DESC;

-- 2. Historial detallado de transferencias con los nombres de los equipos involucrados (usando INNER JOIN)
SELECT 
    th.id AS id_transaccion,
    e1.nombre AS equipo_origen,
    e2.nombre AS equipo_destino,
    th.monto,
    th.fecha_transferencia
FROM transferencias_historial th
INNER JOIN equipos e1 ON th.id_equipo_origen = e1.id
INNER JOIN equipos e2 ON th.id_equipo_destino = e2.id
ORDER BY th.fecha_transferencia DESC;

-- 3. Promedio y total de fondos acumulados por región en el torneo
SELECT 
    region,
    COUNT(*) AS total_equipos,
    ROUND(AVG(fondos_premio), 2) AS promedio_fondos,
    ROUND(SUM(fondos_premio), 2) AS suma_total_fondos
FROM equipos
GROUP BY region
ORDER BY suma_total_fondos DESC;

-- 4. Top 3 de equipos con mayores fondos de premio en el torneo
SELECT nombre, region, fondos_premio 
FROM equipos 
ORDER BY fondos_premio DESC 
LIMIT 3;

-- 5. Equipos que poseen fondos superiores al promedio general de todos los equipos (Subconsulta)
SELECT nombre, region, fondos_premio 
FROM equipos 
WHERE fondos_premio > (SELECT AVG(fondos_premio) FROM equipos)
ORDER BY fondos_premio DESC;