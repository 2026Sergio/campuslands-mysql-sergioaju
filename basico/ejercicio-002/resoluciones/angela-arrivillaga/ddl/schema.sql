-- creamos la base de datos si no existe
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- borramos la tabla por si ya la habiamos creado antes
drop table if exists basico_ejercicio_002;

-- tabla para guardar el ranking de jugadores del battle royale
create table basico_ejercicio_002 (
    id int auto_increment primary key,
    nickname varchar(100) not null,
    rango varchar(50) not null,
    bajas_totales int not null default 0,
    ratio_victorias decimal(5,2) not null default 0.00,
    puntaje_ranking decimal(10,2) not null default 0.00,
    estado enum('activo', 'baneado', 'inactivo') not null default 'activo',
    registrado_en datetime not null default current_timestamp
);