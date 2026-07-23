USE db_guatemala;
TRUNCATE TABLE personas;

INSERT INTO personas (nombre, edad, departamento, puntos, activo) VALUES
('Carlos Morales', 20, Guatemala, 85, TRUE),
('Ana Gómez', 22, Sacatepéquez, 90, TRUE),
('José López', 19, Guatemala, 40, TRUE),
('María Juárez', 25, Quetzaltenango, 95, TRUE),
('Pedro Xol', 21, Alta Verapaz, 60, FALSE),
('Lucía Tzep', 23, Sololá, 75, TRUE),
('Sofía Castillo', 20, Quetzaltenango, 88, TRUE),
('Marcos Mapurain', 24, Guatemala, 50, FALSE);