-- Datos de practica para inventario de skins (10 por tabla).
USE campuslands_mysql;

INSERT INTO intermedio_ejercicio_003_armas (nombre, tipo) 
    VALUES ('Vandal', 'Rifle de Asalto'),
    ('Phantom', 'Rifle de Asalto'),
    ('Operator', 'Francotirador'),
    ('Classic', 'Pistola'),
    ('Sheriff', 'Pistola'),
    ('Spectre', 'Subfusil'),
    ('Judge', 'Escopeta'),
    ('Odin', 'Ametralladora Pesada'),
    ('Marshall', 'Francotirador'),
    ('Ghost', 'Pistola');
    
INSERT INTO intermedio_ejercicio_003_skins (arma_id, nombre_skin, rareza, precio) 
    VALUES (1, 'Vandal Prime', 'Legendaria', 1775.00),
    (1, 'Vandal Reaver', 'Epica', 1775.00),
    (2, 'Phantom Oni', 'Epica', 1775.00),
    (3, 'Operator Dragon Lore', 'Mitica', 2475.00),
    (4, 'Classic Glitchpop', 'Legendaria', 2175.00),
    (5, 'Sheriff Ion', 'Epica', 1775.00),
    (6, 'Spectre Singularity', 'Legendaria', 2175.00),
    (7, 'Judge Elderflame', 'Mitica', 2475.00),
    (8, 'Odin Prime', 'Legendaria', 1775.00),
    (10, 'Ghost Soberania', 'Epica', 1775.00);