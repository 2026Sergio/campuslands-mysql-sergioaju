USE campuslands_mysql;

INSERT INTO billeteras_equipo (nombre_equipo, saldo, estado) VALUES
('Dragones Rojos',  1200.00, 'activa'),
('Lobos de Acero',  850.00,  'activa'),
('Fenix Escarlata', 300.00,  'activa'),
('Ronin Digital',   0.00,    'congelada');

INSERT INTO movimientos_premio (id_billetera, tipo_movimiento, monto, concepto) VALUES
(1, 'deposito', 500.00, 'Premio primer lugar temporada 5'),
(2, 'deposito', 200.00, 'Premio top 3 regional'),
(3, 'deposito', 100.00, 'Premio consolacion');

-- === Transaccion exitosa: transferencia de premio de Dragones Rojos hacia Fenix Escarlata (patrocinio) ===
START TRANSACTION;

UPDATE billeteras_equipo SET saldo = saldo - 150.00 WHERE nombre_equipo = 'Dragones Rojos';
INSERT INTO movimientos_premio (id_billetera, tipo_movimiento, monto, concepto)
VALUES (1, 'retiro', 150.00, 'Transferencia de patrocinio a Fenix Escarlata');

SAVEPOINT antes_deposito;

UPDATE billeteras_equipo SET saldo = saldo + 150.00 WHERE nombre_equipo = 'Fenix Escarlata';
INSERT INTO movimientos_premio (id_billetera, tipo_movimiento, monto, concepto)
VALUES (3, 'deposito', 150.00, 'Recepcion de patrocinio de Dragones Rojos');

COMMIT;

-- === Transaccion fallida (caso limite): intento de retiro que dejaria saldo negativo en equipo congelado ===
START TRANSACTION;

UPDATE billeteras_equipo SET saldo = saldo - 500.00 WHERE nombre_equipo = 'Ronin Digital';
-- El CHECK (saldo >= 0) del schema impide este movimiento; se revierte manualmente
ROLLBACK;