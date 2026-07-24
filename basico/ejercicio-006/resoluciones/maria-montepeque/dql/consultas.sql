-- basico/ejercicio-006 - maria-montepeque
USE campuslands_mysql;

-- 1. Autos con potencia mayor a 900 hp
SELECT
    modelo,
    marca,
    potencia_hp
FROM autos_hiperdeportivos
WHERE potencia_hp > 900
ORDER BY potencia_hp DESC;

-- 2. Autos con precio entre 300000 y 1000000
SELECT
    modelo,
    marca,
    precio
FROM autos_hiperdeportivos
WHERE precio BETWEEN 300000 AND 1000000
ORDER BY precio DESC;

-- 3. Autos de marcas italianas especificas
SELECT
    modelo,
    marca,
    pais_origen
FROM autos_hiperdeportivos
WHERE marca IN ('Ferrari', 'Lamborghini', 'Pagani')
ORDER BY marca;

-- 4. Autos disponibles con velocidad maxima mayor a 300 km/h
SELECT
    modelo,
    marca,
    velocidad_max_kmh,
    estado
FROM autos_hiperdeportivos
WHERE estado = 'disponible' AND velocidad_max_kmh > 300
ORDER BY velocidad_max_kmh DESC;

-- 5. Autos que no estan vendidos
SELECT
    modelo,
    marca,
    estado
FROM autos_hiperdeportivos
WHERE estado != 'vendido'
ORDER BY estado;

-- 6. Autos originarios de Italia
SELECT
    modelo,
    marca,
    pais_origen,
    anio
FROM autos_hiperdeportivos
WHERE pais_origen LIKE 'Italia%'
ORDER BY anio DESC;
