USE campuslands_mysql;

-- 1. Reparaciones actuales, confirmando que el costo negativo quedo en 0
SELECT id_reparacion, propietario, marca, costo, estado
FROM garaje_reparaciones_trigger
ORDER BY id_reparacion;

-- 2. Historial completo de auditoria generado automaticamente
SELECT a.id_reparacion, r.propietario, a.estado_anterior, a.estado_nuevo, a.fecha_cambio
FROM garaje_auditoria a
INNER JOIN garaje_reparaciones_trigger r ON a.id_reparacion = r.id_reparacion
ORDER BY a.fecha_cambio;

-- 3. Reparaciones con mas de un cambio de estado registrado
SELECT id_reparacion, COUNT(*) AS total_cambios
FROM garaje_auditoria
GROUP BY id_reparacion
HAVING total_cambios > 1;

-- 4. Reparacion que tuvo el costo corregido por el trigger (caso limite)
SELECT propietario, marca, costo
FROM garaje_reparaciones_trigger
WHERE propietario = 'Diego Say';

-- 5. Reparaciones finalizadas segun la auditoria
SELECT a.id_reparacion, r.propietario, a.fecha_cambio
FROM garaje_auditoria a
INNER JOIN garaje_reparaciones_trigger r ON a.id_reparacion = r.id_reparacion
WHERE a.estado_nuevo = 'finalizada';