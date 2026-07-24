# Taller Mecánico de Motos

## Nombre del alumno:Lester Garcia
_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para gestionar la información de un taller mecánico de motos. La solución está organizada mediante archivos DDL, DML y DQL, permitiendo ejecutar todo el proyecto desde cero.

## Objetivo

Practicar el uso de **subconsultas (Subqueries)** en MySQL para resolver consultas que dependan de resultados obtenidos por otras consultas, aplicando criterios técnicos y manteniendo una estructura organizada.

## Estructura del proyecto

- **ddl.sql:** creación de la base de datos y tablas.
- **dml.sql:** inserción de datos de prueba.
- **dql.sql:** consultas utilizando subconsultas.
- **README.md:** documentación del proyecto.

## Explicación general de la solución

La base de datos está compuesta por cuatro tablas relacionadas:

- Clientes
- Motos
- Mecánicos
- Reparaciones

Las consultas implementan diferentes tipos de subconsultas:

- Subconsultas simples con operadores de comparación (`=`, `>`)
- Subconsultas con `IN`
- Subconsultas con `NOT IN`
- Subconsultas utilizando funciones de agregación (`AVG()`, `MAX()`, `SUM()`)
- Subconsultas con `GROUP BY` y `HAVING`

Estas consultas permiten responder preguntas de negocio sin necesidad de realizar uniones complejas.

## Evidencia

Después de ejecutar los archivos en el siguiente orden:

1. ddl.sql
2. dml.sql
3. dql.sql

se verifica que:

- Las subconsultas retornan resultados correctos.
- Se emplean funciones de agregación dentro de subconsultas.
- Se utilizan los operadores `IN`, `NOT IN` y comparaciones con subconsultas escalares.
- La base de datos mantiene integridad referencial mediante claves primarias y foráneas.
- Los resultados obtenidos son coherentes con los datos insertados.