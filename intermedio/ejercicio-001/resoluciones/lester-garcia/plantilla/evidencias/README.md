# Torneo Esports MOBA

## Alumno: Lester Garcia
_______________________________

## Descripción general

Este proyecto consiste en el diseño e implementación de una base de datos en MySQL para administrar la información de un torneo de esports MOBA. La solución está organizada siguiendo las buenas prácticas de separación de responsabilidades mediante archivos DDL, DML y DQL.

## Objetivo

Practicar el uso de INNER JOIN mediante una base de datos relacional que permita consultar información relacionada entre equipos, jugadores, torneos y participaciones.

## Estructura de la solución

- **ddl.sql:** creación de la base de datos, tablas, claves primarias y foráneas.
- **dml.sql:** inserción de datos de prueba realistas.
- **dql.sql:** consultas utilizando INNER JOIN para responder diferentes requerimientos del negocio.

## Explicación general de la solución

Se diseñó una base de datos normalizada con cuatro tablas relacionadas mediante claves foráneas:

- Equipos
- Jugadores
- Torneos
- Participaciones

Las relaciones permiten obtener información combinada utilizando INNER JOIN, mostrando cómo interactúan las diferentes entidades del sistema.

## Evidencia

Después de ejecutar los archivos en el siguiente orden:

1. ddl.sql
2. dml.sql
3. dql.sql

se obtienen consultas funcionales que muestran:

- Jugadores y sus equipos.
- Equipos inscritos en torneos.
- Torneos y premios.
- Jugadores que participaron en cada torneo.
- Historial de victorias y derrotas.
- Relación completa entre jugadores, equipos y torneos.

Todas las consultas fueron verificadas con los datos insertados y producen resultados coherentes.