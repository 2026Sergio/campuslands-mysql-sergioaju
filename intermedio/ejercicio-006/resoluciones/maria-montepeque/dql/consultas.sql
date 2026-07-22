-- intermedio/ejercicio-006 - maria-montepeque
USE campuslands_mysql;

-- 1. Cada modelo con cada uno de sus colores disponibles (gracias a la 1FN, es un JOIN simple)
SELECT
    m.marca,
    m.modelo,
    c.color
FROM modelos_hiperdeportivos AS m
JOIN colores_disponibles_modelo AS c ON c.modelo_id = m.id
ORDER BY m.marca, m.modelo, c.color;

-- 2. Modelos disponibles en color "Negro" (filtro exacto, imposible de hacer
--    de forma confiable si el color estuviera dentro de una lista en una sola celda)
SELECT
    m.marca,
    m.modelo,
    m.precio
FROM modelos_hiperdeportivos AS m
JOIN colores_disponibles_modelo AS c ON c.modelo_id = m.id
WHERE c.color = 'Negro'
ORDER BY m.precio DESC;

-- 3. Cantidad de colores disponibles por modelo
SELECT
    m.marca,
    m.modelo,
    COUNT(c.id) AS total_colores
FROM modelos_hiperdeportivos AS m
JOIN colores_disponibles_modelo AS c ON c.modelo_id = m.id
GROUP BY m.marca, m.modelo
ORDER BY total_colores DESC;

-- 4. Modelos con mas de 3 colores disponibles
SELECT
    m.marca,
    m.modelo,
    COUNT(c.id) AS total_colores
FROM modelos_hiperdeportivos AS m
JOIN colores_disponibles_modelo AS c ON c.modelo_id = m.id
GROUP BY m.marca, m.modelo
HAVING COUNT(c.id) > 3;

-- 5. Modelo mas caro disponible en color "Blanco"
SELECT
    m.marca,
    m.modelo,
    m.precio
FROM modelos_hiperdeportivos AS m
JOIN colores_disponibles_modelo AS c ON c.modelo_id = m.id
WHERE c.color = 'Blanco'
ORDER BY m.precio DESC
LIMIT 1;

-- 6. Colores mas ofrecidos entre todos los modelos (cuantos modelos distintos lo tienen)
SELECT
    c.color,
    COUNT(DISTINCT c.modelo_id) AS modelos_que_lo_ofrecen
FROM colores_disponibles_modelo AS c
GROUP BY c.color
ORDER BY modelos_que_lo_ofrecen DESC;
