INSERT INTO escuadras (nombre, region, estado) VALUES
('Dragons', 'Guatemala', 'Activo'),
('Titans', 'Mexico', 'Activo'),
('Phoenix', 'Costa Rica', 'Activo'),
('Wolves', 'Honduras', 'Activo');

INSERT INTO participantes (nombre, nickname, rol, id_escuadra, puntaje) VALUES
('Carlos Lopez', 'DragonX', 'Top', 1, 95.50),
('Ana Perez', 'FireGirl', 'Jungla', 1, 88.00),
('Luis Gomez', 'TitanPro', 'Mid', 2, 91.30),
('Mario Ruiz', 'Sniper', 'ADC', 2, 86.20),
('Sofia Diaz', 'Phenix', 'Support', 3, 98.70),
('Andrea Soto', 'Shadow', 'Mid', 3, 90.40),
('Jose Morales', 'WolfOne', 'Top', 4, 79.50),
('Kevin Ramos', 'Hunter', 'ADC', 4, 84.80);

COMMIT;