CREATE TABLE mecanicos (
    mecanico_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    especialidad VARCHAR(50) NOT NULL CHECK (especialidad IN ('Alta Cilindrada', 'Scooters', 'Eléctrica', 'General', 'Custom')),
    salario_base DECIMAL(10,2) NOT NULL CHECK (salario_base >= 0.00),
    fecha_contratacion DATE NOT NULL
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