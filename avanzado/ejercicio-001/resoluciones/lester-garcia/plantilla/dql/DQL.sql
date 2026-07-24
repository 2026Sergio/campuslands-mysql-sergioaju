USE torneo_esports_moba;

-- 1
SELECT *
FROM equipos;

-- 2
SELECT nombre,nickname,rol
FROM jugadores;

-- 3
SELECT nombre,premio
FROM torneos
ORDER BY premio DESC;

-- 4
SELECT nombre,edad
FROM jugadores
WHERE edad > 21;

-- 5
SELECT e.nombre,
COUNT(j.id_jugador) AS cantidad_jugadores
FROM equipos e
LEFT JOIN jugadores j
ON e.id_equipo=j.id_equipo
GROUP BY e.id_equipo;

-- 6
SELECT t.nombre,
COUNT(p.id_partida) AS partidas
FROM torneos t
LEFT JOIN partidas p
ON t.id_torneo=p.id_torneo
GROUP BY t.id_torneo;

-- 7
SELECT nickname,
(asesinatos+asistencias) AS participacion
FROM estadisticas_jugador
JOIN jugadores
USING(id_jugador);

-- 8
SELECT nombre
FROM equipos
WHERE id_equipo IN(
SELECT ganador
FROM partidas
);

-- 9
SELECT AVG(oro) AS promedio_oro
FROM estadisticas_jugador;

-- 10
SELECT nickname,asesinatos
FROM jugadores
JOIN estadisticas_jugador
USING(id_jugador)
ORDER BY asesinatos DESC;

-- ============================================
-- TRANSACCIONES
-- ============================================

START TRANSACTION;

INSERT INTO equipos(nombre,ciudad,entrenador,fecha_creacion)
VALUES('Legends Force','Jutiapa','Pedro Lopez','2026-01-01');

INSERT INTO jugadores
(nombre,nickname,rol,edad,nacionalidad,id_equipo)
VALUES
('Cristian Flores','ShadowKing','ADC',21,'Guatemala',LAST_INSERT_ID());

COMMIT;

-- ============================================

START TRANSACTION;

UPDATE equipos
SET entrenador='Entrenador Temporal'
WHERE id_equipo=2;

SAVEPOINT punto_seguro;

UPDATE equipos
SET ciudad='Mazatenango'
WHERE id_equipo=2;

ROLLBACK TO punto_seguro;

COMMIT;

-- ============================================

START TRANSACTION;

DELETE FROM estadisticas_jugador
WHERE id_estadistica=6;

ROLLBACK;