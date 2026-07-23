# Ejercicio 005 - Indices para Taller Mecanico de Motos


## Descripcion

Este proyecto implementa una base de datos MySQL para administrar un taller mecanico de motos.

La solucion permite registrar motos, controlar ordenes de servicio y optimizar consultas mediante indices.


## Base de datos

```sql
CREATE DATABASE IF NOT EXISTS campuslands_mysql;
Estructura del proyecto
resolucion/

├── README.md

├── ddl/
│   └── schema.sql

├── dml/
│   └── inserts.sql

└── dql/
    └── consultas.sql
Tablas creadas
motos

Guarda la informacion principal de los vehiculos:

Placa.
Marca.
Modelo.
Cilindrada.
Propietario.
Contacto.
Fecha de registro.
ordenes_servicio

Almacena los trabajos realizados por el taller:

Servicio solicitado.
Mecanico encargado.
Costo.
Estado.
Fechas de ingreso y entrega.
Indices implementados
idx_moto_placa

Permite realizar busquedas rapidas por placa.

idx_moto_marca

Optimiza consultas agrupadas por fabricante.

idx_orden_estado

Mejora consultas de servicios pendientes, en proceso o finalizados.

idx_orden_fecha_ingreso

Facilita consultas por fechas de ingreso.

idx_orden_moto_estado

Indice compuesto para buscar servicios filtrando por moto y estado.

Validaciones aplicadas

La base de datos incluye:

Placas unicas mediante UNIQUE.
Campos obligatorios mediante NOT NULL.
Relacion entre motos y ordenes mediante FOREIGN KEY.
Control de estados mediante ENUM.
Orden de ejecucion

Ejecutar:

ddl/schema.sql
dml/inserts.sql
dql/consultas.sql
Consultas realizadas

Se incluyen consultas para:

Buscar motos por placa.
Consultar servicios activos.
Generar reportes por mecanico.
Filtrar motos por cilindrada.
Obtener servicios mas costosos.
Revisar indices creados.
Decisiones tecnicas

Se utilizaron nombres descriptivos y separacion de responsabilidades.

Los indices fueron creados sobre columnas utilizadas frecuentemente en filtros, agrupaciones y relaciones entre tablas.