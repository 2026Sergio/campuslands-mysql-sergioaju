USE campuslands_mysql;

CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre_equipo VARCHAR(60) NOT NULL UNIQUE,
    region VARCHAR(40) NOT NULL,
    puntaje INT NOT NULL DEFAULT 0 CHECK (puntaje >= 0),
    victorias INT NOT NULL DEFAULT 0 CHECK (victorias >= 0),
    derrotas INT NOT NULL DEFAULT 0 CHECK (derrotas >= 0),
    estado ENUM('Activo','Eliminado') NOT NULL DEFAULT 'Activo'
);