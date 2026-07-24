# 🏍️ Garaje de Motos

## 📖 Descripción

Este proyecto consiste en el desarrollo de un módulo de base de datos para administrar un **garaje de motocicletas**. La base de datos permite registrar información de cada motocicleta, incluyendo su modelo, marca, cilindraje, precio y estado.

El ejercicio tiene como finalidad practicar la creación de tablas, la inserción de datos y la elaboración de consultas SQL que permitan obtener información útil para la administración del inventario.

---

# 🎯 Objetivo

Una academia técnica está construyendo un módulo de datos inspirado en un **Garaje de Motos**. El objetivo es guardar información ordenada, consultar indicadores útiles y dejar scripts SQL fáciles de revisar por otro desarrollador.

---

# 🗄️ Información almacenada

La tabla **garaje_motos** almacena la siguiente información:

| Campo | Descripción |
|--------|-------------|
| **id** | Identificador único de la motocicleta. |
| **modelo** | Modelo de la motocicleta. |
| **marca** | Fabricante de la motocicleta. |
| **cilindraje** | Capacidad del motor en centímetros cúbicos (cc). |
| **precio** | Precio de venta de la motocicleta. |
| **estado** | Estado de la motocicleta (`disponible`, `mantenimiento` o `vendida`). |
| **fecha_registro** | Fecha y hora en que se registró la motocicleta. |

---

# 📝 Actividades realizadas

## 1. Creación de la tabla

Se diseñó una tabla con una estructura organizada para almacenar la información del garaje.

Se utilizaron los siguientes tipos de datos:

- INT
- VARCHAR
- DECIMAL
- ENUM
- DATETIME

También se implementaron restricciones como:

- `PRIMARY KEY`
- `AUTO_INCREMENT`
- `NOT NULL`
- `DEFAULT`

---

## 2. Inserción de datos

Se registraron **10 motocicletas** pertenecientes a diferentes fabricantes.

Cada registro contiene:

- Modelo.
- Marca.
- Cilindraje.
- Precio.
- Estado.

---

## 3. Consultas realizadas

Se desarrollaron consultas para:

- Mostrar todas las motocicletas registradas.
- Consultar únicamente las motocicletas disponibles.
- Filtrar motocicletas con cilindraje superior a 600 cc.
- Ordenar las motocicletas por precio de mayor a menor.
- Contar la cantidad de motocicletas registradas por marca.

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

Al finalizar el ejercicio se obtiene una base de datos organizada para administrar un garaje de motocicletas. La información puede consultarse, filtrarse y analizarse mediante sentencias SQL, facilitando la gestión del inventario.

---

# 🎓 Competencias desarrolladas

Al realizar este ejercicio el estudiante será capaz de:

- Diseñar tablas relacionales.
- Insertar registros correctamente.
- Consultar información mediante SQL.
- Aplicar filtros y ordenamientos.
- Utilizar funciones de agregación como `COUNT()`.
- Documentar scripts SQL para facilitar su mantenimiento.

---

# 🚀 Conclusión

Este ejercicio permite aplicar los fundamentos de SQL en un escenario de gestión de un garaje de motocicletas. A través de la creación de la tabla, la inserción de registros y la ejecución de consultas, se fortalecen las habilidades necesarias para organizar y administrar información de manera eficiente, utilizando scripts claros y fáciles de revisar por otros desarrolladores.