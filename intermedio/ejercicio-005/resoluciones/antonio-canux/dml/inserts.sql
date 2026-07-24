-- Datos de practica para taller mecanico de motos (10 por tabla).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_005_clientes (nombre_completo, telefono) 
    VALUES ('Carlos Ruiz', '555-0101'),
    ('Ana Gomez', '555-0102'),
    ('Luis Perez', '555-0103'),
    ('Maria Fernandez', '555-0104'),
    ('Pedro Sanchez', '555-0105'),
    ('Jorge Diaz', '555-0106'),
    ('Laura Martinez', '555-0107'),
    ('Diego Lopez', '555-0108'),
    ('Sofia Castro', '555-0109'),
    ('Andres Ramirez', '555-0110');

INSERT INTO intermedio_ejercicio_005_reparaciones (cliente_id, moto_modelo, descripcion, costo, estado) 
    VALUES (1, 'Yamaha MT-07', 'Cambio de aceite', 45.00, 'completado'),
    (2, 'Honda CBR600', 'Ajuste de valvulas', 150.00, 'en_proceso'),
    (3, 'Kawasaki Ninja 400', 'Revision general', 80.00, 'pendiente'),
    (1, 'Yamaha MT-07', 'Cambio de pastillas', 60.00, 'pendiente'),
    (5, 'KTM Duke 390', 'Reemplazo kit arrastre', 200.00, 'en_proceso'),
    (6, 'BMW GS 1250', 'Mantenimiento preventivo', 300.00, 'pendiente'),
    (7, 'Yamaha R3', 'Sincronizacion', 120.00, 'completado'),
    (8, 'Ducati Monster', 'Diagnostico de fallas', 90.00, 'pendiente'),
    (9, 'Honda Navi', 'Cambio de llanta', 50.00, 'completado'),
    (2, 'Honda CBR600', 'Reparacion electrica', 180.00, 'en_proceso');