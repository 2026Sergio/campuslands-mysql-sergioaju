-- DML: Registros de clanes y jugadores (incluye casos límite sin relación)
USE campuslands_mysql;

-- Inserción de 4 Clanes
INSERT INTO clanes (nombre_clan, region, nivel_clan) VALUES
('Alpha Predators', 'SA-North', 10),
('Shadow Wolves', 'NA-East', 5),
('Cyber Warriors', 'EU-Central', 8),
('Lone Valkyries', 'SA-South', 2); -- Clan recién creado sin miembros

-- Inserción de 8 Jugadores
INSERT INTO jugadores (clan_id, nickname, puntos_ranking, estado) VALUES
(1, 'VortexPlayer', 2850, 'activo'),
(1, 'GhostRecon', 3100, 'activo'),
(2, 'BlazeFury', 1950, 'activo'),
(2, 'NightHawk', 2200, 'inactivo'),
(3, 'PixelQueen', 4100, 'activo'),
(NULL, 'SoloLegend', 3500, 'activo'),   -- Jugador sin clan
(NULL, 'RookieBot', 450, 'activo'),      -- Jugador sin clan
(NULL, 'SilentStalker', 1200, 'inactivo'); -- Jugador sin clan
