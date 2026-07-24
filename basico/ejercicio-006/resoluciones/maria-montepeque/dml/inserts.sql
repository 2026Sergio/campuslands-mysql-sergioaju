-- basico/ejercicio-006 - maria-montepeque
USE campuslands_mysql;

INSERT INTO autos_hiperdeportivos
    (placa, marca, modelo, pais_origen, anio, potencia_hp, velocidad_max_kmh, precio, estado)
VALUES
    ('HPC-001', 'Ferrari', 'SF90 Stradale', 'Italia', 2023, 986, 340, 625000.00, 'vendido'),
    ('HPC-002', 'Lamborghini', 'Revuelto', 'Italia', 2024, 1015, 350, 608000.00, 'disponible'),
    ('HPC-003', 'Bugatti', 'Chiron', 'Francia', 2021, 1500, 420, 3000000.00, 'reservado'),
    ('HPC-004', 'McLaren', '765LT', 'Reino Unido', 2022, 765, 330, 358000.00, 'disponible'),
    ('HPC-005', 'Koenigsegg', 'Jesko', 'Suecia', 2023, 1600, 480, 3400000.00, 'reservado'),
    ('HPC-006', 'Pagani', 'Huayra', 'Italia', 2020, 730, 383, 2600000.00, 'vendido'),
    ('HPC-007', 'Porsche', '911 GT2 RS', 'Alemania', 2021, 700, 340, 293000.00, 'disponible'),
    ('HPC-008', 'Aston Martin', 'Valkyrie', 'Reino Unido', 2024, 1160, 402, 3200000.00, 'reservado'),
    ('HPC-009', 'Rimac', 'Nevera', 'Croacia', 2023, 1914, 412, 2400000.00, 'disponible'),
    ('HPC-010', 'Ferrari', '296 GTB', 'Italia', 2022, 830, 330, 322000.00, 'vendido');
