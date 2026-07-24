CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    tipo_cliente VARCHAR(20) NOT NULL DEFAULT 'Particular' CHECK (tipo_cliente IN ('Particular', 'Empresa', 'VIP'))
);

CREATE TABLE motos (
    moto_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    placa VARCHAR(15) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    anio INT NOT NULL CHECK (anio BETWEEN 1990 AND 2027),
    cilindrada INT NOT NULL CHECK (cilindrada BETWEEN 50 AND 2500),
    CONSTRAINT fk_motos_clientes 
        FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE reparaciones (
    reparacion_id INT AUTO_INCREMENT PRIMARY KEY,
    moto_id INT NOT NULL,
    descripcion_falla VARCHAR(255) NOT NULL,
    costo_repuestos DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (costo_repuestos >= 0.00),
    costo_mano_obra DECIMAL(10,2) NOT NULL CHECK (costo_mano_obra >= 0.00),
    estado VARCHAR(20) NOT NULL DEFAULT 'Pendiente' CHECK (estado IN ('Pendiente', 'En Proceso', 'Finalizado', 'Entregado')),
    fecha_ingreso DATE NOT NULL,
    CONSTRAINT fk_reparaciones_motos 
        FOREIGN KEY (moto_id) REFERENCES motos(moto_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);