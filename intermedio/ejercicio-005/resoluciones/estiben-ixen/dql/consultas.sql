USE campuslands_mysql;

-- 1. Servicios con un costo mayor al costo promedio.

SELECT
    placa,
    propietario,
    servicio,
    costo
FROM servicios
WHERE costo >
(
    SELECT AVG(costo)
    FROM servicios
);

---------------------------------------------------------

-- 2. Servicio con el costo más alto.

SELECT
    placa,
    propietario,
    servicio,
    costo
FROM servicios
WHERE costo =
(
    SELECT MAX(costo)
    FROM servicios
);

---------------------------------------------------------

-- 3. Servicios cuyo costo es menor al costo promedio.

SELECT
    placa,
    propietario,
    servicio,
    costo
FROM servicios
WHERE costo <
(
    SELECT AVG(costo)
    FROM servicios
);

---------------------------------------------------------

-- 4. Motos pertenecientes a la marca con mayor cantidad de registros.

SELECT
    placa,
    propietario,
    marca
FROM servicios
WHERE marca =
(
    SELECT marca
    FROM servicios
    GROUP BY marca
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

---------------------------------------------------------

-- 5. Servicios cuyo costo es igual al costo mínimo registrado.

SELECT
    placa,
    propietario,
    servicio,
    costo
FROM servicios
WHERE costo =
(
    SELECT MIN(costo)
    FROM servicios
);

---------------------------------------------------------

-- 6. Servicios cuyo costo es superior al promedio de los servicios finalizados.

SELECT
    placa,
    propietario,
    servicio,
    costo
FROM servicios
WHERE costo >
(
    SELECT AVG(costo)
    FROM servicios
    WHERE estado = 'Finalizado'
);

---------------------------------------------------------

-- 7. Servicios realizados a motos de la misma marca que el servicio más costoso.

SELECT
    placa,
    propietario,
    marca,
    costo
FROM servicios
WHERE marca =
(
    SELECT marca
    FROM servicios
    ORDER BY costo DESC
    LIMIT 1
);

---------------------------------------------------------

-- 8. Servicios con costo superior al costo mínimo registrado.

SELECT
    placa,
    propietario,
    servicio,
    costo
FROM servicios
WHERE costo >
(
    SELECT MIN(costo)
    FROM servicios
);