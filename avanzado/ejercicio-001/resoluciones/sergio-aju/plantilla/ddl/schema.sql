DROP DATABASE IF EXISTS db_moba_transacciones;
CREATE DATABASE db_moba_transacciones;
USE db_moba_transacciones;

CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    region VARCHAR(30) NOT NULL,
    fondos_premio DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (fondos_premio >= 0.00)
);

CREATE TABLE transferencias_historial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo_origen INT NOT NULL,
    id_equipo_destino INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    fecha_transferencia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_equipo_origen) REFERENCES equipos(id),
    FOREIGN KEY (id_equipo_destino) REFERENCES equipos(id)
);