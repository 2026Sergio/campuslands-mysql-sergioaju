USE campuslands_mysql;

-- 1. Cantidad de skins y precio promedio por rareza
SELECT rareza, COUNT(*) AS total_skins, AVG(precio) AS precio_promedio
FROM skins_shooter
GROUP BY rareza
ORDER BY precio_promedio DESC;

-- 2. Valor total del inventario agrupado por arma
SELECT arma, COUNT(*) AS total_skins, SUM(precio) AS valor_total
FROM skins_shooter
GROUP BY arma
ORDER BY valor_total DESC;

-- 3. Cantidad de skins por jugador
SELECT jugador, COUNT(*) AS total_skins
FROM skins_shooter
GROUP BY jugador
ORDER BY total_skins DESC;

-- 4. Armas con valor total mayor a 30 (GROUP BY + HAVING)
SELECT arma, SUM(precio) AS valor_total
FROM skins_shooter
GROUP BY arma
HAVING valor_total > 30
ORDER BY valor_total DESC;

-- 5. Rareza con skins bloqueadas o en revision (caso limite)
SELECT rareza, estado, COUNT(*) AS total
FROM skins_shooter
WHERE estado IN ('bloqueada', 'en_revision')
GROUP BY rareza, estado;