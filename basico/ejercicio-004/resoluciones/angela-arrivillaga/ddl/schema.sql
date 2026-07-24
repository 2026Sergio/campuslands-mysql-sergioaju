-- creamos la base de datos si no existe
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- borramos la tabla anterior si existe para reiniciar la prueba
drop table if exists basico_ejercicio_004;

-- creamos la tabla para el garaje de motos
create table basico_ejercicio_004 (
    id int auto_increment primary key,
    marca_modelo varchar(120) not null,
    tipo_moto varchar(80) not null,
    cilindrada_cc int not null,
    precio_alquiler_dia decimal(10,2) not null default 0.00,
    estado enum('disponible', 'mantenimiento', 'alquilada') not null default 'disponible',
    registrado_en datetime not null default current_timestamp
);