-- avanzado/ejercicio-002 - maria-montepeque
USE campuslands_mysql;

DROP PROCEDURE IF EXISTS sp_registrar_partida_br;
DROP PROCEDURE IF EXISTS sp_resumen_escuadra_br;
DROP PROCEDURE IF EXISTS sp_top_escuadras_br;
DROP TABLE IF EXISTS partidas_battle_royale_sp;
DROP TABLE IF EXISTS escuadras_battle_royale_sp;

CREATE TABLE escuadras_battle_royale_sp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    plataforma ENUM(
        'pc',
        'consola',
        'movil'
    ) NOT NULL,
    fecha_creacion DATE NOT NULL
);

CREATE TABLE partidas_battle_royale_sp (
    id INT AUTO_INCREMENT PRIMARY KEY,
    escuadra_id INT NOT NULL,
    mapa VARCHAR(60) NOT NULL,
    posicion_final INT NOT NULL,
    eliminaciones INT NOT NULL DEFAULT 0,
    puntos_obtenidos INT NOT NULL DEFAULT 0,
    fecha_partida DATE NOT NULL,
    CONSTRAINT fk_partidas_escuadra_sp
        FOREIGN KEY (escuadra_id)
        REFERENCES escuadras_battle_royale_sp(id),
    CONSTRAINT chk_posicion_partidas_sp CHECK (posicion_final > 0),
    CONSTRAINT chk_eliminaciones_partidas_sp CHECK (eliminaciones >= 0)
);

DELIMITER $$

-- Procedimiento 1: registra una partida buscando el id de la escuadra por
-- nombre, para no tener que conocer ni escribir el id manualmente al cargar datos.
CREATE PROCEDURE sp_registrar_partida_br (
    IN p_nombre_escuadra VARCHAR(80),
    IN p_mapa VARCHAR(60),
    IN p_posicion_final INT,
    IN p_eliminaciones INT,
    IN p_puntos_obtenidos INT,
    IN p_fecha_partida DATE
)
BEGIN
    DECLARE v_escuadra_id INT;

    SELECT id INTO v_escuadra_id
    FROM escuadras_battle_royale_sp
    WHERE nombre = p_nombre_escuadra;

    INSERT INTO partidas_battle_royale_sp
        (escuadra_id, mapa, posicion_final, eliminaciones, puntos_obtenidos, fecha_partida)
    VALUES
        (v_escuadra_id, p_mapa, p_posicion_final, p_eliminaciones, p_puntos_obtenidos, p_fecha_partida);
END$$

-- Procedimiento 2: resumen de una escuadra especifica. Usa LEFT JOIN +
-- COALESCE para que tambien funcione con escuadras que aun no jugaron nada.
CREATE PROCEDURE sp_resumen_escuadra_br (
    IN p_nombre_escuadra VARCHAR(80)
)
BEGIN
    SELECT
        e.nombre AS escuadra,
        COUNT(p.id) AS total_partidas,
        COALESCE(SUM(p.puntos_obtenidos), 0) AS puntos_totales,
        MIN(p.posicion_final) AS mejor_posicion
    FROM escuadras_battle_royale_sp AS e
    LEFT JOIN partidas_battle_royale_sp AS p ON p.escuadra_id = e.id
    WHERE e.nombre = p_nombre_escuadra
    GROUP BY e.nombre;
END$$

-- Procedimiento 3: top N escuadras por puntos totales, con N como parametro.
-- Usa SQL dinamico (PREPARE/EXECUTE) porque LIMIT necesita un valor conocido
-- en tiempo de ejecucion del statement preparado.
CREATE PROCEDURE sp_top_escuadras_br (
    IN p_cantidad INT
)
BEGIN
    SET @sql_top_escuadras = 'SELECT
            e.nombre AS escuadra,
            COALESCE(SUM(p.puntos_obtenidos), 0) AS puntos_totales
        FROM escuadras_battle_royale_sp AS e
        LEFT JOIN partidas_battle_royale_sp AS p ON p.escuadra_id = e.id
        GROUP BY e.nombre
        ORDER BY puntos_totales DESC
        LIMIT ?';

    SET @p_cantidad = p_cantidad;

    PREPARE stmt_top_escuadras FROM @sql_top_escuadras;
    EXECUTE stmt_top_escuadras USING @p_cantidad;
    DEALLOCATE PREPARE stmt_top_escuadras;
END$$

DELIMITER ;
