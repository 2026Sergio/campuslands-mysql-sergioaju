CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    documento_identidad VARCHAR(20) NOT NULL UNIQUE,
    nombre_completo VARCHAR(100) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL,
    INDEX idx_clientes_documento (documento_identidad)
);

CREATE TABLE motos_taller (
    moto_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(15) NOT NULL UNIQUE,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL CHECK (anio BETWEEN 1990 AND 2026),
    cilindrada INT NOT NULL CHECK (cilindrada BETWEEN 50 AND 2500),
    CONSTRAINT fk_motos_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_motos_cliente (cliente_id),
    INDEX idx_motos_placa (placa)
);

CREATE TABLE ordenes_reparacion (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    estado_orden VARCHAR(20) NOT NULL DEFAULT 'En Espera' CHECK (estado_orden IN ('En Espera', 'En Proceso', 'Finalizado', 'Cancelado')),
    costo_repuestos DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (costo_repuestos >= 0.00),
    costo_mano_obra DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (costo_mano_obra >= 0.00),
    fecha_ingreso DATE NOT NULL,
    fecha_entrega DATE NULL,
    CONSTRAINT fk_ordenes_motos 
        FOREIGN KEY (moto_id) REFERENCES motos_taller(moto_id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
    INDEX idx_ordenes_estado_fecha (estado_orden, fecha_ingreso),
    INDEX idx_ordenes_moto_id (moto_id)
);