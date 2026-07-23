-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT
    marca,
    modelo,
    precio
FROM autos_hiperdeportivos
WHERE disponible = 'Sí';

SELECT
    marca,
    modelo,
    potencia_hp
FROM autos_hiperdeportivos
WHERE potencia_hp > 1200;

SELECT
    marca,
    modelo,
    combustible
FROM autos_hiperdeportivos
WHERE combustible = 'Híbrido';

SELECT
    marca,
    modelo,
    pais_origen
FROM autos_hiperdeportivos
WHERE pais_origen = 'Italia';

SELECT
    marca,
    modelo,
    precio
FROM autos_hiperdeportivos
WHERE precio > 3000000
ORDER BY precio DESC;

SELECT
    marca,
    modelo,
    velocidad_maxima
FROM autos_hiperdeportivos
WHERE velocidad_maxima BETWEEN 400 AND 450;

