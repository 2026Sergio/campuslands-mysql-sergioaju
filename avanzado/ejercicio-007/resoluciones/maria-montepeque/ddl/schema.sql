-- avanzado/ejercicio-007 - maria-montepeque
USE campuslands_mysql;

DROP VIEW IF EXISTS vista_jugadores_activos_liga;
DROP VIEW IF EXISTS vista_resumen_partidos_liga;
DROP VIEW IF EXISTS vista_ranking_goleadores_liga;
DROP VIEW IF EXISTS vista_goleadores_liga;
DROP TABLE IF EXISTS goles_partido_liga_view;
DROP TABLE IF EXISTS partidos_liga_futbol_view;
DROP TABLE IF EXISTS jugadores_liga_futbol_view;
DROP TABLE IF EXISTS equipos_liga_futbol_view;

CREATE TABLE equipos_liga_futbol_view (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(60) NOT NULL
);

CREATE TABLE jugadores_liga_futbol_view (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    equipo_id INT NOT NULL,
    dorsal INT NOT NULL,
    estado ENUM(
        'activo',
        'lesionado',
        'suspendido'
    ) NOT NULL DEFAULT 'activo',
    CONSTRAINT fk_jugadores_equipo_view
        FOREIGN KEY (equipo_id)
        REFERENCES equipos_liga_futbol_view(id),
    CONSTRAINT chk_dorsal_jugadores_view CHECK (dorsal > 0)
);

CREATE TABLE partidos_liga_futbol_view (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipo_local_id INT NOT NULL,
    equipo_visitante_id INT NOT NULL,
    fecha_partido DATE NOT NULL,
    estadio VARCHAR(80) NOT NULL,
    CONSTRAINT fk_partidos_local_view
        FOREIGN KEY (equipo_local_id)
        REFERENCES equipos_liga_futbol_view(id),
    CONSTRAINT fk_partidos_visitante_view
        FOREIGN KEY (equipo_visitante_id)
        REFERENCES equipos_liga_futbol_view(id)
);

CREATE TABLE goles_partido_liga_view (
    id INT AUTO_INCREMENT PRIMARY KEY,
    partido_id INT NOT NULL,
    jugador_id INT NOT NULL,
    minuto INT NOT NULL,
    tipo_gol ENUM(
        'normal',
        'penal',
        'autogol'
    ) NOT NULL DEFAULT 'normal',
    CONSTRAINT fk_goles_partido_view
        FOREIGN KEY (partido_id)
        REFERENCES partidos_liga_futbol_view(id),
    CONSTRAINT fk_goles_jugador_view
        FOREIGN KEY (jugador_id)
        REFERENCES jugadores_liga_futbol_view(id),
    CONSTRAINT chk_minuto_goles_view CHECK (minuto BETWEEN 1 AND 120)
);

-- Vista 1 (base, con JOIN de 4 tablas): cada gol con el jugador, su equipo y
-- los datos del partido. Al combinar varias tablas, esta vista NO es
-- actualizable (MySQL no sabria en que tabla aplicar un UPDATE/INSERT).
CREATE VIEW vista_goleadores_liga AS
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    p.fecha_partido,
    p.estadio,
    g.minuto,
    g.tipo_gol
FROM goles_partido_liga_view AS g
JOIN jugadores_liga_futbol_view AS j ON j.id = g.jugador_id
JOIN equipos_liga_futbol_view AS e ON e.id = j.equipo_id
JOIN partidos_liga_futbol_view AS p ON p.id = g.partido_id;

-- Vista 2 (vista de una vista): se construye a partir de vista_goleadores_liga
-- en vez de repetir el JOIN, agregando un GROUP BY para el ranking.
CREATE VIEW vista_ranking_goleadores_liga AS
SELECT
    jugador,
    equipo,
    COUNT(*) AS total_goles
FROM vista_goleadores_liga
GROUP BY jugador, equipo;

-- Vista 3 (agregada, con JOIN): total de goles por partido, con el nombre de
-- ambos equipos.
CREATE VIEW vista_resumen_partidos_liga AS
SELECT
    p.id AS partido_id,
    el.nombre AS equipo_local,
    ev.nombre AS equipo_visitante,
    p.fecha_partido,
    COUNT(g.id) AS total_goles
FROM partidos_liga_futbol_view AS p
JOIN equipos_liga_futbol_view AS el ON el.id = p.equipo_local_id
JOIN equipos_liga_futbol_view AS ev ON ev.id = p.equipo_visitante_id
LEFT JOIN goles_partido_liga_view AS g ON g.partido_id = p.id
GROUP BY p.id, el.nombre, ev.nombre, p.fecha_partido;

-- Vista 4 (de una sola tabla, SI actualizable, con WITH CHECK OPTION):
-- solo muestra jugadores activos. WITH CHECK OPTION evita que, a traves de
-- esta vista, se pueda actualizar un jugador de forma que deje de cumplir
-- la condicion estado = 'activo' (es decir, que "desaparezca" de la vista
-- como efecto secundario de su propio UPDATE).
CREATE VIEW vista_jugadores_activos_liga AS
SELECT
    id,
    nombre,
    equipo_id,
    dorsal,
    estado
FROM jugadores_liga_futbol_view
WHERE estado = 'activo'
WITH CHECK OPTION;
