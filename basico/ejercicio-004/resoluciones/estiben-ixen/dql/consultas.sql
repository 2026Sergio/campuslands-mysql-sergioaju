-- Consultas base. Completa o reemplaza segun el enunciado.
USE campuslands_mysql;

SELECT * FROM `parqueo_motos` WHERE 1;

SELECT
    COUNT(*) AS total_motos
FROM garage_motos;

SELECT 
placa AS placa,
nombre_propietario AS propietario,
espacio_parqueo AS  espacio_parqueo
FROM parqueo_motos
ORDER BY espacio_parqueo;

SELECT 
placa AS placa,
nombre_propietario AS propietario,
fecha_ingreso AS fecha_ingreso
FROM parqueo_motos
ORDER BY fecha_ingreso DESC LIMIT 1;

SELECT 
placa AS placa,
nombre_propietario as propietario,
fecha_ingreso as fecha_ingreso
FROM parqueo_motos
ORDER BY fecha_ingreso 
LIMIT 1;

SELECT 
	placa as pacla,
	time(fecha_ingreso) as hora_ingreso
FROM parqueo_motos;

SELECT 
	placa as placa,
    nombre_propietario AS propietario,
    espacio_parqueo AS espacio
FROM parqueo_motos
WHERE placa = 'M-123ABC';
