-- basico/ejercicio-006 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS autos_hiperdeportivos;

CREATE TABLE autos_hiperdeportivos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(60) NOT NULL,
    modelo VARCHAR(60) NOT NULL,
    pais_origen VARCHAR(60) NOT NULL,
    anio YEAR NOT NULL,
    potencia_hp INT NOT NULL,
    velocidad_max_kmh INT NOT NULL,
    precio DECIMAL(12, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'disponible',
        'reservado',
        'vendido'
    ) NOT NULL DEFAULT 'disponible',
    CONSTRAINT chk_velocidad_autos_hiper CHECK (velocidad_max_kmh > 0)
);
