SELECT 
    marca,
    COUNT(*) AS cantidad_motos,
    AVG(precio) AS precio_promedio
FROM garaje_motos
GROUP BY marca
HAVING COUNT(*) >= 2
ORDER BY cantidad_motos DESC;

SELECT 
    marca,
    SUM(precio) AS valor_total_motos
FROM garaje_motos
GROUP BY marca
HAVING SUM(precio) > 150000000
ORDER BY valor_total_motos DESC;

SELECT 
    marca,
    AVG(cilindraje) AS cilindraje_promedio
FROM garaje_motos
GROUP BY marca
HAVING AVG(cilindraje) > 700
ORDER BY cilindraje_promedio DESC;

SELECT 
    estado,
    COUNT(*) AS cantidad_motos,
    SUM(precio) AS valor_total
FROM garaje_motos
GROUP BY estado
HAVING COUNT(*) > 3
ORDER BY cantidad_motos DESC;

SELECT 
    marca,
    COUNT(*) AS motos_disponibles,
    SUM(precio) AS valor_disponible
FROM garaje_motos
WHERE estado = 'Disponible'
GROUP BY marca
HAVING COUNT(*) >= 2
ORDER BY valor_disponible DESC;