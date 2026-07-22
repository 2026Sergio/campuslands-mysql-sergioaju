-- basico/ejercicio-005 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS ordenes_taller_motos;

CREATE TABLE ordenes_taller_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    numero_orden VARCHAR(15) NOT NULL UNIQUE,
    placa_moto VARCHAR(10) NOT NULL,
    cliente VARCHAR(80) NOT NULL,
    tipo_servicio ENUM(
        'mantenimiento',
        'reparacion',
        'diagnostico',
        'revision'
    ) NOT NULL,
    mecanico VARCHAR(60) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL DEFAULT 0,
    estado ENUM(
        'pendiente',
        'en_proceso',
        'finalizada',
        'entregada'
    ) NOT NULL DEFAULT 'pendiente',
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT chk_costo_taller_motos CHECK (costo >= 0)
);
