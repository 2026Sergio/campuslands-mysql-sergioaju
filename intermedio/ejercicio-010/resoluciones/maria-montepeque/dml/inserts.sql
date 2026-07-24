-- intermedio/ejercicio-010 - maria-montepeque
USE campuslands_mysql;

-- Hay dos pilotos distintos llamados "Kairo Vega" (homonimos): cada uno tiene
-- su propio alias y licencia unicos, y ademas un vehiculo distinto, por lo
-- que no chocan ni con el UNIQUE simple ni con el UNIQUE compuesto.
INSERT INTO pilotos_carreras_urbanas
    (nombre, alias, licencia_piloto, vehiculo, circuito_local, puntos_temporada, estado)
VALUES
    ('Kairo Vega', 'K-Vega', 'LIC-0001', 'Nissan Silvia S15', 'Circuito Norte', 1200, 'activo'),
    ('Kairo Vega', 'KV-Estrella', 'LIC-0007', 'Toyota AE86', 'Circuito Sur', 850, 'activo'),
    ('Zara Nightfall', 'Z-Night', 'LIC-0002', 'Mazda RX-7', 'Circuito Este', 1600, 'activo'),
    ('Rex Turbo', 'R-Turbo', 'LIC-0003', 'Toyota Supra', 'Circuito Sur', 1400, 'suspendido'),
    ('Luna Drift', 'L-Drift', 'LIC-0004', 'Honda Civic Type R', 'Circuito Este', 950, 'activo'),
    ('Mika Blaze', 'M-Blaze', 'LIC-0005', 'Subaru Impreza WRX', 'Circuito Oeste', 700, 'activo'),
    ('Byte Runner', 'B-Runner', 'LIC-0006', 'Mitsubishi Evo IX', 'Circuito Norte', 1100, 'activo'),
    ('Skye Fenix', 'S-Fenix', 'LIC-0008', 'Nissan GT-R', 'Circuito Oeste', 1750, 'activo'),
    ('Pixel Storm', 'P-Storm', 'LIC-0009', 'BMW M3 E46', 'Circuito Sur', 500, 'retirado'),
    ('Nova Circuit', 'N-Circuit', 'LIC-0010', 'Ford Mustang GT', 'Circuito Este', 1300, 'activo');
