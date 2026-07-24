USE campuslands_mysql;

-- 1. Tabla de Posiciones/Ranking por Premios Acumulados
SELECT 
    e.nombre AS equipo,
    e.region,
    e.estado,
    CONCAT('$ ', FORMAT(e.fondo_premios, 2)) AS premios_totales
FROM equipos e
ORDER BY e.fondo_premios DESC;

-- 2. Rendimiento de Equipos: Victorias por Equipo
SELECT 
    e.nombre AS equipo,
    e.region,
    COUNT(p.partida_id) AS victorias_totales
FROM equipos e
JOIN partidas p ON e.equipo_id = p.ganador_id
GROUP BY e.equipo_id, e.nombre, e.region
ORDER BY victorias_totales DESC;

-- 3. Promedio de Duración de Partidas por Fase
SELECT 
    fase,
    COUNT(*) AS partidas_jugadas,
    ROUND(AVG(duracion_segundos) / 60, 2) AS duracion_promedio_min
FROM partidas
GROUP BY fase
ORDER BY duracion_promedio_min DESC;

-- 4. Historial Completo de Partidas
SELECT 
    p.partida_id,
    p.fase,
    e1.nombre AS equipo_azul,
    e2.nombre AS equipo_rojo,
    eg.nombre AS ganador,
    ROUND(p.duracion_segundos / 60, 1) AS duracion_minutos
FROM partidas p
JOIN equipos e1 ON p.equipo_azul_id = e1.equipo_id
JOIN equipos e2 ON p.equipo_rojo_id = e2.equipo_id
LEFT JOIN equipos eg ON p.ganador_id = eg.equipo_id
ORDER BY p.fecha_partida DESC;

-- 5. Reporte de Auditoría de Transferencias de Premios
SELECT 
    t.transferencia_id,
    COALESCE(eo.nombre, 'Pozo General Torneo') AS origen,
    ed.nombre AS equipo_destino,
    CONCAT('$ ', FORMAT(t.monto, 2)) AS monto_transf,
    t.concepto,
    t.fecha_transaccion
FROM transferencias_premios t
JOIN equipos ed ON t.equipo_destino_id = ed.equipo_id
LEFT JOIN equipos eo ON t.equipo_origen_id = eo.equipo_id;
