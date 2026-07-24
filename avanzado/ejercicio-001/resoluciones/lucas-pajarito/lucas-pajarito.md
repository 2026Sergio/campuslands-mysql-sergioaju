# 🏆 Torneo Esports MOBA

## 📖 Descripción

En este ejercicio se desarrolló una base de datos para administrar la información de un **torneo de videojuegos MOBA**.

La finalidad del proyecto es almacenar los datos de los equipos participantes, realizar consultas que permitan analizar el desempeño de los equipos y mantener una estructura de base de datos organizada para facilitar su mantenimiento y revisión.

---

# 🎯 Objetivo

Una academia técnica desarrolla un módulo de datos inspirado en un torneo Esports MOBA. El propósito es:

- Registrar los equipos participantes.
- Almacenar información relevante del torneo.
- Consultar indicadores de desempeño.
- Crear scripts SQL claros y fáciles de entender por otros desarrolladores.

---

# 🗄️ Información almacenada

La tabla **torneo_esports_moba** guarda la siguiente información:

| Campo | Descripción |
|--------|-------------|
| **id** | Identificador único del equipo. |
| **equipo** | Nombre del equipo participante. |
| **juego** | Videojuego MOBA en el que compite el equipo. |
| **jugadores** | Número de integrantes del equipo. |
| **puntaje** | Puntaje acumulado durante el torneo. |
| **estado** | Estado del equipo (`clasificado`, `en_competencia` o `eliminado`). |
| **creado_en** | Fecha y hora de creación del registro. |

---

# 📝 Actividades realizadas

## 1. Creación de la tabla

Se diseñó una tabla utilizando los tipos de datos adecuados para almacenar la información del torneo.

Se implementaron las siguientes restricciones:

- PRIMARY KEY
- AUTO_INCREMENT
- NOT NULL
- DEFAULT
- ENUM

---

## 2. Inserción de datos

Se registraron **10 equipos** pertenecientes a distintos videojuegos MOBA.

Cada registro almacena:

- Nombre del equipo
- Juego
- Cantidad de jugadores
- Puntaje
- Estado del equipo

---

## 3. Consultas realizadas

Se implementaron consultas para:

- Mostrar todos los equipos.
- Consultar los equipos clasificados.
- Filtrar equipos con puntaje superior a 900 puntos.
- Ordenar el ranking por puntaje.
- Mostrar los cinco mejores equipos.

---

# 📚 Comandos SQL utilizados

- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `LIMIT`

---

# ✅ Resultado esperado

Al finalizar el ejercicio se obtiene una base de datos organizada que permite administrar un torneo Esports MOBA, consultar el rendimiento de los equipos y generar información útil para el seguimiento de la competencia.

---

# 🎓 Competencias desarrolladas

El estudiante fortalecerá las siguientes habilidades:

- Diseño de tablas relacionales.
- Inserción de registros.
- Consulta de información mediante SQL.
- Filtrado y ordenamiento de datos.
- Organización y documentación de scripts SQL.

---

# 🚀 Conclusión

Este ejercicio permite aplicar los fundamentos de SQL en un contexto de torneos Esports MOBA. A través de la creación de la tabla, el registro de equipos y la ejecución de consultas, se desarrollan habilidades esenciales para diseñar y administrar bases de datos orientadas a escenarios del mundo real.