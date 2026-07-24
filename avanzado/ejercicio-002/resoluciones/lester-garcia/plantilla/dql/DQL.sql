USE ranking_battle_royale;

-- ============================
-- CONSULTAS
-- ============================

-- 1
SELECT * FROM jugadores;

-- 2
SELECT nickname,pais
FROM jugadores;

-- 3
SELECT nombre
FROM temporadas
ORDER BY fecha_inicio;

-- 4
SELECT nickname,puntos
FROM jugadores
JOIN ranking USING(id_jugador)
ORDER BY puntos DESC;

-- 5
SELECT AVG(puntos) promedio_puntos
FROM ranking;

-- 6
SELECT MAX(eliminaciones) mayor_eliminaciones
FROM ranking;

-- 7
SELECT mapa,COUNT(*) partidas
FROM partidas
GROUP BY mapa;

-- 8
SELECT nickname
FROM jugadores
WHERE id_jugador IN
(
SELECT id_jugador
FROM premios
);

-- 9
SELECT nickname,monto
FROM jugadores
JOIN premios USING(id_jugador);

-- 10
SELECT nickname,posicion
FROM jugadores
JOIN ranking USING(id_jugador)
WHERE posicion<=3;

-- ==========================================
-- PROCEDIMIENTOS ALMACENADOS
-- ==========================================

DELIMITER $$

CREATE PROCEDURE sp_listar_jugadores()
BEGIN
    SELECT *
    FROM jugadores
    ORDER BY nickname;
END $$

DELIMITER ;

CALL sp_listar_jugadores();

-- ==========================================

DELIMITER $$

CREATE PROCEDURE sp_buscar_jugador
(
    IN p_nickname VARCHAR(50)
)
BEGIN
    SELECT *
    FROM jugadores
    WHERE nickname=p_nickname;
END $$

DELIMITER ;

CALL sp_buscar_jugador('Shadow');

-- ==========================================

DELIMITER $$

CREATE PROCEDURE sp_puntos_jugador
(
    IN p_id INT
)
BEGIN
    SELECT j.nickname,
           r.puntos
    FROM jugadores j
    JOIN ranking r
    ON j.id_jugador=r.id_jugador
    WHERE j.id_jugador=p_id;
END $$

DELIMITER ;

CALL sp_puntos_jugador(5);

-- ==========================================

DELIMITER $$

CREATE PROCEDURE sp_agregar_premio
(
    IN p_jugador INT,
    IN p_descripcion VARCHAR(100),
    IN p_monto DECIMAL(10,2)
)
BEGIN

INSERT INTO premios(id_jugador,descripcion,monto)
VALUES
(
p_jugador,
p_descripcion,
p_monto
);

SELECT 'Premio registrado correctamente.' AS Mensaje;

END $$

DELIMITER ;

CALL sp_agregar_premio
(
2,
'Premio Especial',
900
);

-- ==========================================

DELIMITER $$

CREATE PROCEDURE sp_top3()
BEGIN

SELECT
j.nickname,
r.puntos
FROM jugadores j
JOIN ranking r
ON j.id_jugador=r.id_jugador
ORDER BY r.puntos DESC
LIMIT 3;

END $$

DELIMITER ;

CALL sp_top3();