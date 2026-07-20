# Funcionalidad 002 - Tipos de datos MySQL

## Dificultad
Funcionalidad MySQL aplicada

## Tematica usada
carreras urbanas

## Que es
Tipos de datos MySQL es una funcionalidad de MySQL relacionada con seleccion correcta entre INT, DECIMAL, VARCHAR, DATE, DATETIME y JSON. Permite resolver problemas reales de almacenamiento, consulta, integridad, rendimiento o automatizacion dentro de una base de datos relacional.

## Como se usa
Se usa escribiendo sentencias SQL especificas de MySQL y validando su comportamiento con datos reales. La idea no es memorizar sintaxis, sino entender cuando conviene aplicarla y que problema evita.

## Como se aplica en este ejercicio
Vas a crear un caso practico inspirado en carreras urbanas. Debes construir una mini base de datos o adaptar la plantilla para demostrar la funcionalidad `Tipos de datos MySQL` con un ejemplo que pueda ejecutarse y explicarse.

## Objetivo
Comprender Tipos de datos MySQL, aplicarlo en un escenario realista y documentar que cambio produce sobre los datos o consultas.

## Explicacion paso a paso
1. Lee la descripcion de la funcionalidad.
2. Crea tablas de prueba relacionadas con el contexto.
3. Inserta datos suficientes para ver el comportamiento.
4. Aplica la funcionalidad MySQL solicitada.
5. Escribe consultas o comandos de validacion.
6. Documenta que observaste antes y despues.

## Instrucciones detalladas
- Trabaja dentro de `funcionalidades/ejercicio-002/resoluciones/nombre-apellido/`.
- Incluye scripts separados para estructura, datos y pruebas.
- Agrega comentarios SQL explicando las partes importantes.
- Incluye un `README.md` propio con: que es, como lo aplicaste y como validarlo.

## Ejemplo
```sql
CREATE TABLE ejemplo_mysql (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(80) NOT NULL,
  creado_en DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

## Entregable esperado
Una demostracion pequena pero completa de `Tipos de datos MySQL`, con scripts SQL y explicacion clara.

## Reglas
- No copies teoria sin aplicarla.
- No uses otra base de datos distinta a MySQL.
- No subas credenciales reales ni dumps grandes.
- El PR debe apuntar a `dev`.

## Consejos
- Prueba primero con pocos datos.
- Agrega comentarios en SQL para explicar decisiones.
- Si la funcionalidad afecta rendimiento, incluye una consulta antes y despues.

## Errores comunes
- Usar sintaxis de otro motor SQL.
- No demostrar el resultado de la funcionalidad.
- Confundir teoria con evidencia.

## Pistas opcionales
- Revisa la documentacion oficial de MySQL si tienes duda de sintaxis.
- Usa `SHOW`, `DESCRIBE`, `EXPLAIN` o consultas de validacion cuando aplique.

## Como validar si quedo bien
- Los scripts ejecutan sin errores en MySQL.
- La funcionalidad se ve aplicada, no solo mencionada.
- Tu README explica que problema resuelve.
- La entrega esta en `resoluciones/nombre-apellido/`.
