USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS clientes_taller (
    cliente_id INT NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    PRIMARY KEY (cliente_id)
);

CREATE TABLE IF NOT EXISTS servicios_taller_motos (
    servicio_id INT NOT NULL AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    marca_moto VARCHAR(50) NOT NULL,
    modelo_moto VARCHAR(50) NOT NULL,
    tipo_servicio VARCHAR(50) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    estado VARCHAR(30) NOT NULL,
    PRIMARY KEY (servicio_id),
    FOREIGN KEY (cliente_id) REFERENCES clientes_taller(cliente_id)
);