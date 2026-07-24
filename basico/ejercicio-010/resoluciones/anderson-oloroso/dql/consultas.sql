SELECT COUNT(*) AS total_carreras
FROM carreras_urbanas;

SELECT SUM(cantidad_participantes) AS total_participantes
FROM carreras_urbanas;

SELECT SUM(premio_total) AS total_premios
FROM carreras_urbanas;

SELECT COUNT(*) AS carreras_finalizadas
FROM carreras_urbanas
WHERE estado = 'Finalizada';

SELECT COUNT(*) AS carreras_programadas,
       SUM(cantidad_participantes) AS participantes_programados
FROM carreras_urbanas
WHERE estado = 'Programada';