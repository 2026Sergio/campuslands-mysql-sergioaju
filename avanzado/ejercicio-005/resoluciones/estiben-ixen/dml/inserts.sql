USE campuslands_mysql;


INSERT INTO motos
(placa, marca, modelo, cilindrada, propietario, telefono)
VALUES
('ABC123','Yamaha','MT-03',321,'Carlos Mendoza','55510001'),
('DEF456','Honda','CB190R',184,'Ana Lopez','55510002'),
('GHI789','Suzuki','GSX150',150,'Pedro Castillo','55510003'),
('JKL321','Kawasaki','Ninja400',399,'Luis Ramirez','55510004'),
('MNO654','BMW','G310R',313,'Maria Torres','55510005'),
('PQR987','Honda','XR150L',149,'Jose Herrera','55510006'),
('STU741','Yamaha','FZ25',249,'Laura Diaz','55510007'),
('VWX852','KTM','Duke390',373,'Miguel Perez','55510008');



INSERT INTO ordenes_servicio
(id_moto, servicio, mecanico, costo, estado, fecha_ingreso, fecha_entrega)
VALUES
(1,'Cambio de aceite','Roberto Perez',250.00,'finalizado','2026-07-01','2026-07-02'),
(2,'Revision de frenos','Daniel Gomez',400.00,'en_proceso','2026-07-03',NULL),
(3,'Cambio de cadena','Roberto Perez',550.00,'finalizado','2026-07-04','2026-07-05'),
(4,'Mantenimiento general','Carlos Ruiz',900.00,'pendiente','2026-07-06',NULL),
(5,'Cambio de llantas','Daniel Gomez',1200.00,'finalizado','2026-07-07','2026-07-09'),
(6,'Afinacion motor','Carlos Ruiz',700.00,'en_proceso','2026-07-10',NULL),
(7,'Cambio bateria','Roberto Perez',300.00,'finalizado','2026-07-11','2026-07-11'),
(8,'Diagnostico completo','Daniel Gomez',350.00,'pendiente','2026-07-12',NULL);