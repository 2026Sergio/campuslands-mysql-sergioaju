-- basico/ejercicio-004 - maria-montepeque
USE campuslands_mysql;

INSERT INTO motos_garaje
    (placa, marca, modelo, cilindraje, anio, precio, color, estado, fecha_ingreso)
VALUES
    ('MTA-101', 'Yamaha', 'MT-07', 689, 2023, 8500.00, 'Azul', 'disponible', '2026-06-01'),
    ('MTA-102', 'Honda', 'CB500F', 471, 2022, 6800.50, 'Rojo', 'disponible', '2026-06-05'),
    ('MTA-103', 'Kawasaki', 'Ninja 400', 399, 2021, 6200.00, 'Verde', 'vendida', '2026-05-10'),
    ('MTA-104', 'Suzuki', 'GSX-S750', 749, 2020, 7100.75, 'Negro', 'en_reparacion', '2026-04-22'),
    ('MTA-105', 'Yamaha', 'R3', 321, 2023, 5900.00, 'Azul', 'disponible', '2026-07-02'),
    ('MTA-106', 'Honda', 'CBR600RR', 599, 2019, 8900.00, 'Blanco', 'disponible', '2026-03-15'),
    ('MTA-107', 'Kawasaki', 'Z900', 948, 2024, 11200.00, 'Negro', 'disponible', '2026-07-18'),
    ('MTA-108', 'Ducati', 'Monster 821', 821, 2021, 12500.00, 'Rojo', 'vendida', '2026-02-20'),
    ('MTA-109', 'Suzuki', 'V-Strom 650', 645, 2022, 8300.25, 'Gris', 'disponible', '2026-06-28'),
    ('MTA-110', 'BMW', 'F 900 R', 895, 2023, 13400.00, 'Blanco', 'en_reparacion', '2026-07-10');
