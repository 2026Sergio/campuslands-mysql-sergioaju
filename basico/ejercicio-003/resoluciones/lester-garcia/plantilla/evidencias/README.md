# Inventario de Skins Shooter - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL para administrar el inventario de skins de un videojuego tipo shooter. La solución permite registrar jugadores, armas, skins e inventarios personales, haciendo énfasis en el uso correcto de las **PRIMARY KEY** para identificar de forma única cada registro y establecer relaciones entre las tablas mediante claves foráneas.

## Solución General

La solución consiste en la creación de la base de datos **inventario_skins_shooter**, compuesta por cuatro tablas: **jugadores**, **armas**, **skins** e **inventario**. Cada tabla posee una clave primaria (`PRIMARY KEY`) que garantiza la identificación única de sus registros, mientras que las relaciones entre ellas se realizan mediante claves foráneas. Posteriormente se insertaron datos realistas para simular un inventario de skins y se desarrollaron consultas SQL que permiten consultar jugadores, armas, skins, inventarios y diferentes indicadores, verificando el correcto funcionamiento de la base de datos desde su creación hasta la obtención de información.

## Evidencia

La solución está organizada en archivos independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y tablas con sus claves primarias.
- **02_dml.sql** → Inserción de registros de prueba.
- **03_dql.sql** → Consultas para validar el funcionamiento del sistema.
- **README.md** → Documentación del ejercicio.

### Estructura del proyecto

```text
inventario_skins_shooter/
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

- Base de datos creada correctamente.
- Todas las tablas poseen una **PRIMARY KEY**.
- Relaciones mediante claves foráneas funcionando correctamente.
- Datos insertados sin errores.
- Consultas SQL ejecutadas correctamente.
- Código organizado siguiendo buenas prácticas de desarrollo y documentación.