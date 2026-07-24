# Ejercicio: Taller Mecánico de Motos

## Nombre del alumno:Lester Garcia.
_____________________________________

---

# Descripción general del ejercicio

Se desarrolló una base de datos en MySQL para administrar un taller mecánico de motos. La solución permite registrar clientes, motocicletas, mecánicos, servicios y órdenes de servicio, implementando índices para optimizar las consultas más frecuentes.

---

# Explicación general de la solución

El proyecto está organizado en tres archivos SQL:

- **ddl.sql:** creación de la base de datos, tablas y relaciones.
- **dml.sql:** inserción de datos de prueba consistentes.
- **dql.sql:** consultas de análisis y creación de índices.

Se implementan índices sobre columnas utilizadas frecuentemente en búsquedas, filtros y ordenamientos para mejorar el rendimiento de las consultas.

Índices creados:

- `idx_cliente_nombre`
- `idx_moto_marca_modelo`
- `idx_mecanico_especialidad`
- `idx_servicio_nombre`
- `idx_orden_estado_fecha`

Posteriormente se incluyen consultas que aprovechan dichos índices.

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
- Índices creados exitosamente.
- Consultas ejecutadas utilizando los índices definidos.
