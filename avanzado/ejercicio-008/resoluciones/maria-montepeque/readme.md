# Ejercicio 008 (avanzado) - maria-montepeque

Tematica: futbol sala. Dos tablas (`equipos_futbol_sala_roles`, `jugadores_futbol_sala_roles`) mas un sistema de 3 roles y 2 usuarios de demostracion con distintos niveles de acceso.

## Decisiones tecnicas

El objetivo del ejercicio es roles y permisos. `ddl/schema.sql` tiene dos secciones con requisitos de privilegios distintos:

1. **Tablas de la aplicacion** — las crea el usuario normal `campus`, igual que en cualquier otro ejercicio.
2. **Roles, usuarios y `GRANT`** — crear roles/usuarios y otorgar privilegios son operaciones de administrador del servidor. El usuario `campus` **no** tiene privilegios globales (solo `ALL PRIVILEGES` sobre la base `campuslands_mysql`), asi que esta parte requiere conectarse como `root`.

### Verificacion de que campus NO puede administrar roles (comportamiento esperado, no un bug)

Al ejecutar `ddl/schema.sql` completo con el usuario `campus`, las dos tablas se crean sin problema, pero al llegar a la seccion de administracion falla con:

```
ERROR 1227 (42000): Access denied; you need (at least one of) the CREATE USER privilege(s) for this operation
```

Esto es exactamente lo esperado: un usuario de aplicacion no deberia poder crear otros usuarios ni otorgar privilegios. Para completar la seccion de administracion, ejecute el archivo completo como `root`.

### Los 3 roles

- **`rol_lector_futbol_sala`** — solo `SELECT` sobre ambas tablas.
- **`rol_editor_futbol_sala`** — `SELECT`, `INSERT`, `UPDATE` (sin `DELETE`).
- **`rol_admin_futbol_sala`** — `ALL PRIVILEGES` (incluye `DELETE`).

Se crearon dos usuarios de demostracion (`lector_demo_fs`, `editor_demo_fs`), cada uno con un solo rol asignado como rol por defecto (`SET DEFAULT ROLE`).

### Verificacion manual en vivo (fuera del entregable)

Conectandome como cada usuario de demostracion, confirme que los permisos se aplican de verdad:

- `lector_demo_fs`: el `SELECT` funciono; un `INSERT` fallo con `ERROR 1142 (INSERT command denied to user 'lector_demo_fs'...)`.
- `editor_demo_fs`: el `INSERT` funciono; un `DELETE` sobre esa misma fila fallo con `ERROR 1142 (DELETE command denied to user 'editor_demo_fs'...)`.

La fila insertada durante esta prueba se elimino despues (como `root`, ya que ni siquiera el editor puede borrarla) para dejar los datos del entregable exactamente como los carga `dml/inserts.sql`.

- `jugadores_futbol_sala_roles.equipo_id` es `FOREIGN KEY`.
- `CONSTRAINT chk_goles_futbol_sala_roles CHECK (goles >= 0)` evita datos imposibles.

## Archivos

- `ddl/schema.sql` — dos tablas (creables por `campus`) + seccion de roles/usuarios/GRANT (requiere `root`).
- `dml/inserts.sql` — 4 equipos y 10 jugadores (creables por `campus`).
- `dql/consultas.sql` — 2 consultas de negocio (funcionan con cualquier rol que tenga `SELECT`) + 4 `SHOW GRANTS` de inspeccion de permisos (requieren `root`).
- `evidencias/resultados_consultas.txt` — salida real de las 6 consultas, mas la prueba en vivo de acceso denegado para cada usuario de demostracion.

## Ejecutar

```bash
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < ddl/schema.sql   # crea las tablas; falla (esperado) en la seccion de roles
docker exec -i campuslands-mysql-db mysql -u root -proot123 campuslands_mysql < ddl/schema.sql        # completa tablas + roles/usuarios/GRANT
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dml/inserts.sql
docker exec -i campuslands-mysql-db mysql -u campus -pcampus123 campuslands_mysql < dql/consultas.sql  # las 4 ultimas (SHOW GRANTS) requieren -u root
```
