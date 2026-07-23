# Ejercicio 002 - Procedimientos almacenados para ranking Battle Royale

## Descripción

Se desarrolló una base de datos en MySQL para administrar un ranking de jugadores inspirado en un videojuego Battle Royale.

La solución utiliza procedimientos almacenados para automatizar consultas y operaciones frecuentes sobre los jugadores.

## Tecnologías

- MySQL 8
- SQL

## Tabla principal

### jugadores_battle

Almacena información de los jugadores registrados.

Campos:

- id_jugador
- nombre_jugador
- nickname
- nivel
- partidas_jugadas
- victorias
- puntaje
- estado

## Validaciones aplicadas

- `nickname` tiene restricción UNIQUE.
- El estado del jugador utiliza ENUM.
- La relación de datos mantiene nombres descriptivos.

## Procedimientos almacenados

### obtener_ranking()

Muestra el ranking de jugadores activos ordenados por puntaje.

### buscar_por_nivel(nivel)

Permite consultar jugadores según un nivel mínimo.

### top_jugadores(cantidad)

Obtiene los mejores jugadores según la cantidad indicada.

### actualizar_puntaje(id, puntaje)

Actualiza el puntaje de un jugador específico.

## Ejecución

1. Ejecutar `schema.sql`.
2. Ejecutar `inserts.sql`.
3. Ejecutar `consultas.sql`.

## Resultado

La base de datos permite administrar jugadores de un ranking Battle Royale y utilizar procedimientos almacenados para generar reportes y actualizar información.