-- basico/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS motos_garaje;

CREATE TABLE motos_garaje (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    cilindraje INT NOT NULL,
    anio YEAR NOT NULL,
    precio DECIMAL(10, 2) NOT NULL DEFAULT 0,
    color VARCHAR(30) NOT NULL,
    estado ENUM(
        'disponible',
        'en_reparacion',
        'vendida'
    ) NOT NULL DEFAULT 'disponible',
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT chk_cilindraje_motos_garaje CHECK (cilindraje > 0)
);
