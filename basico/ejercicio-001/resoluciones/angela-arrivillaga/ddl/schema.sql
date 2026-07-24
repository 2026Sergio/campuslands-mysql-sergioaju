-- creamos la base de datos si no existe
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- por si acaso borramos la tabla si ya existia para no tener errores
drop table if exists basico_ejercicio_001;

-- creamos la tabla para guardar los equipos del torneo
create table basico_ejercicio_001 (
    id int auto_increment primary key,
    nombre varchar(120) not null,
    categoria varchar(80) not null,
    puntaje decimal(10,2) not null default 0.00,
    estado enum('activo', 'revision', 'inactivo') not null default 'activo',
    creado_en datetime not null default current_timestamp
);