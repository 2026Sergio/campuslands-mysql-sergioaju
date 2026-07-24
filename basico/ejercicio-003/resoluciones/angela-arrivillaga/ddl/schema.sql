-- creamos la base de datos si no existe
create database if not exists campuslands_mysql;
use campuslands_mysql;

-- borramos la tabla vieja por si ya la teniamos creada
drop table if exists basico_ejercicio_003;

-- creamos la tabla para el inventario de skins
-- el id es la primary key autonumerica para identificar cada skin
create table basico_ejercicio_003 (
    id int auto_increment primary key,
    nombre_skin varchar(120) not null,
    tipo_arma varchar(80) not null,
    rareza enum('comun', 'raro', 'epico', 'legendario') not null default 'comun',
    precio_monedas decimal(10,2) not null default 0.00,
    estado enum('disponible', 'revision', 'agotado') not null default 'disponible',
    agregado_en datetime not null default current_timestamp
);