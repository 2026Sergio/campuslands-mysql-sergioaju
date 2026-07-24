-- creamos la base de datos si no existe
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- eliminamos la tabla anterior si existia
drop table if exists basico_ejercicio_005;

-- creamos la tabla para los servicios del taller mecanico
create table basico_ejercicio_005 (
    id int auto_increment primary key,
    descripcion_servicio varchar(120) not null,
    tipo_mantenimiento varchar(80) not null,
    costo_estimado decimal(10,2) not null default 0.00,
    estado enum('pendiente', 'en_proceso', 'completado') not null default 'pendiente',
    ingresado_en datetime not null default current_timestamp
);