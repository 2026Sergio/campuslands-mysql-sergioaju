USE campuslands_mysql;


-- Mostrar motos actualmente dentro del garaje
SELECT 
    placa,
    marca,
    modelo,
    propietario,
    espacio_parqueo
FROM garaje_motos
WHERE estado = 'ingresada'
ORDER BY fecha_ingreso DESC;


-- Cantidad de motos por marca
SELECT
    marca,
    COUNT(*) AS cantidad_motos
FROM garaje_motos
GROUP BY marca
ORDER BY cantidad_motos DESC;


-- Buscar motos con cilindrada mayor a 300
SELECT
    placa,
    marca,
    modelo,
    cilindrada,
    propietario
FROM garaje_motos
WHERE cilindrada > 300
ORDER BY cilindrada DESC;


-- Total de motos registradas
SELECT
    COUNT(*) AS total_motos
FROM garaje_motos;


-- Reporte de espacios ocupados
SELECT
    espacio_parqueo,
    propietario,
    placa,
    estado
FROM garaje_motos
ORDER BY espacio_parqueo;