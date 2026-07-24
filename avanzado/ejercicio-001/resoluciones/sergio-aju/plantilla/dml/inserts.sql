USE db_moba_transacciones;

-- Insertar equipos con fondos iniciales (mínimo 8 registros requeridos)
INSERT INTO equipos (nombre, region, fondos_premio) VALUES
('Nexus Gaming', 'Norteamérica', 15000.00),
('Void Breakers', 'Europa', 12500.50),
('Shadow Titans', 'Latinoamérica', 8000.00),
('Celestial 5', 'Asia', 22000.00),
('Iron Wolves', 'Latinoamérica', 9500.00),
('Apex Predators', 'Europa', 14000.00),
('Ghost Squad', 'Norteamérica', 11000.00),
('Cyber Ninjas', 'Asia', 19000.00);

-- Ejemplo práctico de Transacción en MySQL (Simulación de transferencia de fondos o premios entre equipos)
START TRANSACTION;

-- 1. Descontar fondos del equipo origen (Ej: ID 1 transfiere a ID 3)
UPDATE equipos 
SET fondos_premio = fondos_premio - 2500.00 
WHERE id = 1 AND fondos_premio >= 2500.00;

-- 2. Acreditar fondos al equipo destino
UPDATE equipos 
SET fondos_premio = fondos_premio + 2500.00 
WHERE id = 3;

-- 3. Registrar la transferencia en el historial
INSERT INTO transferencias_historial (id_equipo_origen, id_equipo_destino, monto) 
VALUES (1, 3, 2500.00);

-- Si todo sale bien, confirmamos los cambios
COMMIT;
-- En caso de error lógico se usaría: ROLLBACK;