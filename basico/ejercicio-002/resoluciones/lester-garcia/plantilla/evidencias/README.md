# Ranking Battle Royale - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL para administrar el ranking de jugadores de un videojuego tipo Battle Royale. La solución permite almacenar información de los jugadores, temporadas, partidas disputadas y el ranking obtenido en cada temporada. Durante el desarrollo se aplicaron diferentes tipos de datos de MySQL como INT, TINYINT, SMALLINT, VARCHAR, DATE, DATETIME, DECIMAL, BOOLEAN y ENUM, con el propósito de representar correctamente la información y fortalecer las buenas prácticas de diseño de bases de datos.

## Solución General

La solución consiste en la creación de una base de datos denominada **ranking_battle_royale**, estructurada mediante cuatro tablas relacionadas por claves primarias y foráneas: **jugadores**, **temporadas**, **partidas** y **ranking**. Posteriormente se insertaron datos realistas para simular el funcionamiento de un sistema de clasificación de jugadores y finalmente se implementó un conjunto de consultas SQL que permiten visualizar rankings, temporadas activas, estadísticas de jugadores, partidas y diversos indicadores útiles para el análisis del desempeño de los participantes.

## Evidencia

La solución está organizada en archivos independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y tablas.
- **02_dml.sql** → Inserción de registros de prueba.
- **03_dql.sql** → Consultas para validar el funcionamiento.
- **README.md** → Documentación del ejercicio.

### Estructura del proyecto

```text
ranking_battle_royale/
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

- Base de datos creada correctamente.
- Relaciones mediante claves foráneas funcionando.
- Datos insertados sin errores.
- Consultas SQL ejecutadas correctamente.
- Uso adecuado de los principales tipos de datos de MySQL.
- Código organizado siguiendo buenas prácticas profesionales.