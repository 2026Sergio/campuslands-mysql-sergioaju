-- avanzado/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

-- 1. Extraer campos especificos del JSON como si fueran columnas normales
--    (operador ->> devuelve el valor sin comillas, ya "des-escapado")
SELECT
    titulo,
    detalles ->> '$.director' AS director,
    duracion_minutos
FROM peliculas_miedo_json
ORDER BY duracion_minutos DESC;

-- 2. Peliculas cuyo array de subgeneros contiene "paranormal" (MEMBER OF
--    aprovecha el indice multivaluado idx_subgeneros_peliculas_json)
SELECT
    titulo,
    detalles -> '$.subgeneros' AS subgeneros
FROM peliculas_miedo_json
WHERE 'paranormal' MEMBER OF (detalles -> '$.subgeneros');

-- 3. JSON_TABLE: convierte el array "reparto" de cada pelicula en filas
--    (una fila por actor), algo que no se puede hacer con ->> directamente.
SELECT
    p.titulo,
    reparto.actor
FROM peliculas_miedo_json AS p,
    JSON_TABLE(
        p.detalles,
        '$.reparto[*]' COLUMNS (actor VARCHAR(80) PATH '$')
    ) AS reparto
ORDER BY p.titulo, reparto.actor;

-- 4. Usando el mismo JSON_TABLE de reparto: actor que aparece en mas peliculas
SELECT
    reparto.actor,
    COUNT(*) AS total_peliculas
FROM peliculas_miedo_json AS p,
    JSON_TABLE(
        p.detalles,
        '$.reparto[*]' COLUMNS (actor VARCHAR(80) PATH '$')
    ) AS reparto
GROUP BY reparto.actor
ORDER BY total_peliculas DESC, reparto.actor;

-- 5. Actualizar un documento JSON en el lugar: "Amanecer Muerto" no tenia
--    premios (array vacio); se le agrega uno con JSON_ARRAY_APPEND.
UPDATE peliculas_miedo_json
SET detalles = JSON_ARRAY_APPEND(
    detalles,
    '$.premios',
    JSON_OBJECT('nombre', 'Noche de Terror Fest', 'anio', 2021)
)
WHERE titulo = 'Amanecer Muerto';

SELECT
    titulo,
    detalles -> '$.premios' AS premios
FROM peliculas_miedo_json
WHERE titulo = 'Amanecer Muerto';

-- 6. JSON_TABLE con NESTED PATH: expande el array de objetos "premios" de
--    todas las peliculas en filas (pelicula, nombre del premio, ano).
SELECT
    p.titulo,
    premios.nombre_premio,
    premios.anio_premio
FROM peliculas_miedo_json AS p,
    JSON_TABLE(
        p.detalles,
        '$.premios[*]' COLUMNS (
            nombre_premio VARCHAR(80) PATH '$.nombre',
            anio_premio INT PATH '$.anio'
        )
    ) AS premios
ORDER BY premios.anio_premio;
