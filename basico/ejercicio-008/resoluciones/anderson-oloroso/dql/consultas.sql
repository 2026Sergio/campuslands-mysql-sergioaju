UPDATE futbol_sala
SET goles = goles + 2
WHERE posicion = 'Pivot';

UPDATE futbol_sala
SET asistencias = asistencias + 3
WHERE posicion = 'Ala';

UPDATE futbol_sala
SET estado = 'Activo'
WHERE estado = 'Lesionado';

UPDATE futbol_sala
SET equipo = 'Titanes Futsal'
WHERE nombre_jugador = 'Santiago Flores';

UPDATE futbol_sala
SET goles = goles + 5,
    asistencias = asistencias + 2
WHERE nombre_jugador = 'Fernando Lopez';