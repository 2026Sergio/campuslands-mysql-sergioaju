-- intermedio/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

-- 1. Motos con mas de 2 servicios registrados
SELECT
    placa,
    marca,
    COUNT(*) AS total_servicios
FROM registros_servicio_motos
GROUP BY placa, marca
HAVING COUNT(*) > 2
ORDER BY total_servicios DESC;

-- 2. Motos cuyo costo total en servicios supera los 400
SELECT
    placa,
    SUM(costo) AS costo_total
FROM registros_servicio_motos
GROUP BY placa
HAVING SUM(costo) > 400
ORDER BY costo_total DESC;

-- 3. Motos cuyo costo promedio por servicio supera los 200
SELECT
    placa,
    ROUND(AVG(costo), 2) AS costo_promedio
FROM registros_servicio_motos
GROUP BY placa
HAVING AVG(costo) > 200
ORDER BY costo_promedio DESC;

-- 4. Mecanicos que han realizado mas de 3 servicios
SELECT
    mecanico,
    COUNT(*) AS total_servicios
FROM registros_servicio_motos
GROUP BY mecanico
HAVING COUNT(*) > 3
ORDER BY total_servicios DESC;

-- 5. Tipos de servicio realizados 4 veces o mas
SELECT
    tipo_servicio,
    COUNT(*) AS total_realizados
FROM registros_servicio_motos
GROUP BY tipo_servicio
HAVING COUNT(*) >= 4
ORDER BY total_realizados DESC;

-- 6. Motos cuyo servicio individual mas caro supero los 300
SELECT
    placa,
    MAX(costo) AS servicio_mas_caro
FROM registros_servicio_motos
GROUP BY placa
HAVING MAX(costo) > 300
ORDER BY servicio_mas_caro DESC;
