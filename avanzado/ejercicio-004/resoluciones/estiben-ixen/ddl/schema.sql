CREATE DATABASE IF NOT EXISTS campuslands_mysql;

USE campuslands_mysql;

DROP TABLE IF EXISTS historial_motos;
DROP TABLE IF EXISTS garaje_motos;

CREATE TABLE garaje_motos (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cilindrada INT NOT NULL,
    propietario VARCHAR(100) NOT NULL,
    espacio_parqueo VARCHAR(20) NOT NULL UNIQUE,
    estado ENUM('ingresada','retirada') DEFAULT 'ingresada',
    fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_salida DATETIME NULL
);


CREATE TABLE historial_motos (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    id_moto INT NOT NULL,
    accion VARCHAR(50) NOT NULL,
    fecha_accion DATETIME DEFAULT CURRENT_TIMESTAMP,
    detalle VARCHAR(255),

    CONSTRAINT fk_historial_moto
    FOREIGN KEY (id_moto)
    REFERENCES garaje_motos(id_moto)
);

DELIMITER //

CREATE TRIGGER registrar_ingreso_moto
AFTER INSERT ON garaje_motos
FOR EACH ROW
BEGIN

    INSERT INTO historial_motos
    (
        id_moto,
        accion,
        detalle
    )
    VALUES
    (
        NEW.id_moto,
        'Ingreso',
        CONCAT('Moto ingresada con placa ', NEW.placa)
    );


DELIMITER ;