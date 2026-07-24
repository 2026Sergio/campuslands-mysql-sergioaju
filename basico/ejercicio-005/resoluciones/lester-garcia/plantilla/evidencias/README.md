# Taller Mecánico de Motos - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL para administrar la información de un taller mecánico de motocicletas. El sistema permite registrar clientes, mecánicos, motocicletas y las reparaciones realizadas. El objetivo principal fue practicar el uso de la instrucción **SELECT**, realizando consultas que permitan recuperar información de manera clara, organizada y útil para el análisis del funcionamiento del taller.

## Solución General

La solución consiste en la creación de la base de datos **taller_mecanico_motos**, formada por las tablas **clientes**, **mecanicos**, **motocicletas** y **reparaciones**, relacionadas mediante claves primarias y foráneas. Después de poblar las tablas con datos realistas, se implementó un conjunto de consultas utilizando la sentencia **SELECT**, incluyendo filtros, ordenamientos, funciones de agregación y consultas con **INNER JOIN** para obtener información como clientes, motocicletas, reparaciones, mecánicos, costos promedio y estados de los servicios, demostrando el correcto funcionamiento de la base de datos.

## Evidencia

La solución está organizada en archivos independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y tablas.
- **02_dml.sql** → Inserción de datos de prueba.
- **03_dql.sql** → Consultas utilizando la sentencia **SELECT**.
- **README.md** → Documentación del ejercicio.

### Estructura del proyecto

```text
taller_mecanico_motos/
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

- Base de datos creada correctamente.
- Registros insertados sin errores.
- Consultas **SELECT** ejecutadas correctamente.
- Uso de filtros, ordenamientos, funciones de agregación y relaciones entre tablas mediante **JOIN**.
- Código organizado siguiendo buenas prácticas de desarrollo y documentación.