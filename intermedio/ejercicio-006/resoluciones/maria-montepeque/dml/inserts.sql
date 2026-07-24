-- intermedio/ejercicio-006 - maria-montepeque
USE campuslands_mysql;

INSERT INTO modelos_hiperdeportivos
    (marca, modelo, anio, potencia_hp, precio)
VALUES
    ('Ferrari', 'SF90 Stradale', 2023, 986, 625000.00),
    ('Lamborghini', 'Revuelto', 2024, 1015, 608000.00),
    ('McLaren', '765LT', 2022, 765, 358000.00),
    ('Porsche', '911 GT2 RS', 2021, 700, 293000.00),
    ('Bugatti', 'Chiron', 2021, 1500, 3000000.00),
    ('Koenigsegg', 'Jesko', 2023, 1600, 3400000.00);

-- Cada color es una fila atomica (1FN), en vez de una lista dentro de una sola celda.
INSERT INTO colores_disponibles_modelo
    (modelo_id, color)
VALUES
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'SF90 Stradale'), 'Rojo'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'SF90 Stradale'), 'Amarillo'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'SF90 Stradale'), 'Negro'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Revuelto'), 'Verde'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Revuelto'), 'Naranja'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Revuelto'), 'Negro'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Revuelto'), 'Blanco'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = '765LT'), 'Naranja'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = '765LT'), 'Azul'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = '911 GT2 RS'), 'Blanco'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = '911 GT2 RS'), 'Negro'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = '911 GT2 RS'), 'Gris'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Chiron'), 'Azul'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Chiron'), 'Negro'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Jesko'), 'Gris'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Jesko'), 'Rojo'),
    ((SELECT id FROM modelos_hiperdeportivos WHERE modelo = 'Jesko'), 'Blanco');
