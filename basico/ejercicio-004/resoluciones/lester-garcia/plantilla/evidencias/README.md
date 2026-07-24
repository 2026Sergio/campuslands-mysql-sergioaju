# Garaje de Motos - Base de Datos en MySQL

## Alumno

**Lester Garcia**

## Descripción

En este ejercicio se desarrolló una base de datos relacional en MySQL para administrar la información de un garaje de motos. El sistema permite registrar propietarios, marcas, motocicletas y los mantenimientos realizados. El enfoque principal del ejercicio fue practicar el uso de la instrucción **INSERT**, incorporando registros realistas y consistentes que permitan validar el funcionamiento de la base de datos mediante consultas SQL.

## Solución General

La solución consiste en la creación de la base de datos **garaje_motos**, conformada por las tablas **propietarios**, **marcas**, **motos** y **mantenimientos**, relacionadas mediante claves primarias y foráneas. Posteriormente se realizaron múltiples instrucciones **INSERT** para poblar cada tabla con diez registros representativos, simulando el funcionamiento de un garaje de motocicletas. Finalmente, se implementaron consultas SQL para verificar la correcta inserción de los datos y obtener información relevante, como el listado de motos, propietarios, mantenimientos, costos promedio y estadísticas por marca.

## Evidencia

La solución está organizada en archivos independientes para facilitar su mantenimiento y revisión:

- **01_ddl.sql** → Creación de la base de datos y tablas.
- **02_dml.sql** → Inserción de datos mediante sentencias **INSERT**.
- **03_dql.sql** → Consultas para validar la información almacenada.
- **README.md** → Documentación del ejercicio.

### Estructura del proyecto

```text
garaje_motos/
│
├── 01_ddl.sql
├── 02_dml.sql
├── 03_dql.sql
└── README.md
```

### Resultado esperado

- Base de datos creada correctamente.
- Inserción de registros sin errores utilizando **INSERT**.
- Relaciones entre tablas funcionando correctamente.
- Consultas SQL ejecutadas con resultados coherentes.
- Información organizada y lista para ser revisada por otro desarrollador.