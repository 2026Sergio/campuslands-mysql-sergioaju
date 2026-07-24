# 🔧 Órdenes de Servicio para Motocicletas

## 📖 Descripción

Este proyecto desarrolla un módulo de base de datos para administrar las **órdenes de servicio de un taller de motocicletas**. La información se organiza en la tabla `ordenes_servicio_motos`, donde se registran los clientes, las motocicletas, los servicios solicitados, el costo y el estado de cada orden.

---

# 🎯 Objetivo

Una academia técnica está construyendo un módulo de datos inspirado en un **Taller Mecánico de Motos**. El objetivo es guardar información ordenada, consultar indicadores útiles y dejar scripts SQL fáciles de revisar por otro desarrollador.

---

# 🗄️ Información almacenada

La tabla **ordenes_servicio_motos** almacena:

| Campo | Descripción |
|--------|-------------|
| **id** | Identificador único de la orden. |
| **cliente** | Nombre del propietario de la motocicleta. |
| **motocicleta** | Modelo de la motocicleta que ingresa al taller. |
| **servicio** | Tipo de mantenimiento o reparación realizada. |
| **costo** | Valor del servicio prestado. |
| **estado** | Estado de la orden (`pendiente`, `en_proceso` o `finalizado`). |
| **fecha_registro** | Fecha y hora en que se registró la orden. |

---

# 📝 Actividades realizadas

## 1. Creación de la tabla

Se diseñó una tabla para almacenar las órdenes de servicio utilizando:

- `INT`
- `VARCHAR`
- `DECIMAL`
- `ENUM`
- `DATETIME`

Además, se implementaron restricciones como:

- `PRIMARY KEY`
- `AUTO_INCREMENT`
- `NOT NULL`
- `DEFAULT`

---

## 2. Inserción de datos

Se registraron **10 órdenes de servicio** con información de diferentes clientes, motocicletas y tipos de mantenimiento.

---

## 3. Consultas realizadas

Las consultas permiten:

- Visualizar todas las órdenes.
- Consultar únicamente las órdenes pendientes.
- Filtrar servicios con costos superiores a Q500.
- Ordenar las órdenes por costo.
- Contar cuántas órdenes existen según su estado.

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

Al finalizar el ejercicio se obtiene una base de datos organizada para gestionar las órdenes de servicio de un taller de motocicletas, facilitando el seguimiento de los trabajos realizados y la obtención de indicadores mediante consultas SQL.

---

# 🎓 Competencias desarrolladas

Al completar este ejercicio el estudiante aprenderá a:

- Diseñar tablas relacionales.
- Registrar órdenes de servicio.
- Consultar y filtrar información.
- Ordenar resultados.
- Utilizar funciones de agregación.
- Elaborar scripts SQL claros y fáciles de mantener.

---

# 🚀 Conclusión

Este ejercicio permite aplicar los fundamentos de SQL en un entorno de gestión de un taller mecánico de motocicletas, fortaleciendo las habilidades de diseño de bases de datos, manipulación de información y documentación de scripts para facilitar el trabajo colaborativo entre desarrolladores.