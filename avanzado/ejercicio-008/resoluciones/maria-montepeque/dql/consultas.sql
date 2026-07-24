-- avanzado/ejercicio-008 - maria-montepeque
USE campuslands_mysql;

-- 1. Consulta de negocio normal: jugadores con su equipo (esto lo puede
--    correr cualquiera de los 3 roles, ya que todos tienen SELECT)
SELECT
    j.nombre AS jugador,
    e.nombre AS equipo,
    j.goles,
    j.estado
FROM jugadores_futbol_sala_roles AS j
JOIN equipos_futbol_sala_roles AS e ON e.id = j.equipo_id
ORDER BY j.goles DESC;

-- 2. Goles totales por equipo (consulta de negocio normal)
SELECT
    e.nombre AS equipo,
    SUM(j.goles) AS goles_totales
FROM equipos_futbol_sala_roles AS e
JOIN jugadores_futbol_sala_roles AS j ON j.equipo_id = e.id
GROUP BY e.nombre
ORDER BY goles_totales DESC;

-- Las siguientes 4 consultas inspeccionan los permisos otorgados. Requieren
-- privilegios de administrador (se ejecutaron como root para validar este
-- ejercicio, no como el usuario campus de la aplicacion).

-- 3. Privilegios del rol de solo lectura
SHOW GRANTS FOR rol_lector_futbol_sala;

-- 4. Privilegios del rol de edicion (SELECT, INSERT, UPDATE, sin DELETE)
SHOW GRANTS FOR rol_editor_futbol_sala;

-- 5. Privilegios efectivos del usuario de demostracion "lector" (incluye
--    el rol que tiene asignado)
SHOW GRANTS FOR 'lector_demo_fs'@'%' USING rol_lector_futbol_sala;

-- 6. Privilegios efectivos del usuario de demostracion "editor"
SHOW GRANTS FOR 'editor_demo_fs'@'%' USING rol_editor_futbol_sala;
