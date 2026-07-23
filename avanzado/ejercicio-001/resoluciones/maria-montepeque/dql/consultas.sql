-- avanzado/ejercicio-001 - maria-montepeque
USE campuslands_mysql;

-- 1. Saldo actual de todos los jugadores (FerNova debe quedar en 400.00,
--    ValStorm debe seguir en 600.00 porque su compra se revirtio)
SELECT
    gamer_tag,
    saldo_creditos
FROM jugadores_saldo_moba
ORDER BY saldo_creditos DESC;

-- 2. Inscripciones confirmadas a "Copa Verano MOBA" (solo debe aparecer FerNova)
SELECT
    j.gamer_tag,
    i.torneo_nombre,
    i.costo_creditos
FROM inscripciones_torneo_moba AS i
JOIN jugadores_saldo_moba AS j ON j.id = i.jugador_id
WHERE i.torneo_nombre = 'Copa Verano MOBA';

-- 3. Verificar que ValStorm NO quedo inscrito (0 filas esperadas: prueba del ROLLBACK)
SELECT COUNT(*) AS inscripciones_valstorm_verano
FROM inscripciones_torneo_moba AS i
JOIN jugadores_saldo_moba AS j ON j.id = i.jugador_id
WHERE j.gamer_tag = 'ValStorm' AND i.torneo_nombre = 'Copa Verano MOBA';

-- 4. Historial completo de inscripciones (historicas + la confirmada por transaccion)
SELECT
    j.gamer_tag,
    i.torneo_nombre,
    i.costo_creditos,
    i.fecha_inscripcion
FROM inscripciones_torneo_moba AS i
JOIN jugadores_saldo_moba AS j ON j.id = i.jugador_id
ORDER BY i.fecha_inscripcion;

-- 5. Total de creditos en circulacion entre todos los jugadores
SELECT SUM(saldo_creditos) AS creditos_totales_en_circulacion
FROM jugadores_saldo_moba;

-- 6. Jugadores que aun tienen saldo suficiente (>= 100) para inscribirse a otro torneo
SELECT
    gamer_tag,
    saldo_creditos
FROM jugadores_saldo_moba
WHERE saldo_creditos >= 100
ORDER BY saldo_creditos DESC;
