-- basico/ejercicio-015 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS juegos_biblioteca_gamer;
DROP TABLE IF EXISTS desarrolladoras_biblioteca_gamer;

CREATE TABLE desarrolladoras_biblioteca_gamer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    pais VARCHAR(60) NOT NULL,
    anio_fundacion YEAR NOT NULL
);

CREATE TABLE juegos_biblioteca_gamer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(120) NOT NULL UNIQUE,
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
    estado ENUM(
        'instalado',
        'pendiente',
        'completado'
    ) NOT NULL DEFAULT 'pendiente',
    fecha_compra DATE NOT NULL,
    CONSTRAINT fk_juegos_desarrolladora
        FOREIGN KEY (desarrolladora_id)
        REFERENCES desarrolladoras_biblioteca_gamer(id),
    CONSTRAINT chk_precio_juegos_biblioteca CHECK (precio >= 0),
    CONSTRAINT chk_horas_juegos_biblioteca CHECK (horas_jugadas >= 0)
);
