# Inventario de Skins Shooter

## Nombre del alumno: Lester Garcia
_________________________________

## Descripción general

Este proyecto implementa una base de datos relacional en MySQL para gestionar el inventario de skins de un videojuego tipo shooter. La solución está organizada en archivos DDL, DML y DQL, siguiendo buenas prácticas de organización y desarrollo.

## Objetivo

Practicar el uso de **GROUP BY** en MySQL para agrupar información y obtener indicadores útiles sobre jugadores, skins, categorías e inventarios.

## Estructura del proyecto

- **ddl.sql:** creación de la base de datos, tablas y relaciones.
- **dml.sql:** inserción de datos de ejemplo.
- **dql.sql:** consultas utilizando GROUP BY y funciones de agregación.
- **README.md:** documentación del proyecto.

## Explicación general de la solución

La base de datos está formada por cuatro tablas relacionadas:

- Jugadores
- Categorías de skins
- Skins
- Inventario

Las consultas emplean **GROUP BY** junto con funciones de agregación como:

- COUNT()
- SUM()
- AVG()

para obtener estadísticas e indicadores del inventario.

## Evidencia

Después de ejecutar los archivos en el siguiente orden:

1. ddl.sql
2. dml.sql
3. dql.sql

se comprueba que:

- Se contabilizan correctamente las skins por jugador.
- Se agrupan las unidades por categoría.
- Se calcula el precio promedio según la rareza.
- Todas las consultas generan resultados consistentes utilizando **GROUP BY**.