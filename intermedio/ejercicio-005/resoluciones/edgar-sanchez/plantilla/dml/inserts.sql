-- Inserción de Clientes
INSERT INTO clientes (nombre, telefono, email, tipo_cliente) VALUES
('Carlos Mendoza', '555-0101', 'carlos.m@email.com', 'VIP'),
('Logística Flash S.A.', '555-0102', 'contacto@flashlog.com', 'Empresa'),
('Sofía Ramírez', '555-0103', 'sofia.ramirez@email.com', 'Particular'),
('Diego Fernández', '555-0104', 'diego.f@email.com', 'Particular'),
('Mensajería Express', '555-0105', 'admin@mexpress.com', 'Empresa');

-- Inserción de Motos
INSERT INTO motos (cliente_id, placa, marca, modelo, anio, cilindrada) VALUES
(1, 'MTO-1001', 'Yamaha', 'MT-09', 2023, 890),
(1, 'MTO-1002', 'BMW', 'R1250GS', 2022, 1254),
(2, 'MTO-2001', 'Honda', 'Cargo 150', 2021, 150),
(2, 'MTO-2002', 'Honda', 'Cargo 150', 2020, 150),
(3, 'MTO-3001', 'Kawasaki', 'Ninja 400', 2024, 399),
(4, 'MTO-4001', 'Italika', 'FT150', 2019, 150),
(5, 'MTO-5001', 'TVS', 'HLX 150', 2022, 150);

-- Inserción de Reparaciones (15 registros)
INSERT INTO reparaciones (moto_id, descripcion_falla, costo_repuestos, costo_mano_obra, estado, fecha_ingreso) VALUES
(1, 'Ajuste de válvulas y cambio de aceite', 120.00, 150.00, 'Finalizado', '2026-06-01'),
(1, 'Cambio de kit de arrastre', 220.00, 80.00, 'Entregado', '2026-06-20'),
(2, 'Servicio mayor de suspensión electronica', 650.00, 400.00, 'Entregado', '2026-06-05'),
(2, 'Cambio de neumáticos continentales', 580.00, 90.00, 'Finalizado', '2026-07-02'),
(3, 'Reparación de embrague', 85.00, 70.00, 'Entregado', '2026-06-10'),
(3, 'Ajuste de frenos y balatas', 45.00, 35.00, 'En Proceso', '2026-07-10'),
(4, 'Mantenimiento preventivo de rutina', 60.00, 40.00, 'Entregado', '2026-06-15'),
(5, 'Cambio de pastillas de freno y líquido', 110.00, 60.00, 'Pendiente', '2026-07-12'),
(5, 'Reparación de carenado tras caída', 340.00, 200.00, 'En Proceso', '2026-07-15'),
(6, 'Falla en sistema eléctrico e ignición', 95.00, 110.00, 'Pendiente', '2026-07-18'),
(1, 'Diagnóstico de inyección electrónica', 0.00, 120.00, 'En Proceso', '2026-07-21'),
(2, 'Escaneo y actualización de ECU', 0.00, 150.00, 'Pendiente', '2026-07-22');