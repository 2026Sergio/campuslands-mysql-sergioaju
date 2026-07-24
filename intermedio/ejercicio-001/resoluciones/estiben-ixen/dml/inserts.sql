USE campuslands_mysql;

INSERT INTO equipos(nombre, region, entrenador, estado)
VALUES
('Dragons','Guatemala','Carlos Pérez','Activo'),
('Titans','México','Luis Gómez','Activo'),
('Phoenix','Costa Rica','Ana Ruiz','Activo'),
('Warriors','El Salvador','Mario López','Activo');

INSERT INTO jugadores
(id_equipo, nickname, nombre_real, edad, rol, puntaje, estado)
VALUES
(1,'Shadow','José García',20,'Top',91.50,'Activo'),
(1,'Storm','Luis Méndez',22,'Jungla',88.40,'Activo'),
(2,'Hunter','Carlos Díaz',19,'ADC',95.20,'Activo'),
(2,'Nova','Marcos Pérez',21,'Medio',90.80,'Activo'),
(3,'Ghost','Kevin Ramos',23,'Soporte',84.50,'Activo'),
(3,'TitanX','Andrés León',20,'Top',93.40,'Suspendido'),
(4,'Blade','Juan Morales',18,'Jungla',80.00,'Activo'),
(4,'Fire','Pedro Gómez',24,'ADC',87.30,'Activo');