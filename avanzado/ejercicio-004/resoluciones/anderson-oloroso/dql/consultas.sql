SELECT 
    moto_id,
    marca,
    modelo,
    estado,
    precio
FROM garaje_motos
WHERE estado = 'Disponible'
ORDER BY precio DESC;

SELECT 
    marca,
    COUNT(*) AS cantidad_motos
FROM garaje_motos
GROUP BY marca
ORDER BY cantidad_motos DESC;

SELECT 
    marca,
    AVG(precio) AS precio_promedio
FROM garaje_motos
GROUP BY marca
ORDER BY precio_promedio DESC;

SELECT 
    h.historial_id,
    h.moto_id,
    g.marca,
    g.modelo,
    h.accion,
    h.fecha_accion,
    h.descripcion
FROM historial_garaje_motos h
INNER JOIN garaje_motos g
    ON h.moto_id = g.moto_id
ORDER BY h.fecha_accion ASC;

SELECT 
    accion,
    COUNT(*) AS cantidad_acciones
FROM historial_garaje_motos
GROUP BY accion
ORDER BY cantidad_acciones DESC;