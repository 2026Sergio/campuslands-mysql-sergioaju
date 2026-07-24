-- intermedio/ejercicio-015 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS resumen_carga_biblioteca;
DROP TABLE IF EXISTS juegos_biblioteca_gamer_carga;
DROP TABLE IF EXISTS desarrolladoras_biblioteca_gamer_carga;

CREATE TABLE desarrolladoras_biblioteca_gamer_carga (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    pais VARCHAR(60) NOT NULL,
    anio_fundacion YEAR NOT NULL
);

CREATE TABLE juegos_biblioteca_gamer_carga (
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
    CONSTRAINT fk_juegos_desarrolladora_carga
        FOREIGN KEY (desarrolladora_id)
        REFERENCES desarrolladoras_biblioteca_gamer_carga(id),
    CONSTRAINT chk_precio_juegos_biblioteca_carga CHECK (precio >= 0),
    CONSTRAINT chk_horas_juegos_biblioteca_carga CHECK (horas_jugadas >= 0)
);

-- Tabla de resumen que se llena con una carga derivada (INSERT ... SELECT)
-- en vez de escribir los valores a mano: se calculan a partir de los datos
-- ya cargados en las dos tablas anteriores.
CREATE TABLE resumen_carga_biblioteca (
    id INT AUTO_INCREMENT PRIMARY KEY,
    desarrolladora VARCHAR(80) NOT NULL UNIQUE,
    total_juegos INT NOT NULL DEFAULT 0,
    horas_totales INT NOT NULL DEFAULT 0,
    gasto_total DECIMAL(10, 2) NOT NULL DEFAULT 0
);
