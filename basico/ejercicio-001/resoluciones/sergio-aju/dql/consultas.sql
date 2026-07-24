USE db_guatemala;

-- 1. Ver personas activas ordenadas por puntos
SELECT nombre, departamento, puntos 
FROM personas 
WHERE activo = TRUE 
ORDER BY puntos DESC;

-- 2. Ver el promedio de puntos por cada departamento
SELECT departamento, COUNT(*) AS total_personas, AVG(puntos) AS promedio_puntos 
FROM personas 
GROUP BY departamento;

-- 3. Top 3 de personas con más puntos
SELECT nombre, puntos 
FROM personas 
ORDER BY puntos DESC 
LIMIT 3;

-- 4. Contar cuántas personas están activas y cuántas no
SELECT activo, COUNT(*) AS cantidad 
FROM personas 
GROUP BY activo;
-- 5. 
SELECT nombre, departamento, puntos 
FROM personas 
WHERE departamento = 'Guatemala' AND puntos > 70;