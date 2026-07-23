# Ejercicio 001 - Transacciones para torneo esports MOBA

## Descripción

En este ejercicio se desarrolló una base de datos en MySQL para administrar la información de un torneo de esports MOBA. La solución incluye la creación de tablas, inserción de datos mediante una transacción y consultas que permiten obtener información útil del torneo.

## Tecnologías

* MySQL 8
* SQL

## Estructura

La solución contiene:

* Creación de la base de datos.
* Eliminación de tablas existentes.
* Creación de tablas con sus restricciones.
* Inserción de datos utilizando una transacción.
* Consultas para generar reportes.

## Tablas

### escuadras

Almacena la información de los equipos participantes.

Campos principales:

* id_escuadra
* nombre
* region
* estado

### participantes

Almacena la información de los jugadores registrados en cada escuadra.

Campos principales:

* id_participante
* nombre
* nickname
* rol
* id_escuadra
* puntaje

## Restricciones aplicadas

* Llave primaria en ambas tablas.
* Llave foránea entre participantes y escuadras.
* El campo `nickname` es único.
* El estado de la escuadra se controla mediante un `ENUM`.

## Transacción

La inserción de registros se realiza utilizando:

```sql
START TRANSACTION;

...

COMMIT;
```

Esto garantiza que todos los registros se almacenen correctamente.

## Consultas realizadas

1. Ranking de participantes por puntaje.
2. Cantidad de participantes por escuadra.
3. Promedio de puntaje por escuadra.
4. Participantes con más de 90 puntos.
5. Cantidad de participantes por rol.
6. Escuadras activas.

## Ejecución

1. Ejecutar el archivo SQL.
2. Verificar que las tablas se creen correctamente.
3. Confirmar la inserción de los registros.
4. Revisar los resultados de las consultas.

## Resultado

La base de datos permite administrar la información básica de un torneo MOBA y generar reportes utilizando consultas SQL sencillas y transacciones.
