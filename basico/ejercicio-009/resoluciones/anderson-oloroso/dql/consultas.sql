DELETE FROM kickboxing
WHERE estado = 'Retirado';

DELETE FROM kickboxing
WHERE estado = 'Suspendido';

DELETE FROM kickboxing
WHERE derrotas > 8;

DELETE FROM kickboxing
WHERE victorias < 15 AND derrotas > 5;

DELETE FROM kickboxing
WHERE categoria = 'Peso Pesado' AND estado = 'Lesionado';