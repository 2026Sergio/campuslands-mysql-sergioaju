# Torneo Esports MOBA - Base de Datos en MySQL

## Alumno
**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL inspirada en un torneo de esports del género MOBA. El objetivo fue diseñar una estructura organizada que permitiera almacenar información sobre equipos, jugadores, torneos y partidas, aplicando buenas prácticas de modelado de bases de datos. Además, se separó la solución en los tres componentes principales del lenguaje SQL: DDL para la creación de la estructura, DML para la inserción de datos de prueba y DQL para realizar consultas que permitan obtener información útil del sistema.

## Solución General

La solución consiste en la creación de una base de datos llamada **torneo_esports_moba**, conformada por cuatro tablas relacionadas mediante claves primarias y foráneas: **equipos**, **jugadores**, **torneos** y **partidas**. Posteriormente se insertaron registros realistas que simulan el funcionamiento de un torneo profesional de videojuegos, permitiendo validar el modelo de datos. Finalmente, se desarrolló un conjunto de consultas SQL para responder preguntas frecuentes como listar equipos y jugadores, conocer los ganadores de las partidas, calcular el premio promedio de los torneos, contar las victorias de cada equipo y obtener diferentes indicadores del sistema, demostrando el correcto funcionamiento de la base de datos desde su creación hasta la obtención de información.

## Evidencia

La solución está organizada en tres archivos SQL independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y de las tablas.
- **02_dml.sql** → Inserción de los datos de prueba.
- **03_dql.sql** → Consultas para verificar y analizar la información almacenada.

**Estructura del proyecto:**

```text
torneo_esports_moba/
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

**Resultado esperado:**

- Base de datos creada correctamente.
- Relaciones entre tablas funcionando mediante claves foráneas.
- Datos insertados sin errores.
- Consultas ejecutadas correctamente mostrando información coherente sobre equipos, jugadores, torneos y partidas.