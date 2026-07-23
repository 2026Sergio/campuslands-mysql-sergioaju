USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS taller_mecanico_motos (
    servicio_id INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(100) NOT NULL,
    marca_moto VARCHAR(50) NOT NULL,
    modelo_moto VARCHAR(50) NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (servicio_id)
);