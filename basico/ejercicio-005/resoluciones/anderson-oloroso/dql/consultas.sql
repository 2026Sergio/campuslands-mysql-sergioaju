SELECT * FROM taller_mecanico_motos;

SELECT * FROM taller_mecanico_motos
WHERE estado = 'Completado';

SELECT * FROM taller_mecanico_motos
WHERE costo > 700000
ORDER BY costo DESC;

SELECT tipo_servicio, COUNT(*) AS cantidad_servicios
FROM taller_mecanico_motos
GROUP BY tipo_servicio
ORDER BY cantidad_servicios DESC;

SELECT marca_moto, AVG(costo) AS costo_promedio
FROM taller_mecanico_motos
GROUP BY marca_moto
ORDER BY costo_promedio DESC;