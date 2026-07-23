SELECT * FROM saga_ciencia_ficcion
WHERE fecha_estreno < '2020-01-01';

SELECT * FROM saga_ciencia_ficcion
WHERE fecha_estreno BETWEEN '2020-01-01' AND '2023-12-31';

SELECT titulo, fecha_estreno
FROM saga_ciencia_ficcion
WHERE fecha_estreno >= '2025-01-01'
ORDER BY fecha_estreno ASC;

SELECT * FROM saga_ciencia_ficcion
WHERE YEAR(fecha_estreno) = 2024;

SELECT titulo, fecha_estreno, presupuesto
FROM saga_ciencia_ficcion
WHERE fecha_estreno > '2024-12-31'
AND presupuesto > 180000000
ORDER BY fecha_estreno ASC;