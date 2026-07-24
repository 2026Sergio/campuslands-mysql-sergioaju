-- DDL: Tabla de servicios y reparaciones en el Garaje de Motos para filtrado con HAVING
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
USE campuslands_mysql;

DROP TABLE IF EXISTS servicios_motos_intermedio;

CREATE TABLE servicios_motos_intermedio (
    servicio_id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    tipo_servicio ENUM('mantenimiento_preventivo', 'reparacion_motor', 'sistema_electrico', 'cambio_frenos', 'pintura') NOT NULL,
    marca_moto VARCHAR(30) NOT NULL,
    costo_mano_obra DECIMAL(8, 2) NOT NULL CHECK (costo_mano_obra >= 0.00),
    costo_repuestos DECIMAL(8, 2) NOT NULL DEFAULT 0.00 CHECK (costo_repuestos >= 0.00),
    mecanico_asignado VARCHAR(50) NOT NULL,
    estado_servicio ENUM('completado', 'en_proceso', 'cancelado') NOT NULL DEFAULT 'completado'
) ENGINE=InnoDB;
