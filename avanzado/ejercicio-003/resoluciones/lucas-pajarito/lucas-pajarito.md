# 🎯 Inventario de Skins Shooter

## 📖 Descripción

Este proyecto consiste en el desarrollo de un módulo de base de datos para administrar un **inventario de skins de videojuegos Shooter**. La base de datos permite registrar información sobre las skins disponibles en diferentes videojuegos, incluyendo su nivel de rareza, precio y estado dentro del inventario.

El ejercicio busca fortalecer las habilidades en el diseño de bases de datos, la inserción de registros y la creación de consultas SQL que faciliten el análisis de la información.

---

# 🎯 Objetivo

Una academia técnica está construyendo un módulo de datos inspirado en un **Inventario de Skins Shooter**. El objetivo es guardar información ordenada, consultar indicadores útiles y dejar scripts SQL fáciles de revisar por otro desarrollador.

---

# 🗄️ Información almacenada

La tabla **inventario_skins_shooter** almacena la siguiente información:

| Campo | Descripción |
|--------|-------------|
| **id** | Identificador único de la skin. |
| **nombre_skin** | Nombre de la skin. |
| **videojuego** | Juego al que pertenece la skin. |
| **rareza** | Nivel de rareza (`Comun`, `Rara`, `Epica` o `Legendaria`). |
| **precio** | Valor de la skin. |
| **estado** | Estado de la skin (`disponible`, `equipada` o `vendida`). |
| **fecha_registro** | Fecha y hora en que se registró la skin. |

---

# 📝 Actividades realizadas

## 1. Creación de la tabla

Se diseñó una tabla utilizando tipos de datos apropiados para almacenar la información del inventario de skins.

Se implementaron restricciones como:

- `PRIMARY KEY`
- `AUTO_INCREMENT`
- `NOT NULL`
- `DEFAULT`
- `ENUM`

---

## 2. Inserción de datos

Se registraron **10 skins** pertenecientes a diferentes videojuegos Shooter como:

- Valorant
- Counter-Strike 2
- Call of Duty
- PUBG
- Free Fire

Cada registro incluye:

- Nombre de la skin.
- Videojuego.
- Rareza.
- Precio.
- Estado.

---

## 3. Consultas realizadas

Se desarrollaron consultas para:

- Mostrar todas las skins registradas.
- Consultar únicamente las skins disponibles.
- Filtrar las skins de rareza legendaria.
- Ordenar las skins según su precio.
- Contar la cantidad de skins registradas por videojuego.

---

# 📚 Comandos SQL utilizados

- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `COUNT`

---

# ✅ Resultado esperado

Al finalizar el ejercicio se obtiene un inventario organizado de skins que permite consultar, filtrar y analizar la información mediante sentencias SQL, facilitando la administración de los datos.

---

# 🎓 Competencias desarrolladas

Al completar este ejercicio el estudiante será capaz de:

- Diseñar tablas relacionales.
- Insertar registros en una base de datos.
- Consultar información mediante SQL.
- Filtrar registros utilizando condiciones.
- Ordenar datos.
- Aplicar funciones de agregación como `COUNT()`.
- Documentar scripts para facilitar su mantenimiento.

---

# 🚀 Conclusión

Este ejercicio permite aplicar los fundamentos de SQL utilizando un escenario relacionado con videojuegos Shooter. A través de la creación de la tabla, la inserción de datos y la ejecución de consultas, se fortalecen las habilidades necesarias para administrar información de manera organizada, eficiente y fácil de mantener por cualquier desarrollador.