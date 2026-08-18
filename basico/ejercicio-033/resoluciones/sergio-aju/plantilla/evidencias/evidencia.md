# Ejercicio 033 - PRIMARY KEY para Inventario de Skins Shooter

Solución de nivel básico enfocada en la correcta aplicación de la restricción **PRIMARY KEY** junto con atributos de unicidad y tipos de datos precisos en MySQL para un sistema de gestión de inventario de skins de un videojuego shooter, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas previas y definición estructurada de la tabla `skins_shooter` aplicando un identificador único autoincremental como `PRIMARY KEY`, restricciones de unicidad (`UNIQUE`) para códigos de serie y validaciones lógicas mediante `CHECK` para los precios de mercado.
- `dml/inserts.sql`: Carga inicial de 8 registros de skins con diferentes rarezas, armas asociadas, desgastes y estados logísticos en el inventario.
- `dql/consultas.sql`: Implementación de 5 consultas analíticas que incluyen reportes ordenados por valor, filtros por estado operativo, agregaciones por rareza y valoraciones de mercado (*Top 3*).

## Tabla Resumen de Datos (`skins_shooter`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único y clave principal del registro |
| `codigo_skin` | VARCHAR(50) | NOT NULL, UNIQUE | Código de serie único de la skin |
| `nombre_skin` | VARCHAR(100) | NOT NULL | Nombre comercial de la skin |
| `arma_asociada` | VARCHAR(60) | NOT NULL | Tipo de arma a la que pertenece la skin |
| `rareza` | ENUM | Común / Rara / Épica / Legendaria / Contrabando | Nivel de exclusividad de la skin |
| `precio_mercado` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Valor monetario estimado en el mercado |
| `desgaste` | ENUM | Factory New, Minimal Wear, Field-Tested, etc. | Estado físico o nivel de desgaste del diseño |
| `estado_inventario`| ENUM | disponible / equipado / en_venta / archivado | Estatus logístico actual en el perfil |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos, la estructura relacional y la clave primaria.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla con los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las consultas de negocio y reportes financieros.

## Decisiones Técnicas
- **Implementación de Clave Primaria**: Uso de un campo `id` de tipo `INT AUTO_INCREMENT PRIMARY KEY` para garantizar la unicidad e independencia de cada fila en la tabla de skins.
- **Precisión Financiera**: Empleo del tipo de dato `DECIMAL(10,2)` en conjunto con una restricción `CHECK` para asegurar que los precios de mercado sean exactos y nunca negativos.