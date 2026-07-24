# Garaje de Motos

## Nombre del alumno:Lester Garcia.
_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para administrar la información de un garaje de motos. La solución está organizada en archivos DDL, DML y DQL, permitiendo ejecutar el proyecto desde cero y consultar la información de manera estructurada.

## Objetivo

Practicar el uso de **HAVING** en MySQL mediante consultas que agrupen datos y filtren resultados utilizando funciones de agregación como `COUNT()` y `SUM()`.

## Estructura del proyecto

- **ddl.sql:** creación de la base de datos, tablas y relaciones.
- **dml.sql:** inserción de datos de prueba.
- **dql.sql:** consultas utilizando `GROUP BY` y `HAVING`.
- **README.md:** documentación del proyecto.

## Explicación general de la solución

La base de datos está formada por cuatro tablas relacionadas:

- Propietarios
- Motos
- Servicios
- Historial de servicios

El historial registra cada servicio realizado a una moto, permitiendo calcular indicadores como:

- Número de servicios por moto.
- Cantidad total de servicios realizados.
- Costos acumulados por propietario.
- Marcas con mayor cantidad de servicios.
- Años de fabricación con más motos registradas.

Las consultas utilizan **GROUP BY** para agrupar la información y **HAVING** para filtrar únicamente aquellos grupos que cumplen una condición sobre valores agregados.

## Evidencia

Después de ejecutar los archivos en el siguiente orden:

1. ddl.sql
2. dml.sql
3. dql.sql

se verifica que:

- Se filtran correctamente grupos mediante `HAVING`.
- Se utilizan funciones de agregación (`COUNT()` y `SUM()`).
- Las consultas generan resultados coherentes y verificables.
- La base de datos mantiene integridad referencial mediante claves primarias y foráneas.
```