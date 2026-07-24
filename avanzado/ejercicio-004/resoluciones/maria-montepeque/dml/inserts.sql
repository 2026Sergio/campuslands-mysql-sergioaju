-- avanzado/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

-- 1. Carga inicial del garaje
INSERT INTO motos_garaje_trg
    (placa, marca, modelo, precio, estado, fecha_ingreso)
VALUES
    ('MTA-101', 'Yamaha', 'MT-07', 8500.00, 'disponible', '2026-06-01'),
    ('MTA-102', 'Honda', 'CB500F', 6800.50, 'disponible', '2026-06-05'),
    ('MTA-103', 'Kawasaki', 'Ninja 400', 6200.00, 'disponible', '2026-05-10'),
    ('MTA-104', 'Suzuki', 'GSX-S750', 7100.75, 'en_reparacion', '2026-04-22'),
    ('MTA-105', 'Yamaha', 'R3', 5900.00, 'disponible', '2026-07-02'),
    ('MTA-106', 'Honda', 'CBR600RR', 8900.00, 'disponible', '2026-03-15'),
    ('MTA-107', 'Kawasaki', 'Z900', 11200.00, 'disponible', '2026-07-18'),
    ('MTA-108', 'Ducati', 'Monster 821', 12500.00, 'disponible', '2026-02-20'),
    ('MTA-109', 'Suzuki', 'V-Strom 650', 8300.25, 'disponible', '2026-06-28'),
    ('MTA-110', 'BMW', 'F 900 R', 13400.00, 'en_reparacion', '2026-07-10');

-- 2. Cambios de precio: cada UPDATE dispara trg_motos_after_update_precio
--    (y de paso trg_motos_before_update, que refresca fecha_ultima_modificacion)
UPDATE motos_garaje_trg SET precio = 8200.00 WHERE placa = 'MTA-101';
UPDATE motos_garaje_trg SET precio = 6900.00 WHERE placa = 'MTA-105';

-- 3. Cambios de estado: cada UPDATE dispara trg_motos_after_update_estado
UPDATE motos_garaje_trg SET estado = 'vendida' WHERE placa = 'MTA-102';
UPDATE motos_garaje_trg SET estado = 'en_reparacion' WHERE placa = 'MTA-107';

-- 4. Cambio combinado: esta actualizacion modifica precio Y estado a la vez,
--    por lo que deben quedar registradas DOS filas de historial (una en cada
--    tabla), generadas por los dos triggers AFTER UPDATE en la misma sentencia.
UPDATE motos_garaje_trg SET precio = 5600.00, estado = 'vendida' WHERE placa = 'MTA-105';

-- 5. Actualizacion "neutra": se corrige la fecha de ingreso de una moto sin
--    tocar precio ni estado. Debe disparar el trigger BEFORE UPDATE (nueva
--    fecha_ultima_modificacion) pero NO debe generar ninguna fila de
--    historial, porque ni el precio ni el estado cambiaron.
UPDATE motos_garaje_trg SET fecha_ingreso = '2026-05-11' WHERE placa = 'MTA-103';
