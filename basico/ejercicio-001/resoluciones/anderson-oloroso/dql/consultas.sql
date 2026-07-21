-- Consultas base. Completa o reemplaza segun el enunciado.
SELECT * FROM `jugadoresMOBA` 
ORDER BY categoria ASC, blindaje DESC;

SELECT * FROM `jugadoresMOBA` 
GROUP BY categoria, blindaje

SELECT * FROM `jugadoresMOBA` 
WHERE blindaje > 50

SELECT * FROM `jugadoresMOBA` 
WHERE categoria = 'Amateur' 

SELECT * FROM `jugadoresMOBA` 
WHERE categoria = 'Profesional' AND blindaje > 60   