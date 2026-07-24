# Ejercicio-01

# Explicacion 
En el siguiente ejercicio se realizó la práctica de control de transacciones en bases de datos relacionales utilizando START TRANSACTION, COMMIT y ROLLBACK. Se integraron conceptos de atomicidad de datos para asegurar que las operaciones se ejecuten como un bloque seguro ("todo o nada"), implementando escenarios de éxito y manejo de errores ante restricciones de integridad como las llaves únicas (UNIQUE).


## Estructura de ejercicio
```
└── 📁ejercicio-001
    └── 📁plantilla
        └── 📁ddl
            ├── schema.sql
        └── 📁dml
            ├── inserts.sql
        └── 📁dql
            ├── consultas.sql
        └── 📁evidencias
            ├── .gitkeep
    └── 📁resoluciones
        └── 📁joseluis-herrera
            └── 📁ddl
                ├── schema.sql
            └── 📁dml
                ├── inserts.sql
            └── 📁dql
                ├── consultas.sql
            └── 📁evidencias
                ├── README.md
        ├── .gitkeep
    └── README.md
```

## Componentes Principales

* **`ddl/schema.sql`** → Script para la creación de la base de datos y la estructura de las tablas.
* **`dml/inserts.sql`** → Inserción de datos de prueba y registros iniciales.
* **`dql/consultas.sql`** → Consultas y filtros utilizando la sentencia **SELECT**.
* **`README.md`** → Documentación general del ejercicio.