-- avanzado/ejercicio-010 - maria-montepeque
USE campuslands_mysql;

INSERT INTO participaciones_carreras_urbanas_backup
    (piloto, vehiculo, circuito, posicion_llegada, premio_ganado, penalizaciones, estado, fecha_carrera)
VALUES
    ('Kairo Vega', 'Nissan Silvia S15', 'Circuito Norte', 1, 1500.00, 0, 'finalizada', '2026-05-01'),
    ('Kairo Vega', 'Nissan Silvia S15', 'Circuito Sur', 2, 900.00, 0, 'finalizada', '2026-06-01'),
    ('Zara Nightfall', 'Mazda RX-7', 'Circuito Norte', 3, 500.00, 1, 'finalizada', '2026-05-01'),
    ('Zara Nightfall', 'Mazda RX-7', 'Circuito Este', 1, 1600.00, 0, 'finalizada', '2026-06-15'),
    ('Rex Turbo', 'Toyota Supra', 'Circuito Sur', 1, 1400.00, 0, 'finalizada', '2026-06-01'),
    ('Rex Turbo', 'Toyota Supra', 'Circuito Oeste', 99, 0.00, 3, 'descalificado', '2026-07-10'),
    ('Luna Drift', 'Honda Civic Type R', 'Circuito Este', 2, 700.00, 0, 'finalizada', '2026-06-15'),
    ('Luna Drift', 'Honda Civic Type R', 'Circuito Norte', 4, 250.00, 0, 'finalizada', '2026-05-01'),
    ('Mika Blaze', 'Subaru Impreza WRX', 'Circuito Oeste', 3, 450.00, 1, 'finalizada', '2026-07-10'),
    ('Mika Blaze', 'Subaru Impreza WRX', 'Circuito Sur', 99, 0.00, 0, 'abandono', '2026-06-01');
