# Ejercicio 003 - Inventario de Skins Shooter

## Descripción del proyecto

Este proyecto consiste en la creación de un módulo de base de datos en MySQL para administrar un inventario de skins inspirado en un videojuego shooter.

El objetivo principal es practicar el diseño de tablas, inserción de información y creación de consultas SQL orientadas a resolver preguntas de negocio, aplicando buenas prácticas como nombres descriptivos, validaciones y separación de responsabilidades entre archivos.


## Tecnologías utilizadas

- MySQL 8.x
- SQL


## Base de datos utilizada

```sql
CREATE DATABASE IF NOT EXISTS campuslands_mysql;

La solución fue desarrollada utilizando la base de datos campuslands_mysql, donde se almacena la información del inventario de skins.

Estructura del proyecto
resolucion/
│
├── README.md
│
├── ddl/
│   └── schema.sql
│
├── dml/
│   └── inserts.sql
│
└── dql/
    └── consultas.sql
Descripción de archivos
ddl/schema.sql

Contiene la creación de la estructura de la base de datos.

Responsabilidades:

Crear la base de datos si no existe.
Seleccionar la base de datos de trabajo.
Eliminar tablas existentes para evitar conflictos.
Crear la tabla principal del inventario.
Definir claves, tipos de datos y restricciones.
dml/inserts.sql

Contiene la carga inicial de información.

Se agregaron registros suficientes para realizar pruebas de:

Filtros por estado.
Ordenamientos por precio.
Agrupaciones por rareza.
Cálculos estadísticos.
dql/consultas.sql

Contiene consultas SQL enfocadas en obtener información útil del inventario.

Las consultas permiten:

Consultar skins activas.
Contar skins por categoría de rareza.
Calcular precios promedio.
Obtener rankings de skins más costosas.
Calcular el valor total del inventario.
Buscar skins según características específicas.
Modelo de datos
Tabla: inventario_skins

Esta tabla representa el inventario disponible de skins.

Campo	Tipo	Descripción
id_skin	INT	Identificador único generado automáticamente
nombre_skin	VARCHAR	Nombre de la skin
arma	VARCHAR	Arma asociada a la skin
categoria	VARCHAR	Clasificación visual de la skin
rareza	VARCHAR	Nivel de rareza
precio	DECIMAL	Valor económico de la skin
estado	VARCHAR	Estado actual de la skin
fecha_lanzamiento	DATE	Fecha de publicación
Validaciones implementadas

Para garantizar la calidad de los datos se agregaron restricciones:

Precio válido

El precio no puede contener valores negativos.

CHECK (precio >= 0)
Estados permitidos

La skin solamente puede tener los estados:

activo
retirado
CHECK (estado IN ('activo','retirado'))
Decisiones técnicas
Se utilizó AUTO_INCREMENT para generar identificadores únicos automáticamente.
Se utilizó DECIMAL(10,2) para manejar precios con precisión.
Se separaron los scripts en DDL, DML y DQL para mantener una estructura profesional.
Se utilizaron nombres descriptivos para facilitar el mantenimiento del código.
Se agregaron datos variados para permitir pruebas reales de consultas.
Se incluyeron skins activas y retiradas para validar diferentes escenarios.
Consultas desarrolladas
1. Consulta de skins activas

Permite conocer las skins disponibles actualmente ordenadas por precio descendente.

2. Conteo de skins por rareza

Permite analizar la cantidad de skins disponibles según su nivel de rareza.

3. Precio promedio por arma

Permite conocer el valor promedio de las skins agrupadas por arma.

4. Ranking de skins más costosas

Obtiene las cinco skins con mayor precio dentro del inventario.

5. Valor total del inventario

Calcula la cantidad de skins activas y el valor económico acumulado.

6. Consulta de skins legendarias activas

Permite identificar las skins de mayor rareza disponibles actualmente.

Ejecución del proyecto

Los archivos deben ejecutarse en el siguiente orden:

1. Crear estructura

Ejecutar:

ddl/schema.sql
2. Insertar información

Ejecutar:

dml/inserts.sql
3. Ejecutar consultas

Ejecutar:

dql/consultas.sql
Validación final

La solución fue validada comprobando que:

La base de datos se crea correctamente.
La tabla se genera sin errores.
Los registros se insertan correctamente.
Las restricciones funcionan.
Las consultas generan resultados útiles.
La estructura permite mantenimiento y ampliación futura.
Conclusión

Este ejercicio demuestra la creación de un módulo básico de inventario en MySQL aplicando una organización profesional de scripts SQL.

La solución permite almacenar información, validar datos y generar reportes mediante consultas que responden necesidades reales de análisis dentro de un sistema de inventario de videojuegos.