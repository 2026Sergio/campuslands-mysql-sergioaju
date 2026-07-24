-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;

INSERT INTO ordenes_servicio_motos
(cliente, motocicleta, servicio, costo, estado)
VALUES
('Carlos Pérez', 'Honda CB190R', 'Cambio de aceite', 180.00, 'finalizado'),
('María Gómez', 'Yamaha MT-03', 'Cambio de pastillas de freno', 420.00, 'en_proceso'),
('Luis Hernández', 'KTM Duke 390', 'Ajuste de suspensión', 650.00, 'pendiente'),
('Ana López', 'Suzuki GSX-S750', 'Servicio preventivo', 950.00, 'finalizado'),
('Pedro Martínez', 'Kawasaki Ninja 400', 'Cambio de kit de arrastre', 780.00, 'en_proceso'),
('Sofía Ramírez', 'Honda CBR650R', 'Cambio de batería', 540.00, 'pendiente'),
('Jorge Castillo', 'Bajaj Dominar 400', 'Revisión eléctrica', 360.00, 'finalizado'),
('Laura Torres', 'BMW G310R', 'Cambio de neumáticos', 1250.00, 'en_proceso'),
('Miguel Ruiz', 'Yamaha R15', 'Alineación de dirección', 310.00, 'pendiente'),
('Daniel Morales', 'TVS Apache RTR 200', 'Diagnóstico general', 275.00, 'finalizado');
