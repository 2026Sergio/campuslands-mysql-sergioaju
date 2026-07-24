# Ejercicio: Garaje de Motos

## Nombre del alumno:Lester Garcia.
_____________________________________

---

# Descripción general del ejercicio

Se desarrolló una base de datos en MySQL para administrar un garaje de motos. El sistema permite registrar clientes, motos, servicios y órdenes de servicio. Además, se implementan triggers para automatizar tareas de auditoría y validación de datos.

---

# Explicación general de la solución

La solución está dividida en tres archivos principales:

- **ddl.sql:** creación de la base de datos, tablas y relaciones.
- **dml.sql:** inserción de datos de ejemplo.
- **dql.sql:** consultas de análisis y creación de triggers.

Los triggers implementados realizan las siguientes funciones:

- Registrar automáticamente una auditoría cuando se crea una orden de servicio.
- Registrar los cambios de estado de una orden.
- Guardar un registro antes de eliminar una orden.
- Validar que el precio de un servicio sea mayor que cero.
- Asignar automáticamente la fecha de registro a un cliente cuando no se proporciona.

---

# Evidencia general

Orden de ejecución:

1. Ejecutar `ddl.sql`.
2. Ejecutar `dml.sql`.
3. Ejecutar `dql.sql`.

Resultados esperados:

- Base de datos creada correctamente.
- Relaciones entre tablas funcionando.
- Datos insertados sin errores.
- Consultas mostrando información consistente.
- Triggers ejecutándose automáticamente al insertar, actualizar o eliminar registros.
