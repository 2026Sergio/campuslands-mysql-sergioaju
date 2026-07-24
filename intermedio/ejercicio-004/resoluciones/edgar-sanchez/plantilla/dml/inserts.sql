 -- Inserción de Mecánicos
INSERT INTO mecanicos (nombre, especialidad, salario_base, fecha_contratacion) VALUES
('Juan Pérez', 'Alta Cilindrada', 2500.00, '2022-03-15'),
('Maria Rodríguez', 'General', 1800.00, '2023-01-10'),
('Carlos Gómez', 'Scooters', 1600.00, '2023-06-01'),
('Luis Hernández', 'Custom', 2200.00, '2021-11-20'),
('Ana Morales', 'Eléctrica', 2100.00, '2024-02-15');

-- Inserción de Mantenimientos (20 registros)
INSERT INTO mantenimientos_motos (mecanico_id, placa_moto, cilindrada, tipo_mantenimiento, costo_total, horas_trabajadas, fecha_servicio) VALUES
(1, 'MTO-881', 1000, 'Ajuste de Motor', 450.00, 5.5, '2026-06-01'),
(1, 'MTO-992', 600, 'Preventivo', 180.00, 2.0, '2026-06-03'),
(1, 'MTO-103', 1200, 'Correctivo', 620.00, 7.0, '2026-06-10'),
(1, 'MTO-404', 900, 'Ajuste de Motor', 500.00, 6.0, '2026-06-15'),
(1, 'MTO-505', 750, 'Sistema Eléctrico', 280.00, 3.5, '2026-06-20'),
(2, 'MTO-111', 250, 'Preventivo', 90.00, 1.5, '2026-06-02'),
(2, 'MTO-222', 150, 'Correctivo', 150.00, 2.5, '2026-06-05'),
(2, 'MTO-333', 200, 'Preventivo', 85.00, 1.0, '2026-06-12'),
(3, 'MTO-701', 125, 'Preventivo', 60.00, 1.0, '2026-06-01'),
(3, 'MTO-702', 150, 'Correctivo', 110.00, 2.0, '2026-06-08'),
(4, 'MTO-801', 1800, 'Custom', 850.00, 9.0, '2026-06-04'),
(4, 'MTO-802', 1200, 'Ajuste de Motor', 720.00, 8.0, '2026-06-11'),
(4, 'MTO-803', 900, 'Correctivo', 390.00, 4.5, '2026-06-18'),
(4, 'MTO-804', 1600, 'Preventivo', 310.00, 3.0, '2026-06-25'),
(5, 'MTO-901', 300, 'Sistema Eléctrico', 210.00, 3.0, '2026-06-07'),
(5, 'MTO-902', 400, 'Sistema Eléctrico', 260.00, 3.5, '2026-06-14'),
(2, 'MTO-444', 300, 'Sistema Eléctrico', 175.00, 2.0, '2026-06-22'),
(3, 'MTO-703', 110, 'Preventivo', 55.00, 1.0, '2026-06-28'),
(5, 'MTO-903', 500, 'Preventivo', 140.00, 2.0, '2026-06-29'),
(1, 'MTO-606', 1000, 'Preventivo', 220.00, 2.5, '2026-06-30');