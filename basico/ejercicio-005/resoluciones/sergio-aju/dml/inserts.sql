USE db_taller_motos;
TRUNCATE TABLE reparaciones;

INSERT INTO reparaciones (cliente, moto_modelo, servicio, costo_mano_obra, estado) VALUES
('Juan Perez', 'Yamaha FZ 250', 'Cambio de kit de arrastre', 150.00, 'Completado'),
('Maria Lopez', 'Honda Navi 110', 'Mantenimiento general', 120.00, 'En proceso'),
('Carlos Gomez', 'Suzuki GN 125', 'Ajuste de frenos y cadena', 80.00, 'Pendiente'),
('Ana Morales', 'Bajaj Pulsar NS 200', 'Cambio de aceite y filtros', 95.50, 'Completado'),
('Pedro Xol', 'Kawasaki Ninja 400', 'Sincronizacion de motor', 350.00, 'En proceso'),
('Lucia Tzep', 'Yamaha MT-03', 'Reparacion del sistema electrico', 280.00, 'Completado'),
('Sofia Castillo', 'Honda XR 190L', 'Cambio de llantas', 110.00, 'Pendiente'),
('Diego Ajú', 'TVS Apache RTR 160', 'Revision de suspension', 135.00, 'Completado');