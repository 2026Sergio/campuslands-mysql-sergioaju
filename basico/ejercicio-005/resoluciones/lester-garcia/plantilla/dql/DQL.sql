SELECT
servicio,
fecha,
costo
FROM reparaciones
WHERE estado='Finalizada';

SELECT
servicio,
costo
FROM reparaciones
ORDER BY costo DESC;

SELECT
AVG(costo) AS costo_promedio
FROM reparaciones;