-- Datos de practica para taller mecanico de motos (10 registros por tabla).
USE campuslands_mysql;

INSERT INTO avanzado_ejercicio_005_clientes (documento, nombre, telefono) 
    VALUES ('1001M', 'Carlos Ruiz', '555-0101'),
    ('1002M', 'Ana Gomez', '555-0102'),
    ('1003M', 'Luis Perez', '555-0103'),
    ('1004M', 'Maria Fernandez', '555-0104'),
    ('1005M', 'Pedro Sanchez', '555-0105'),
    ('1006M', 'Jorge Diaz', '555-0106'),
    ('1007M', 'Laura Martinez', '555-0107'),
    ('1008M', 'Diego Lopez', '555-0108'),
    ('1009M', 'Sofia Castro', '555-0109'),
    ('1010M', 'Andres Ramirez', '555-0110');

INSERT INTO avanzado_ejercicio_005_reparaciones (cliente_id, placa, descripcion, costo, estado) 
    VALUES (1, 'MTO-001', 'Cambio de aceite', 45.00, 'completado'),
    (2, 'HON-123', 'Ajuste de valvulas', 150.00, 'proceso'),
    (3, 'KAW-456', 'Revision general', 80.00, 'pendiente'),
    (4, 'SUZ-789', 'Cambio de frenos', 60.00, 'completado'),
    (5, 'KTM-321', 'Reemplazo kit arrastre', 200.00, 'proceso'),
    (6, 'BMW-654', 'Mantenimiento preventivo', 300.00, 'pendiente'),
    (7, 'YAM-987', 'Sincronizacion', 120.00, 'completado'),
    (8, 'DUC-111', 'Diagnostico de fallas', 90.00, 'pendiente'),
    (9, 'NAV-222', 'Cambio de llanta', 50.00, 'completado'),
    (10, 'PUL-333', 'Reparacion electrica', 180.00, 'proceso');