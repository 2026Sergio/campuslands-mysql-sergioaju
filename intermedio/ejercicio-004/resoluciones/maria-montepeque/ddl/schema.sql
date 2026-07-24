-- intermedio/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

DROP TABLE IF EXISTS registros_servicio_motos;

CREATE TABLE registros_servicio_motos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    marca VARCHAR(60) NOT NULL,
    tipo_servicio ENUM(
        'mantenimiento',
        'reparacion',
        'revision'
    ) NOT NULL,
    mecanico VARCHAR(60) NOT NULL,
    costo DECIMAL(10, 2) NOT NULL DEFAULT 0,
    fecha_servicio DATE NOT NULL,
    CONSTRAINT chk_costo_servicio_motos CHECK (costo >= 0)
);
