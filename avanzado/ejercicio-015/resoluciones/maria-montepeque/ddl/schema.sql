-- avanzado/ejercicio-015 - maria-montepeque
-- Los indices de optimizacion (idx_juegos_desarrolladora_opt e
-- idx_fecha_lanzamiento_opt) se crean mas adelante, en dql/consultas.sql,
-- justo antes de repetir cada consulta ya optimizada: asi el archivo deja
-- documentado el "antes" (sin indice, consulta mal escrita) y el "despues"
-- (consulta reescrita + indice) en el mismo lugar.
USE campuslands_mysql;

DROP TABLE IF EXISTS juegos_biblioteca_opt;
DROP TABLE IF EXISTS desarrolladoras_biblioteca_opt;

CREATE TABLE desarrolladoras_biblioteca_opt (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    pais VARCHAR(60) NOT NULL
);

CREATE TABLE juegos_biblioteca_opt (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL,
    desarrolladora_id INT NOT NULL,
    genero ENUM(
        'accion',
        'rpg',
        'estrategia',
        'deportes',
        'aventura'
    ) NOT NULL,
    precio DECIMAL(8, 2) NOT NULL DEFAULT 0,
    horas_jugadas INT NOT NULL DEFAULT 0,
    fecha_lanzamiento DATE NOT NULL,
    CONSTRAINT fk_juegos_desarrolladora_opt
        FOREIGN KEY (desarrolladora_id)
        REFERENCES desarrolladoras_biblioteca_opt(id),
    CONSTRAINT chk_precio_juegos_opt CHECK (precio >= 0)
);
