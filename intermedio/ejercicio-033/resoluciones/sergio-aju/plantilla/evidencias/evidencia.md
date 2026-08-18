# Ejercicio 033 - GROUP BY para Inventario de Skins Shooter

Solución de nivel intermedio enfocada en el dominio y aplicación de agrupaciones estadísticas y funciones de agregación mediante la cláusula **GROUP BY** en MySQL para la gestión analítica de un inventario de skins de un videojuego shooter, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza de tablas anteriores y definición estructurada de la tabla `skins_shooter_groupby` utilizando tipos de datos estrictos, restricciones de unicidad (`UNIQUE`) y validaciones lógicas (`CHECK`) para asegurar la consistencia financiera.
- `dml/inserts.sql`: Carga inicial de 8 registros de skins con variaciones en rarezas, armas asociadas, precios de mercado y estados logísticos.
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas que explotan la cláusula `GROUP BY`, funciones de agregación (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`), filtrado avanzado mediante `HAVING` y combinación con filtros de fila (`WHERE`).

## Tabla Resumen de Datos (`skins_shooter_groupby`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único y clave principal del registro |
| `codigo_skin` | VARCHAR(50) | NOT NULL, UNIQUE | Código serial o SKU único de la skin |
| `nombre_skin` | VARCHAR(100) | NOT NULL | Nombre comercial y diseño de la skin |
| `arma_asociada` | VARCHAR(60) | NOT NULL | Tipo de arma del juego a la que pertenece |
| `rareza` | ENUM | Común / Rara / Épica / Legendaria / Contrabando | Nivel de exclusividad de la skin |
| `precio_mercado` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Valor monetario estimado en el mercado |
| `desgaste` | ENUM | Factory New, Minimal Wear, Field-Tested, etc. | Estado físico o nivel de desgaste visual |
| `estado_inventario`| ENUM | disponible / equipado / en_venta / archivado | Estatus logístico actual del artículo |

## Ejecución
1. Ejecutar el archivo `schema.sql` para configurar la base de datos y la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla con los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para comprobar el funcionamiento de las agrupaciones, filtros analíticos y reportes financieros.

## Decisiones Técnicas
- **Uso Estratégico de Agregaciones**: Empleo intensivo de funciones como `SUM()`, `AVG()`, `MAX()` y `MIN()` combinadas con `GROUP BY` para obtener métricas clave del inventario de forma directa desde la base de datos.
- **Filtrado Condicional Pos-agrupación**: Incorporación de la cláusula `HAVING` para refinar reportes complejos basados en umbrales de capital acumulado.