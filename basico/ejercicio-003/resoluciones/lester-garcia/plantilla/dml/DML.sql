USE inventario_skins_shooter;

INSERT INTO jugadores (nickname,nombre,pais,nivel,fecha_registro)
VALUES
('Shadow','Luis García','Guatemala',42,'2025-01-10'),
('Ghost','Ana López','México',35,'2025-01-15'),
('Blaze','Carlos Pérez','Colombia',50,'2025-02-01'),
('Hunter','María Ruiz','Chile',27,'2025-02-18'),
('Falcon','Pedro Torres','Perú',61,'2025-03-05'),
('Titan','José Morales','Argentina',48,'2025-03-20'),
('Nova','Laura Díaz','España',39,'2025-04-08'),
('Wolf','Miguel Castro','Costa Rica',54,'2025-04-15'),
('Phoenix','Kevin Gómez','Honduras',45,'2025-05-02'),
('Storm','Sofía Herrera','El Salvador',37,'2025-05-15');

INSERT INTO armas (nombre,categoria,fabricante)
VALUES
('AK-47','Rifle de Asalto','Kalash'),
('M4A1','Rifle de Asalto','Colt'),
('AWP','Francotirador','Accuracy'),
('Desert Eagle','Pistola','Magnum'),
('MP5','Subfusil','Heckler'),
('UMP45','Subfusil','HK'),
('SCAR-H','Rifle de Asalto','FN'),
('Glock 18','Pistola','Glock'),
('P90','Subfusil','FN'),
('M249','Ametralladora','FN');

INSERT INTO skins (nombre,rareza,color_principal,precio,id_arma)
VALUES
('Dragon Fire','Legendaria','Rojo',120.00,1),
('Blue Storm','Epica','Azul',95.00,2),
('Golden Eagle','Legendaria','Dorado',150.00,3),
('Night Shadow','Rara','Negro',55.00,4),
('Urban Camo','Comun','Verde',15.00,5),
('Ice Crystal','Epica','Celeste',90.00,6),
('Inferno','Legendaria','Naranja',140.00,7),
('Silver Bullet','Poco Comun','Gris',30.00,8),
('Jungle Strike','Rara','Verde',48.00,9),
('Dark Steel','Epica','Negro',85.00,10);

INSERT INTO inventario (id_jugador,id_skin,fecha_adquisicion,equipada)
VALUES
(1,1,'2025-06-01',TRUE),
(2,2,'2025-06-02',TRUE),
(3,3,'2025-06-03',FALSE),
(4,4,'2025-06-05',TRUE),
(5,5,'2025-06-06',FALSE),
(6,6,'2025-06-07',TRUE),
(7,7,'2025-06-08',TRUE),
(8,8,'2025-06-09',FALSE),
(9,9,'2025-06-10',TRUE),
(10,10,'2025-06-11',FALSE);