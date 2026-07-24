-- DQL: 5 Consultas utilizando Subconsultas en MySQL
USE campuslands_mysql;

-- 1. Trabajos con costo superior al costo promedio general del taller (Subconsulta en WHERE)
SELECT 
    trabajo_id,
    placa_moto,
    mecanico,
    tipo_reparacion,
    costo_total,
    (SELECT ROUND(AVG(costo_total), 2) FROM trabajos_taller_intermedio) AS promedio_general
FROM trabajos_taller_intermedio
WHERE costo_total > (SELECT AVG(costo_total) FROM trabajos_taller_intermedio)
ORDER BY costo_total DESC;

-- 2. Clientes atendidos por mecánicos cuyo promedio de horas laboradas por trabajo sea superior a 3 horas (Subconsulta con IN)
SELECT 
    placa_moto,
    cliente,
    mecanico,
    horas_laboradas
FROM trabajos_taller_intermedio
WHERE mecanico IN (
    SELECT mecanico
    FROM trabajos_taller_intermedio
    GROUP BY mecanico
    HAVING AVG(horas_laboradas) > 3.0
);

-- 3. Comparativa de cada trabajo contra el costo máximo de su mecánico asignado
SELECT 
    t.trabajo_id,
    t.mecanico,
    t.tipo_reparacion,
    t.costo_total,
    (
        SELECT MAX(sub.costo_total) 
        FROM trabajos_taller_intermedio sub 
        WHERE sub.mecanico = t.mecanico
    ) AS costo_maximo_mecanico
FROM trabajos_taller_intermedio t
WHERE t.estado = 'finalizado';

-- 4. Promedio de facturación agrupado utilizando una subconsulta en la cláusula FROM (Tabla derivada)
SELECT 
    resumen.mecanico,
    resumen.total_trabajos,
    ROUND(resumen.suma_facturada, 2) AS facturado_total
FROM (
    SELECT 
        mecanico, 
        COUNT(*) AS total_trabajos, 
        SUM(costo_total) AS suma_facturada
    FROM trabajos_taller_intermedio
    WHERE estado = 'finalizado'
    GROUP BY mecanico
) AS resumen
WHERE resumen.suma_facturada > 200.00;

-- 5. Trabajos cuyo costo es igual o mayor a cualquier trabajo realizado por 'Carlos Ruiz' (Uso de ALL)
SELECT 
    placa_moto,
    mecanico,
    tipo_reparacion,
    costo_total
FROM trabajos_taller_intermedio
WHERE costo_total >= ALL (
    SELECT costo_total 
    FROM trabajos_taller_intermedio 
    WHERE mecanico = 'Carlos Ruiz'
) AND mecanico != 'Carlos Ruiz';
