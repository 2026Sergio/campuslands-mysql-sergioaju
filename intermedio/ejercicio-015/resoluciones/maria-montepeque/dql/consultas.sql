-- intermedio/ejercicio-015 - maria-montepeque
USE campuslands_mysql;

-- 1. Verificar que la recarga idempotente NO duplico a Nova Interactive (debe dar 1)
SELECT COUNT(*) AS copias_nova_interactive
FROM desarrolladoras_biblioteca_gamer_carga
WHERE nombre = 'Nova Interactive';

-- 2. Total de desarrolladoras y juegos cargados
SELECT
    (SELECT COUNT(*) FROM desarrolladoras_biblioteca_gamer_carga) AS total_desarrolladoras,
    (SELECT COUNT(*) FROM juegos_biblioteca_gamer_carga) AS total_juegos;

-- 3. Resumen cargado por desarrolladora (tabla derivada, sin recalcular nada)
SELECT
    desarrolladora,
    total_juegos,
    horas_totales,
    gasto_total
FROM resumen_carga_biblioteca
ORDER BY gasto_total DESC;

-- 4. Comprobar que el resumen cargado coincide con el calculo directo sobre las tablas base
SELECT
    r.desarrolladora,
    r.total_juegos AS total_en_resumen,
    COUNT(j.id) AS total_calculado_ahora
FROM resumen_carga_biblioteca AS r
JOIN desarrolladoras_biblioteca_gamer_carga AS d ON d.nombre = r.desarrolladora
JOIN juegos_biblioteca_gamer_carga AS j ON j.desarrolladora_id = d.id
GROUP BY r.desarrolladora, r.total_juegos
ORDER BY r.desarrolladora;

-- 5. Desarrolladora con mayor gasto total segun el resumen cargado
SELECT desarrolladora, gasto_total
FROM resumen_carga_biblioteca
ORDER BY gasto_total DESC
LIMIT 1;

-- 6. Juegos cargados, con el nombre de su desarrolladora
SELECT
    j.titulo,
    d.nombre AS desarrolladora,
    j.genero,
    j.precio
FROM juegos_biblioteca_gamer_carga AS j
JOIN desarrolladoras_biblioteca_gamer_carga AS d ON d.id = j.desarrolladora_id
ORDER BY j.precio DESC;
