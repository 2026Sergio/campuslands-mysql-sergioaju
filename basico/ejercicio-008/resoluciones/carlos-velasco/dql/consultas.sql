-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

UPDATE jugadores_futsal
SET goles = goles + 2
WHERE nombre = 'Carlos Martinez';

UPDATE jugadores_futsal
SET salario = salario * 1.10
WHERE estado = 'Activo';

UPDATE jugadores_futsal
SET estado = 'Activo'
WHERE estado = 'Lesionado';

UPDATE jugadores_futsal
SET equipo = 'Campeones FS'
WHERE nombre = 'Pedro Castillo';

UPDATE jugadores_futsal
SET asistencias = asistencias + 1
WHERE goles > 15;

UPDATE jugadores_futsal
SET asistencias = asistencias + 1
WHERE goles > 15;

SELECT
    id,
    nombre,
    equipo,
    goles,
    asistencias,
    salario,
    estado
FROM jugadores_futsal;