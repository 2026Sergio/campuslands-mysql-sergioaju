USE ranking_battle_royale;

INSERT INTO jugadores(nickname,nombre,edad,pais,fecha_registro,activo)
VALUES
('ShadowX','Luis García',20,'Guatemala','2025-01-10',TRUE),
('Storm','Carlos Pérez',22,'México','2025-01-15',TRUE),
('Blaze','Ana Torres',19,'Colombia','2025-02-01',TRUE),
('Hunter','Pedro Gómez',24,'Chile','2025-02-18',TRUE),
('Falcon','María Ruiz',21,'Perú','2025-03-02',TRUE),
('Titan','José López',23,'Argentina','2025-03-15',FALSE),
('Ghost','Laura Díaz',20,'España','2025-04-01',TRUE),
('Nova','Miguel Castro',18,'Costa Rica','2025-04-10',TRUE),
('Wolf','Kevin Morales',25,'Honduras','2025-04-20',TRUE),
('Phoenix','Sofía Herrera',22,'El Salvador','2025-05-05',TRUE);

INSERT INTO temporadas(nombre,fecha_inicio,fecha_fin,estado)
VALUES
('Temporada 1','2025-01-01','2025-03-31','Finalizada'),
('Temporada 2','2025-04-01','2025-06-30','Finalizada'),
('Temporada 3','2025-07-01','2025-09-30','Activa'),
('Temporada 4','2025-10-01','2025-12-31','Activa'),
('Elite Cup','2026-01-01','2026-03-31','Activa'),
('Masters','2026-04-01','2026-06-30','Activa'),
('Legends','2026-07-01','2026-09-30','Activa'),
('World Ranking','2026-10-01','2026-12-31','Activa');

INSERT INTO partidas(id_temporada,mapa,fecha,jugadores_participantes,duracion_minutos)
VALUES
(1,'Isla','2025-01-15 15:30:00',100,28),
(1,'Bosque','2025-02-10 16:00:00',98,31),
(2,'Ciudad','2025-04-12 17:00:00',100,30),
(2,'Desierto','2025-05-18 18:00:00',96,27),
(3,'Isla','2025-07-05 14:00:00',100,29),
(3,'Ciudad','2025-08-15 19:00:00',99,33),
(4,'Bosque','2025-10-08 20:00:00',97,32),
(5,'Desierto','2026-01-20 16:00:00',100,35),
(6,'Ciudad','2026-04-15 18:30:00',98,34),
(7,'Isla','2026-07-18 21:00:00',100,36);

INSERT INTO ranking(id_jugador,id_temporada,puntos,victorias,eliminaciones,precisión,posicion)
VALUES
(1,1,2450,8,120,78.50,2),
(2,1,2600,10,140,82.30,1),
(3,2,2100,6,100,74.10,5),
(4,2,2250,7,109,76.90,4),
(5,3,2400,9,130,81.40,2),
(6,3,1950,5,90,69.50,8),
(7,4,2150,6,105,73.80,6),
(8,5,2550,11,145,84.20,1),
(9,6,2320,8,118,79.60,3),
(10,7,2200,7,111,77.30,4);