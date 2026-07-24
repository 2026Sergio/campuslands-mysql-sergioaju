USE taller_mecanico_motos;

INSERT INTO clientes(nombre,dpi,telefono,correo,direccion,fecha_registro)
VALUES
('Juan Pérez','1001001001','55550101','juan@email.com','Zona 1','2026-01-10'),
('Ana López','1001001002','55550102','ana@email.com','Zona 2','2026-01-12'),
('Carlos Ruiz','1001001003','55550103','carlos@email.com','Zona 3','2026-01-15'),
('María Gómez','1001001004','55550104','maria@email.com','Zona 4','2026-01-20'),
('Luis Díaz','1001001005','55550105','luis@email.com','Zona 5','2026-01-25'),
('Kevin Morales','1001001006','55550106','kevin@email.com','Zona 6','2026-02-01');

INSERT INTO motos(placa,marca,modelo,anio,color,kilometraje,id_cliente)
VALUES
('P100ABC','Honda','CB190R',2022,'Rojo',12000,1),
('P101BCD','Yamaha','R3',2021,'Azul',18000,2),
('P102CDE','Suzuki','GSX250R',2023,'Negro',5000,3),
('P103DEF','KTM','Duke 390',2022,'Naranja',8000,4),
('P104EFG','Bajaj','Pulsar NS200',2021,'Gris',25000,5),
('P105FGH','Kawasaki','Ninja 400',2024,'Verde',3000,6);

INSERT INTO mecanicos(nombre,especialidad,telefono,salario)
VALUES
('Pedro López','Motor','44440101',4500),
('Mario Díaz','Electricidad','44440102',4700),
('José Ramírez','Suspensión','44440103',4300),
('Andrea Soto','Frenos','44440104',4200),
('Luis García','Diagnóstico','44440105',5000),
('Carlos Méndez','General','44440106',4100);

INSERT INTO servicios(nombre,descripcion,precio)
VALUES
('Cambio de aceite','Lubricación completa',150),
('Cambio de frenos','Pastillas delanteras',300),
('Diagnóstico','Revisión general',120),
('Servicio completo','Mantenimiento total',850),
('Cambio de llantas','Instalación de llantas',500),
('Afinación','Ajuste de motor',250);

INSERT INTO ordenes_servicio(id_moto,id_mecanico,id_servicio,fecha_ingreso,fecha_salida,estado,total)
VALUES
(1,1,1,'2026-02-01','2026-02-01','Finalizado',150),
(2,2,2,'2026-02-03','2026-02-04','Finalizado',300),
(3,3,3,'2026-02-05',NULL,'En Proceso',120),
(4,4,4,'2026-02-06',NULL,'Pendiente',850),
(5,5,5,'2026-02-08','2026-02-09','Finalizado',500),
(6,6,6,'2026-02-10',NULL,'Pendiente',250);
