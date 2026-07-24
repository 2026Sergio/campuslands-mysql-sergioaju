USE inventario_skins_shooter;

INSERT INTO jugadores(nombre,nickname,pais,fecha_registro)
VALUES
('Juan Perez','Ghost','Guatemala','2025-01-10'),
('Carlos Ruiz','SniperX','Mexico','2025-02-15'),
('Luis Soto','Blaze','Colombia','2025-03-05'),
('Ana Lopez','Phoenix','Guatemala','2025-04-12'),
('Mario Diaz','Shadow','Peru','2025-05-20'),
('Kevin Morales','Titan','Costa Rica','2025-06-02');

INSERT INTO categorias(nombre,descripcion)
VALUES
('Rifle','Aspectos para rifles'),
('Pistola','Aspectos para pistolas'),
('Escopeta','Aspectos para escopetas'),
('Francotirador','Aspectos para rifles de precisión'),
('Subfusil','Aspectos para SMG'),
('Cuchillo','Aspectos para armas cuerpo a cuerpo');

INSERT INTO skins(nombre,rareza,precio,id_categoria)
VALUES
('Dragon Fire','Legendaria',250.00,1),
('Golden Eagle','Epica',180.00,2),
('Ice Storm','Rara',120.00,3),
('Shadow Strike','Legendaria',300.00,4),
('Neon Flash','Epica',200.00,5),
('Crimson Blade','Legendaria',450.00,6);

INSERT INTO inventario(id_jugador,id_skin,fecha_adquisicion,equipada)
VALUES
(1,1,'2026-01-10',TRUE),
(2,2,'2026-01-12',FALSE),
(3,3,'2026-01-18',TRUE),
(4,4,'2026-02-05',TRUE),
(5,5,'2026-02-10',FALSE),
(6,6,'2026-02-18',TRUE);

INSERT INTO compras(id_jugador,fecha,total,metodo_pago)
VALUES
(1,'2026-01-10 15:30:00',250.00,'Tarjeta'),
(2,'2026-01-12 18:00:00',180.00,'PayPal'),
(3,'2026-01-18 20:15:00',120.00,'Tarjeta'),
(4,'2026-02-05 11:00:00',300.00,'Transferencia'),
(5,'2026-02-10 09:45:00',200.00,'Tarjeta'),
(6,'2026-02-18 22:10:00',450.00,'PayPal');