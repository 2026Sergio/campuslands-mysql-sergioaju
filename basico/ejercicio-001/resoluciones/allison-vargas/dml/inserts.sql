-- DML: Inserción de 8 registros de jugadores
USE campuslands_mysql;

INSERT INTO jugadores (nickname, rol, nivel, puntos_clasificacion, kda, estado) VALUES
('ShadowSlayer', 'Mid', 45, 2450, 4.25, 'activo'),
('ViperGuard', 'Support', 38, 1890, 3.10, 'activo'),
('IronTerrors', 'Top', 50, 3100, 2.85, 'activo'),
('FrostByte', 'ADC', 42, 2200, 4.80, 'activo'),
('JungleKing', 'Jungle', 29, 1250, 1.95, 'inactivo'),
('MysticSpell', 'Mid', 48, 2900, 5.10, 'activo'),
('ToxicBlade', 'Top', 15, 600, 0.85, 'suspendido'),
('ShieldBearer', 'Support', 33, 1650, 3.45, 'activo');
