USE inventario_skins_shooter;

INSERT INTO jugadores(nombre,nickname,pais) VALUES
('Juan Pérez','ShadowGT','Guatemala'),
('Luis Gómez','SniperMX','México'),
('Carlos Díaz','GhostCO','Colombia'),
('María López','PhoenixCR','Costa Rica'),
('Ana Morales','NightSV','El Salvador'),
('Pedro Castillo','HunterHN','Honduras');

INSERT INTO categorias_skin(nombre) VALUES
('Rifle'),
('Pistola'),
('Escopeta'),
('Subfusil'),
('Francotirador'),
('Cuchillo');

INSERT INTO skins(nombre,rareza,precio,id_categoria) VALUES
('Dragon Fire','Legendaria',1200.00,1),
('Golden Eagle','Epica',800.00,2),
('Urban Storm','Rara',450.00,4),
('Dark Hunter','Legendaria',1500.00,5),
('Crimson Blade','Epica',950.00,6),
('Desert Wolf','Comun',200.00,3);

INSERT INTO inventario(id_jugador,id_skin,cantidad,fecha_adquisicion) VALUES
(1,1,1,'2026-01-15'),
(1,2,2,'2026-01-18'),
(2,3,3,'2026-02-01'),
(3,4,1,'2026-02-10'),
(4,5,2,'2026-03-05'),
(5,1,1,'2026-03-08'),
(5,6,4,'2026-03-15'),
(6,3,2,'2026-04-01');