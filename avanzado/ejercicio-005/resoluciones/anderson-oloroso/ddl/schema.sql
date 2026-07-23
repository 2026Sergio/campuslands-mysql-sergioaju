USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS taller_mecanico_motos (
    servicio_id INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    marca_moto VARCHAR(50) NOT NULL,
    modelo_moto VARCHAR(50) NOT NULL,
    tipo_servicio VARCHAR(80) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    fecha_servicio DATE NOT NULL,
    PRIMARY KEY (servicio_id),
    INDEX idx_cliente (nombre_cliente),
    INDEX idx_telefono (telefono),
    INDEX idx_marca_moto (marca_moto),
    INDEX idx_estado (estado),
    INDEX idx_fecha_servicio (fecha_servicio)
);