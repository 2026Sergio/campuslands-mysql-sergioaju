-- intermedio/ejercicio-007 - maria-montepeque
-- Objetivo: normalizacion 2FN.
--
-- Diseno NO normalizado que se queria evitar (solo como referencia, no se crea):
--   CREATE TABLE registros_goles_liga (
--       partido_id INT,
--       jugador_id INT,
--       minuto INT,
--       jugador_nombre VARCHAR(80),   -- depende solo de jugador_id
--       jugador_equipo VARCHAR(80),   -- depende solo de jugador_id
--       partido_fecha DATE,           -- depende solo de partido_id
--       partido_estadio VARCHAR(80),  -- depende solo de partido_id
--       PRIMARY KEY (partido_id, jugador_id, minuto)
--   );
-- Con una clave primaria compuesta (partido_id, jugador_id, minuto), las
-- columnas jugador_nombre/jugador_equipo dependen solo de una parte de la
-- clave (jugador_id) y partido_fecha/partido_estadio dependen solo de otra
-- parte (partido_id). Eso es una dependencia parcial: viola la 2FN y obliga
-- a repetir el nombre del jugador y los datos del partido en cada fila.
--
-- Diseno en 2FN: se separan las entidades que tienen su propia identidad
-- (jugador, partido) de la tabla de hechos (gol), que solo guarda datos que
-- dependen del gol completo, no de una parte de una clave compuesta.
USE campuslands_mysql;

DROP TABLE IF EXISTS goles_partido_liga;
DROP TABLE IF EXISTS partidos_liga_futbol;
DROP TABLE IF EXISTS jugadores_liga_futbol;

CREATE TABLE jugadores_liga_futbol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    equipo VARCHAR(80) NOT NULL,
    posicion ENUM(
        'portero',
        'defensa',
        'medio',
        'delantero'
    ) NOT NULL
);

CREATE TABLE partidos_liga_futbol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local VARCHAR(80) NOT NULL,
    equipo_visitante VARCHAR(80) NOT NULL,
    fecha_partido DATE NOT NULL,
    estadio VARCHAR(80) NOT NULL
);

CREATE TABLE goles_partido_liga (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partido_id INT NOT NULL,
    jugador_id INT NOT NULL,
    minuto INT NOT NULL,
    tipo_gol ENUM(
        'normal',
        'penal',
        'autogol'
    ) NOT NULL DEFAULT 'normal',
    CONSTRAINT fk_goles_partido
        FOREIGN KEY (partido_id)
        REFERENCES partidos_liga_futbol(id),
    CONSTRAINT fk_goles_jugador
        FOREIGN KEY (jugador_id)
        REFERENCES jugadores_liga_futbol(id),
    CONSTRAINT chk_minuto_goles_liga CHECK (minuto BETWEEN 1 AND 120)
);
