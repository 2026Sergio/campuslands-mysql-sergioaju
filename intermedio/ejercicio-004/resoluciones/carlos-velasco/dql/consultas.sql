-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    marca,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY marca
HAVING AVG(precio) > 30000;

SELECT
    estado,
    COUNT(*) AS total_motos
FROM motos
GROUP BY estado
HAVING COUNT(*) > 1;

SELECT
    marca,
    MAX(precio) AS precio_maximo
FROM motos
GROUP BY marca
HAVING MAX(precio) > 40000;

SELECT
    estado,
    AVG(precio) AS precio_promedio
FROM motos
GROUP BY estado
HAVING AVG(precio) > 30000;

SELECT
    cilindrada,
    SUM(precio) AS valor_total
FROM motos
GROUP BY cilindrada
HAVING SUM(precio) > 35000;
