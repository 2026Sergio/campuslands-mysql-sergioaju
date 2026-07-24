USE db_battle_royale;

INSERT INTO clanes (nombre, region) VALUES
('Shadow Phantoms', 'Norteamérica'),
('Apex Predators', 'Europa'),
('Ghost Squad', 'Latinoamérica'),
('Lone Wolves', 'Asia'); 

INSERT INTO jugadores (alias, eliminaciones, puntos_ranking, id_clan) VALUES
('SniperKing', 45, 2500.50, 1),
('ShadowGhost', 38, 2300.00, 1),
('Vortex', 52, 2800.75, 2),
('BlazeRunner', 29, 1950.25, 2),
('Titanium', 41, 2450.00, 3),
('VenomStrike', 33, 2100.80, 3),
('CyberNinja', 60, 3100.00, NULL),
('NeonValkyrie', 47, 2750.40, NULL),
('StormRider', 25, 1800.00, 3),
('AlphaWolf', 55, 2950.10, 2);