# README - Ejercicio 002 | LEFT JOIN

## Descripción

Este proyecto implementa una base de datos relacional en **MySQL** para gestionar un ranking de jugadores de un videojuego **Battle Royale**. El modelo está compuesto por las tablas **jugadores** y **partidas**, relacionadas mediante una **clave foránea**, permitiendo utilizar **LEFT JOIN** para mostrar todos los jugadores, incluso aquellos que no poseen partidas registradas.

## Archivos

* **schema.sql:** creación de la base de datos y las tablas.
* **inserts.sql:** inserción de datos de prueba.
* **consultas.sql:** consultas enfocadas en el uso de **LEFT JOIN**.

## Objetivo

Aplicar **LEFT JOIN** para relacionar tablas conservando todos los registros de la tabla principal y generar reportes mediante funciones de agregación, filtros y ordenamientos.

## Competencias desarrolladas

* Modelado de bases de datos relacionales.
* Implementación de claves primarias y foráneas.
* Uso de **LEFT JOIN** para identificar registros relacionados y no relacionados.
* Elaboración de consultas con **WHERE**, **GROUP BY**, **ORDER BY**, **COUNT()**, **SUM()**, **AVG()**, **IFNULL()** y **LIMIT**.

## Ejecución

1. Ejecutar `schema.sql`.
2. Ejecutar `inserts.sql`.
3. Ejecutar `consultas.sql`.

## Resultado esperado

La solución debe ejecutarse correctamente en **MySQL**, mantener la integridad referencial y demostrar el comportamiento de **LEFT JOIN**, incluyendo jugadores con y sin partidas registradas.
