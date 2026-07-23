/* Script unificado de consultas SQL y control de transacciones para el torneo MOBA (Filtrado de candidatos a fichaje, Control de Transacciones ACID con START TRANSACTION, UPDATE debitos/creditos, INSERT de auditoria, SAVEPOINT, ROLLBACK y COMMIT) */

-- 1. CONSULTA DE FILTRADO: Candidatos para comprar
SELECT 
    j.jugador_id,
    j.nickname,
    j.rol,
    j.clausula_rescision,
    COALESCE(e.nombre_equipo, 'Agente Libre') AS equipo_actual
FROM jugadores j
LEFT JOIN equipos e ON j.equipo_id = e.equipo_id
WHERE j.estado_fichable = TRUE 
  AND j.clausula_rescision <= 150000.00;


-- 2. BLOQUE TRANSACCIONAL ACID: Fichaje Exitoso de 'Caps' de G2 (id=2) a Cloud9 (id=3)
START TRANSACTION;

-- Paso A: Descontar presupuesto al equipo comprador (Cloud9)
UPDATE equipos 
SET presupuesto_fichajes = presupuesto_fichajes - 150000.00
WHERE equipo_id = 3 AND presupuesto_fichajes >= 150000.00;

-- Paso B: Abonar el costo de cláusula al equipo vendedor (G2 Esports)
UPDATE equipos 
SET presupuesto_fichajes = presupuesto_fichajes + 150000.00
WHERE equipo_id = 2;

-- Punto de control en la transacción
SAVEPOINT asignacion_jugador;

-- Paso C: Transferir el contrato del jugador (Caps: jugador_id = 6)
UPDATE jugadores 
SET equipo_id = 3,
    salario_mensual = 17000.00
WHERE jugador_id = 6 AND estado_fichable = TRUE;

-- Paso D: Registrar auditoría en el historial
INSERT INTO fichajes_historial (jugador_id, equipo_origen_id, equipo_destino_id, monto_monto_transaccion)
VALUES (6, 2, 3, 150000.00);

-- Confirmar de manera permanente todos los cambios en la BD
COMMIT;


-- 3. DEMOSTRACIÓN DE REVERTIBILIDAD (ROLLBACK) POR FALLO DE REQUISITOS
START TRANSACTION;

-- Intento de compra por parte de Fnatic (id=4) sobre 'Faker' (id=1, clausula=250000)
-- Fnatic solo tiene 180,000 de presupuesto.
UPDATE equipos 
SET presupuesto_fichajes = presupuesto_fichajes - 250000.00
WHERE equipo_id = 4 AND presupuesto_fichajes >= 250000.00;

-- Dado que el paso anterior no afectó filas por el CHECK/WHERE de seguridad, revertimos toda la transacción
ROLLBACK;


-- 4. CONSULTA DE AGREGACIÓN Y AUDITORÍA TRAS LA TRANSACCIÓN
SELECT 
    e.nombre_equipo,
    e.presupuesto_fichajes,
    COUNT(j.jugador_id) AS total_jugadores_actuales,
    COALESCE(SUM(j.salario_mensual), 0.00) AS nomina_mensual_total
FROM equipos e
LEFT JOIN jugadores j ON e.equipo_id = j.equipo_id
GROUP BY e.equipo_id, e.nombre_equipo, e.presupuesto_fichajes;


-- 5. CONSULTA TOP 5: Fichajes más costosos registrados en la historia del torneo
SELECT 
    fh.fichaje_id,
    j.nickname,
    eo.nombre_equipo AS equipo_vendedor,
    ed.nombre_equipo AS equipo_comprador,
    fh.monto_monto_transaccion,
    fh.fecha_fichaje
FROM fichajes_historial fh
INNER JOIN jugadores j ON fh.jugador_id = j.jugador_id
LEFT JOIN equipos eo ON fh.equipo_origen_id = eo.equipo_id
INNER JOIN equipos ed ON fh.equipo_destino_id = ed.equipo_id
ORDER BY fh.monto_monto_transaccion DESC
LIMIT 5;