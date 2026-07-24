-- basico/ejercicio-005 - maria-montepeque
USE campuslands_mysql;

INSERT INTO ordenes_taller_motos
    (numero_orden, placa_moto, cliente, tipo_servicio, mecanico, costo, estado, fecha_ingreso)
VALUES
    ('OT-2026-001', 'MTA-101', 'Carlos Reyes', 'mantenimiento', 'Julio Sanchez', 85.00, 'entregada', '2026-06-01'),
    ('OT-2026-002', 'MTA-102', 'Ana Torres', 'reparacion', 'Julio Sanchez', 320.50, 'finalizada', '2026-06-03'),
    ('OT-2026-003', 'MTA-103', 'Carlos Reyes', 'diagnostico', 'Mario Ortiz', 40.00, 'entregada', '2026-06-08'),
    ('OT-2026-004', 'MTA-104', 'Luis Fernandez', 'reparacion', 'Mario Ortiz', 275.75, 'en_proceso', '2026-07-05'),
    ('OT-2026-005', 'MTA-105', 'Paola Gomez', 'revision', 'Julio Sanchez', 60.00, 'finalizada', '2026-07-10'),
    ('OT-2026-006', 'MTA-106', 'Ana Torres', 'mantenimiento', 'Diego Rios', 95.25, 'pendiente', '2026-07-15'),
    ('OT-2026-007', 'MTA-107', 'Sofia Mendez', 'reparacion', 'Diego Rios', 410.00, 'en_proceso', '2026-07-18'),
    ('OT-2026-008', 'MTA-108', 'Luis Fernandez', 'diagnostico', 'Mario Ortiz', 35.50, 'entregada', '2026-05-20'),
    ('OT-2026-009', 'MTA-109', 'Paola Gomez', 'revision', 'Julio Sanchez', 65.00, 'pendiente', '2026-07-20'),
    ('OT-2026-010', 'MTA-110', 'Sofia Mendez', 'mantenimiento', 'Diego Rios', 90.00, 'finalizada', '2026-07-12');
