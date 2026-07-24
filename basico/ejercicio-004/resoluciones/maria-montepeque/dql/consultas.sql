-- basico/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

-- 1. Top 5 motos mas caras
SELECT
    placa,
    marca,
    modelo,
    precio
FROM motos_garaje
ORDER BY precio DESC
LIMIT 5;

-- 2. Cantidad y precio promedio de motos por marca
SELECT
    marca,
    COUNT(*) AS total_motos,
    ROUND(AVG(precio), 2) AS precio_promedio
FROM motos_garaje
GROUP BY marca
ORDER BY precio_promedio DESC;

-- 3. Motos disponibles ordenadas de mas barata a mas cara
SELECT
    placa,
    marca,
    modelo,
    precio
FROM motos_garaje
WHERE estado = 'disponible'
ORDER BY precio ASC;

-- 4. Cilindraje promedio por marca
SELECT
    marca,
    ROUND(AVG(cilindraje), 2) AS cilindraje_promedio
FROM motos_garaje
GROUP BY marca
ORDER BY cilindraje_promedio DESC;

-- 5. Conteo de motos por estado
SELECT
    estado,
    COUNT(*) AS total_motos
FROM motos_garaje
GROUP BY estado
ORDER BY total_motos DESC;

-- 6. Motos de alto cilindraje (mayor a 500) ordenadas por anio mas reciente
SELECT
    placa,
    marca,
    modelo,
    cilindraje,
    anio
FROM motos_garaje
WHERE cilindraje > 500
ORDER BY anio DESC;
