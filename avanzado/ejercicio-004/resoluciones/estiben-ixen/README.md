# Ejercicio 004 - Triggers Garaje de Motos

## Descripcion

Este proyecto implementa una base de datos MySQL para administrar un garaje de motos.

El sistema permite registrar motos ingresadas al garaje, controlar espacios ocupados y almacenar un historial automático mediante triggers.


## Base de datos utilizada

```sql
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
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
Tablas creadas
garaje_motos

Contiene la información principal de cada moto:

Identificador automático.
Placa única.
Marca y modelo.
Cilindraje.
Propietario.
Espacio asignado.
Estado actual.
Fechas de ingreso y salida.
historial_motos

Guarda los movimientos generados automáticamente por el trigger.

Trigger implementado

Se creó el trigger:

registrar_ingreso_moto

Funciona después de insertar una moto nueva en la tabla garaje_motos.

Su función es registrar automáticamente:

ID de la moto.
Acción realizada.
Fecha del movimiento.
Detalle del ingreso.
Validaciones aplicadas

La solución incluye:

Placa única mediante UNIQUE.
Espacio de parqueo único mediante UNIQUE.
Campos obligatorios con NOT NULL.
Estados controlados mediante ENUM.
Relación entre tablas usando FOREIGN KEY.
Orden de ejecución

Ejecutar los archivos en este orden:

ddl/schema.sql
dml/inserts.sql
dql/consultas.sql
Consultas realizadas

La solución permite consultar:

Motos actualmente dentro del garaje.
Cantidad de motos por marca.
Motos con mayor cilindrada.
Total de motos registradas.
Historial generado por triggers.
Decisiones técnicas

Se utilizaron nombres descriptivos para facilitar mantenimiento.

Se separaron responsabilidades:

DDL: creación y estructura.
DML: inserción y modificación de datos.
DQL: consultas y reportes.