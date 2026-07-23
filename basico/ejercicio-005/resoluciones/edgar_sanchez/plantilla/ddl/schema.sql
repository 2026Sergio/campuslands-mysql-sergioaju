CREATE TABLE ordenes_taller (
    orden_id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_nombre VARCHAR(100) NOT NULL,
    moto_modelo VARCHAR(50) NOT NULL,
    placa VARCHAR(15) NOT NULL UNIQUE,
    tipo_servicio VARCHAR(50) NOT NULL CHECK (tipo_servicio IN ('Mantenimiento General', 'Reparación de Motor', 'Sistema Eléctrico', 'Frenos y Suspensión', 'Cambio de Aceite')),
    costo_repuestos DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (costo_repuestos >= 0.00),
    costo_mano_obra DECIMAL(10,2) NOT NULL DEFAULT 0.00 CHECK (costo_mano_obra >= 0.00),
    estado_orden VARCHAR(20) NOT NULL DEFAULT 'En Espera' CHECK (estado_orden IN ('En Espera', 'En Proceso', 'Completado', 'Cancelado')),
    fecha_ingreso DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);