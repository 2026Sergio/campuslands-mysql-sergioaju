-- avanzado/ejercicio-013 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS peliculas_miedo_json;

CREATE TABLE peliculas_miedo_json (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
    anio_estreno YEAR NOT NULL,
    calificacion DECIMAL(3, 1) NOT NULL DEFAULT 0,
    -- Columna JSON con datos semi-estructurados que varian de pelicula a
    -- pelicula (subgeneros, reparto, premios): forzarlos a columnas fijas
    -- obligaria a una tabla distinta por cada lista, cuando aqui interesa
    -- mas la flexibilidad que la normalizacion estricta.
    detalles JSON NOT NULL,
    -- Columna generada (STORED) que extrae la duracion desde el JSON, para
    -- poder indexarla y consultarla como si fuera una columna normal.
    duracion_minutos INT GENERATED ALWAYS AS (detalles ->> '$.duracion_minutos') STORED,
    CONSTRAINT chk_calificacion_peliculas_json CHECK (calificacion BETWEEN 0 AND 10)
);

-- Indice normal sobre la columna generada.
CREATE INDEX idx_duracion_peliculas_json ON peliculas_miedo_json (duracion_minutos);

-- Indice multivaluado (MySQL 8.0.17+): indexa cada elemento del array
-- "subgeneros" por separado, para poder buscar eficientemente con
-- MEMBER OF / JSON_CONTAINS sin recorrer toda la tabla.
CREATE INDEX idx_subgeneros_peliculas_json
    ON peliculas_miedo_json ((CAST(detalles -> '$.subgeneros' AS CHAR(30) ARRAY)));
