-- avanzado/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

-- 1. Estado actual de todas las motos, con su fecha de ultima modificacion
--    (las 6 motos que se actualizaron deben tener una fecha_ultima_modificacion
--    mas reciente que las que nunca se tocaron)
SELECT
    placa,
    precio,
    estado,
    fecha_ultima_modificacion
FROM motos_garaje_trg
ORDER BY fecha_ultima_modificacion DESC;

-- 2. Historial completo de cambios de precio (debe haber 3: MTA-101, MTA-105 x2)
SELECT
    m.placa,
    h.precio_anterior,
    h.precio_nuevo,
    h.fecha_cambio
FROM historial_precios_motos_trg AS h
JOIN motos_garaje_trg AS m ON m.id = h.moto_id
ORDER BY h.fecha_cambio;

-- 3. Historial completo de cambios de estado (debe haber 3: MTA-102, MTA-107, MTA-105)
SELECT
    m.placa,
    h.estado_anterior,
    h.estado_nuevo,
    h.fecha_cambio
FROM historial_estado_motos_trg AS h
JOIN motos_garaje_trg AS m ON m.id = h.moto_id
ORDER BY h.fecha_cambio;

-- 4. Motos que tuvieron cambio de precio Y de estado en la misma actualizacion (debe ser solo MTA-105)
SELECT DISTINCT
    m.placa
FROM motos_garaje_trg AS m
JOIN historial_precios_motos_trg AS hp ON hp.moto_id = m.id
JOIN historial_estado_motos_trg AS he ON he.moto_id = m.id;

-- 5. Cantidad de cambios de precio registrados por moto (confirma que solo se
--    registran cambios reales, no cada UPDATE ejecutado)
SELECT
    m.placa,
    COUNT(h.id) AS cambios_de_precio
FROM motos_garaje_trg AS m
JOIN historial_precios_motos_trg AS h ON h.moto_id = m.id
GROUP BY m.placa
ORDER BY cambios_de_precio DESC;

-- 6. Confirmar que la actualizacion "neutra" de MTA-103 NO genero historial
--    de precio ni de estado (0 filas esperadas en ambas tablas)
SELECT
    (SELECT COUNT(*) FROM historial_precios_motos_trg AS h JOIN motos_garaje_trg AS m ON m.id = h.moto_id WHERE m.placa = 'MTA-103') AS cambios_precio_mta103,
    (SELECT COUNT(*) FROM historial_estado_motos_trg AS h JOIN motos_garaje_trg AS m ON m.id = h.moto_id WHERE m.placa = 'MTA-103') AS cambios_estado_mta103;
