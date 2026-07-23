
SELECT 
    tipo_mantenimiento,
    COUNT(mantenimiento_id) AS total_servicios,
    SUM(costo_total) AS facturacion_total,
    ROUND(AVG(costo_total), 2) AS costo_promedio,
    ROUND(AVG(horas_trabajadas), 1) AS horas_promedio
FROM mantenimientos_motos
WHERE cilindrada >= 250
GROUP BY tipo_mantenimiento
HAVING COUNT(mantenimiento_id) >= 3 
   AND AVG(costo_total) > 200.00;

SELECT 
    m.mecanico_id,
    m.nombre,
    m.especialidad,
    COUNT(mm.mantenimiento_id) AS total_mantenimientos,
    SUM(mm.horas_trabajadas) AS total_horas,
    SUM(mm.costo_total) AS total_generado
FROM mecanicos m
INNER JOIN mantenimientos_motos mm ON m.mecanico_id = mm.mecanico_id
GROUP BY m.mecanico_id, m.nombre, m.especialidad
HAVING SUM(mm.horas_trabajadas) > 10.0 
   AND SUM(mm.costo_total) >= 1500.00;

UPDATE mecanicos
SET salario_base = salario_base * 1.10
WHERE mecanico_id IN (
    SELECT mecanico_id
    FROM mantenimientos_motos
    GROUP BY mecanico_id
    HAVING COUNT(mantenimiento_id) >= 5 
       AND AVG(costo_total) > 300.00
);

DELETE FROM mecanicos
WHERE mecanico_id IN (
    SELECT m.mecanico_id
    FROM (SELECT * FROM mecanicos) AS m
    LEFT JOIN mantenimientos_motos mm ON m.mecanico_id = mm.mecanico_id
    GROUP BY m.mecanico_id
    HAVING COUNT(mm.mantenimiento_id) < 3 
       OR SUM(COALESCE(mm.horas_trabajadas, 0)) < 5.0
);

SELECT 
    m.nombre AS nombre_mecanico,
    m.especialidad,
    COUNT(mm.mantenimiento_id) AS trabajos_realizados,
    ROUND(AVG(mm.costo_total), 2) AS ticket_promedio,
    SUM(mm.costo_total) AS ingresos_totales
FROM mecanicos m
INNER JOIN mantenimientos_motos mm ON m.mecanico_id = mm.mecanico_id
GROUP BY m.mecanico_id, m.nombre, m.especialidad
HAVING COUNT(mm.mantenimiento_id) >= 2
ORDER BY ticket_promedio DESC
LIMIT 5;