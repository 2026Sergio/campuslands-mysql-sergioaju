-- Datos de practica. Puedes cambiarlos o agregar mas filas.
USE campuslands_mysql;


INSERT INTO motos
(marca, modelo, cilindrada, año_fabricacion, placa, propietario, estado)
VALUES
('Yamaha','FZ 2.0',149,'2022','MOT101','Carlos Ramirez','En servicio'),
('Honda','CB190R',184,'2021','MOT102','Andrea Lopez','Finalizada'),
('Suzuki','GN125',125,'2020','MOT103','Luis Hernandez','Pendiente'),
('Kawasaki','Ninja 400',399,'2023','MOT104','Maria Gonzalez','En servicio'),
('Bajaj','Pulsar NS200',200,'2022','MOT105','Pedro Castillo','Finalizada'),
('AKT','NKD 125',125,'2019','MOT106','Sofia Morales','Pendiente'),
('BMW','G310R',313,'2024','MOT107','Daniel Perez','En servicio'),
('KTM','Duke 390',373,'2023','MOT108','Laura Martinez','Finalizada');


INSERT INTO reparaciones
(moto_id, tipo_servicio, costo, fecha_reparacion, mecanico, estado)
VALUES
(1,'Cambio de aceite',850.00,'2026-03-01','Juan Torres','Completada'),
(2,'Cambio de kit de arrastre',2200.00,'2026-03-02','Miguel Perez','Completada'),
(3,'Revision de frenos',650.00,'2026-03-03','Carlos Diaz','Pendiente'),
(4,'Mantenimiento general',3500.00,'2026-03-04','Juan Torres','Completada'),
(5,'Cambio de bateria',1200.00,'2026-03-05','Miguel Perez','Completada'),
(6,'Afinacion de motor',1800.00,'2026-03-06','Carlos Diaz','Pendiente'),
(7,'Revision electrica',950.00,'2026-03-07','Juan Torres','Completada'),
(8,'Cambio de aceite y filtros',1400.00,'2026-03-08','Miguel Perez','Completada');