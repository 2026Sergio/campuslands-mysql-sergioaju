-- intermedio/ejercicio-008 - maria-montepeque
-- Objetivo: normalizacion 3FN.
--
-- Diseno NO normalizado que se queria evitar (solo como referencia, no se crea):
--   CREATE TABLE jugadores_futbol_sala (
--       id INT PRIMARY KEY,
--       nombre VARCHAR(80),
--       equipo_id INT,
--       equipo_nombre VARCHAR(80),  -- depende de equipo_id, no directamente de id
--       equipo_ciudad VARCHAR(60)   -- depende de equipo_id, no directamente de id
--   );
-- Aqui equipo_nombre y equipo_ciudad no dependen de la clave primaria (id del
-- jugador) sino de otro atributo no clave (equipo_id). Esa es una dependencia
-- transitiva (id -> equipo_id -> equipo_nombre/equipo_ciudad) y viola la 3FN:
-- si un equipo cambia de ciudad hay que actualizar esa ciudad en cada fila de
-- cada jugador del equipo, con riesgo de dejar datos inconsistentes.
--
-- Diseno en 3FN: los datos del equipo viven una sola vez en su propia tabla,
-- y el jugador solo guarda la referencia (equipo_id).
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_futbol_sala;
DROP TABLE IF EXISTS equipos_futbol_sala;

CREATE TABLE equipos_futbol_sala (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(60) NOT NULL,
    entrenador VARCHAR(80) NOT NULL
);

CREATE TABLE jugadores_futbol_sala (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    equipo_id INT NOT NULL,
    posicion ENUM(
        'portero',
        'cierre',
        'ala',
        'pivote'
    ) NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    tarjetas_amarillas INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'lesionado',
        'suspendido'
    ) NOT NULL DEFAULT 'activo',
    CONSTRAINT fk_jugadores_equipo_3fn
        FOREIGN KEY (equipo_id)
        REFERENCES equipos_futbol_sala(id),
    CONSTRAINT chk_goles_futbol_sala_3fn CHECK (goles >= 0)
);
