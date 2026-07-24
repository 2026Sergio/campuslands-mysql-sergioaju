-- avanzado/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

-- 1. Carga inicial de jugadores con su saldo de creditos del torneo
INSERT INTO jugadores_saldo_moba
    (gamer_tag, saldo_creditos)
VALUES
    ('FerNova', 500.00),
    ('DiegoHex', 320.00),
    ('JulianRune', 150.00),
    ('RickTide', 80.00),
    ('ValStorm', 600.00),
    ('BrunoAxe', 45.00);

-- 2. Inscripciones historicas ya confirmadas (datos de referencia, sin transaccion)
INSERT INTO inscripciones_torneo_moba
    (jugador_id, torneo_nombre, costo_creditos)
VALUES
    ((SELECT id FROM jugadores_saldo_moba WHERE gamer_tag = 'DiegoHex'), 'Copa Primavera MOBA', 80.00),
    ((SELECT id FROM jugadores_saldo_moba WHERE gamer_tag = 'JulianRune'), 'Copa Primavera MOBA', 80.00);

-- 3. TRANSACCION EXITOSA: FerNova compra su inscripcion a "Copa Verano MOBA"
--    (saldo suficiente: 500 >= 100). Se resta el costo y se registra la
--    inscripcion como una sola unidad atomica; si todo sale bien, se confirma
--    con COMMIT.
START TRANSACTION;

UPDATE jugadores_saldo_moba
SET saldo_creditos = saldo_creditos - 100.00
WHERE gamer_tag = 'FerNova';

INSERT INTO inscripciones_torneo_moba
    (jugador_id, torneo_nombre, costo_creditos)
VALUES
    ((SELECT id FROM jugadores_saldo_moba WHERE gamer_tag = 'FerNova'), 'Copa Verano MOBA', 100.00);

COMMIT;

-- 4. TRANSACCION CANCELADA: ValStorm inicia la compra de su inscripcion a
--    "Copa Verano MOBA" (tiene saldo de sobra: 600 >= 100), pero el proceso
--    de pago se cancela antes de confirmar. Con ROLLBACK, tanto el descuento
--    de saldo como el registro de inscripcion se deshacen por completo: no
--    debe quedar ningun rastro de esta compra en la base de datos.
START TRANSACTION;

UPDATE jugadores_saldo_moba
SET saldo_creditos = saldo_creditos - 100.00
WHERE gamer_tag = 'ValStorm';

INSERT INTO inscripciones_torneo_moba
    (jugador_id, torneo_nombre, costo_creditos)
VALUES
    ((SELECT id FROM jugadores_saldo_moba WHERE gamer_tag = 'ValStorm'), 'Copa Verano MOBA', 100.00);

ROLLBACK;
