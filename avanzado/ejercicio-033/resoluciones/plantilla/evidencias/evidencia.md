# Ejercicio 033 - Funciones SQL para Inventario de Skins Shooter

Solución de nivel avanzado enfocada en la creación de **funciones almacenadas personalizadas (`FUNCTION`)** y la aplicación avanzada de funciones nativas de MySQL (cadenas, fechas, condicionales y matemáticas) para la gestión analítica de un inventario de skins de un videojuego shooter, utilizando la base de datos `campuslands_mysql`.

## Estructura de la Solución
- `ddl/schema.sql`: Creación de la base de datos, limpieza previa, definición estructurada de la tabla `skins_shooter_funciones` y desarrollo de la función personalizada `fn_calcular_valoracion_skin` para clasificar automáticamente el rango comercial de cada artículo.
- `dml/inserts.sql`: Carga inicial de 8 registros de skins con atributos detallados, incluyendo fechas de adquisición para probar funciones temporales.
- `dql/consultas.sql`: Implementación de 5 consultas avanzadas que explotan funciones de cadena (`UPPER`, `LOWER`, `CONCAT`), funciones de fecha (`DATEDIFF`, `YEAR`), la función personalizada creada, operadores condicionales y funciones de agregación formateadas (`FORMAT`, `ROUND`).

## Tabla Resumen de Datos (`skins_shooter_funciones`)
| Columna | Tipo de Dato | Restricción / Atributo | Descripción |
| :--- | :--- | :--- | :--- |
| `id` | INT | PRIMARY KEY, AUTO_INCREMENT | Identificador único y clave principal |
| `codigo_skin` | VARCHAR(50) | NOT NULL, UNIQUE | Código de serie o SKU único de la skin |
| `nombre_skin` | VARCHAR(100) | NOT NULL | Nombre comercial y diseño de la skin |
| `arma_asociada` | VARCHAR(60) | NOT NULL | Arma del juego a la que pertenece |
| `rareza` | ENUM | Común / Rara / Épica / Legendaria / Contrabando | Exclusividad de la skin |
| `precio_mercado` | DECIMAL(10,2)| CHECK (>= 0.00), Default 0.00 | Valor estimado en el mercado |
| `desgaste` | ENUM | Factory New, Minimal Wear, Field-Tested, etc. | Estado físico o desgaste visual |
| `fecha_adquisicion`| DATE | NOT NULL | Fecha en que se obtuvo el artículo |
| `estado_inventario`| ENUM | disponible / equipado / en_venta / archivado | Estatus logístico actual |

## Ejecución
1. Ejecutar el archivo `schema.sql` para compilar la función personalizada y configurar la estructura relacional.
2. Ejecutar el archivo `inserts.sql` para poblar la tabla con los registros iniciales de prueba.
3. Ejecutar el archivo `consultas.sql` para validar el funcionamiento de las consultas y la ejecución de la función almacenada.

## Decisiones Técnicas
- **Encapsulamiento con Funciones Personalizadas**: Creación de la función determinista `fn_calcular_valoracion_skin` para estandarizar reglas de negocio complejas directamente en las consultas de selección.
- **Explotación de Funciones Nativas**: Uso extensivo de funciones de manipulación temporal (`DATEDIFF`) y transformación de cadenas (`UPPER`, `CONCAT`) para enriquecer los reportes de inventario.