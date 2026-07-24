USE db_moba_torneo;

INSERT INTO equipos (nombre, region, estado) VALUES
('Nexus Gaming', 'Norteamérica', 'Activo'),
('Void Breakers', 'Europa', 'Activo'),
('Shadow Titans', 'Latinoamérica', 'Activo'),
('Celestial 5', 'Asia', 'Eliminado'),
('Iron Wolves', 'Latinoamérica', 'Activo');

INSERT INTO jugadores (alias, rol, kda, id_equipo) VALUES
('FakerX', 'Mid', 4.85, 1),
('BlitzCrush', 'Soporte', 3.10, 1),
('ViperZ', 'ADC', 5.40, 2),
('ShadowKnight', 'Jungla', 2.95, 2),
('Frostbite', 'Top', 3.75, 3),
('NeonPulse', 'Mid', 4.20, 3),
('ZeusLightning', 'Top', 6.10, 4),
('Moonlight', 'ADC', 4.90, 4),
('IronClaw', 'Jungla', 3.50, 5),
('SilentSniper', 'Soporte', 4.05, 5);