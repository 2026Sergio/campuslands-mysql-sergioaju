CREATE TABLE mecanicos (
    mecanico_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL CHECK (especialidad IN ('Alta Cilindrada', 'Scooters', 'Eléctrica', 'General', 'Custom')),
    horas_totales_trabajadas DECIMAL(6,1) NOT NULL DEFAULT 0.0 CHECK (horas_totales_trabajadas >= 0.0),
    total_servicios_realizados INT NOT NULL DEFAULT 0 CHECK (total_servicios_realizados >= 0),
    estado VARCHAR(20) NOT NULL DEFAULT 'Disponible' CHECK (estado IN ('Disponible', 'Ocupado', 'Inactivo'))
);

CREATE TABLE mantenimientos_motos (
    mantenimiento_id INT AUTO_INCREMENT PRIMARY KEY,
    mecanico_id INT NOT NULL,
    placa_moto VARCHAR(15) NOT NULL,
    cilindrada INT NOT NULL CHECK (cilindrada BETWEEN 50 AND 2500),
    tipo_mantenimiento VARCHAR(50) NOT NULL CHECK (tipo_mantenimiento IN ('Preventivo', 'Correctivo', 'Ajuste de Motor', 'Sistema Eléctrico')),
    costo_total DECIMAL(10,2) NOT NULL CHECK (costo_total >= 0.00),
    horas_trabajadas DECIMAL(4,1) NOT NULL CHECK (horas_trabajadas > 0.0),
    fecha_servicio DATE NOT NULL,
    CONSTRAINT fk_mantenimientos_mecanicos 
        FOREIGN KEY (mecanico_id) REFERENCES mecanicos(mecanico_id) 
        ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE auditoria_precios_mantenimiento (
    auditoria_id INT AUTO_INCREMENT PRIMARY KEY,
    mantenimiento_id INT NOT NULL,
    costo_anterior DECIMAL(10,2) NOT NULL,
    costo_nuevo DECIMAL(10,2) NOT NULL,
    usuario_modificacion VARCHAR(50) NOT NULL,
    fecha_modificacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_auditoria_mantenimientos 
        FOREIGN KEY (mantenimiento_id) REFERENCES mantenimientos_motos(mantenimiento_id) 
        ON DELETE CASCADE
);