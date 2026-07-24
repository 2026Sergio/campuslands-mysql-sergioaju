# Ranking Battle Royale

## Nombre del alumno: Lester Garcia

_____________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para administrar un sistema de ranking de jugadores de Battle Royale. La solución está organizada mediante archivos DDL, DML y DQL para facilitar su mantenimiento y comprensión.

## Objetivo

Practicar el uso de **LEFT JOIN** en MySQL mediante consultas que permitan visualizar todos los registros de una tabla principal, incluso cuando no existan registros relacionados.

## Estructura del proyecto

- **ddl.sql:** creación de la base de datos y tablas.
- **dml.sql:** inserción de datos de prueba.
- **dql.sql:** consultas utilizando LEFT JOIN.
- **README.md:** documentación del proyecto.

## Explicación general de la solución

Se diseñó una base de datos compuesta por tres tablas:

- Jugadores
- Temporadas
- Rankings

La tabla `rankings` relaciona jugadores con temporadas mediante claves foráneas.

Se incluyeron jugadores sin participación y temporadas sin registros para demostrar claramente el funcionamiento de **LEFT JOIN**, donde se muestran todos los registros de la tabla izquierda aunque no exista información relacionada.

## Evidencia

Al ejecutar los scripts en el siguiente orden:

1. ddl.sql
2. dml.sql
3. dql.sql

se verifica que:

- Todos los jugadores aparecen en las consultas, incluso los que nunca han participado.
- Todas las temporadas aparecen, incluso aquellas sin jugadores registrados.
- Las consultas muestran correctamente valores `NULL` o mensajes como **"Sin participación"** cuando no existe una relación.
- Se demuestra el funcionamiento correcto del operador **LEFT JOIN** mediante ejemplos prácticos.