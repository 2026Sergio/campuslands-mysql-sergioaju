-- avanzado/ejercicio-008 - maria-montepeque
--
-- NOTA IMPORTANTE: este archivo tiene dos partes con requisitos de
-- privilegios distintos.
--   1) Las tablas de la aplicacion: las puede crear el usuario normal de
--      la app (campus), como en cualquier otro ejercicio.
--   2) Los roles, usuarios y GRANT: crear roles/usuarios y otorgar
--      privilegios son operaciones de administracion del servidor. El
--      usuario campus (que solo tiene ALL PRIVILEGES sobre la base
--      campuslands_mysql, no privilegios globales) NO puede ejecutar esta
--      segunda parte. En un entorno real, esta parte la ejecuta el DBA
--      (root), no la aplicacion. Para validar este ejercicio me conecte
--      como root.
USE campuslands_mysql;

DROP TABLE IF EXISTS jugadores_futbol_sala_roles;
DROP TABLE IF EXISTS equipos_futbol_sala_roles;

CREATE TABLE equipos_futbol_sala_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    ciudad VARCHAR(60) NOT NULL
);

CREATE TABLE jugadores_futbol_sala_roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE,
    equipo_id INT NOT NULL,
    goles INT NOT NULL DEFAULT 0,
    estado ENUM(
        'activo',
        'lesionado',
        'suspendido'
    ) NOT NULL DEFAULT 'activo',
    CONSTRAINT fk_jugadores_equipo_roles
        FOREIGN KEY (equipo_id)
        REFERENCES equipos_futbol_sala_roles(id),
    CONSTRAINT chk_goles_futbol_sala_roles CHECK (goles >= 0)
);

-- ==========================================================================
-- SECCION DE ADMINISTRACION: roles, usuarios y permisos.
-- Requiere ejecutarse con un usuario con privilegios de administrador
-- (por ejemplo root), NO con el usuario campus de la aplicacion.
-- ==========================================================================

DROP USER IF EXISTS 'lector_demo_fs'@'%';
DROP USER IF EXISTS 'editor_demo_fs'@'%';
DROP ROLE IF EXISTS rol_lector_futbol_sala;
DROP ROLE IF EXISTS rol_editor_futbol_sala;
DROP ROLE IF EXISTS rol_admin_futbol_sala;

-- Rol de solo lectura: puede consultar los datos del modulo, pero no
-- modificarlos (para reportes, dashboards, auditoria, etc.)
CREATE ROLE rol_lector_futbol_sala;
GRANT SELECT ON campuslands_mysql.equipos_futbol_sala_roles TO rol_lector_futbol_sala;
GRANT SELECT ON campuslands_mysql.jugadores_futbol_sala_roles TO rol_lector_futbol_sala;

-- Rol de edicion: puede leer, insertar y actualizar (por ejemplo, cargar
-- resultados de partidos), pero NO puede borrar registros.
CREATE ROLE rol_editor_futbol_sala;
GRANT SELECT, INSERT, UPDATE ON campuslands_mysql.equipos_futbol_sala_roles TO rol_editor_futbol_sala;
GRANT SELECT, INSERT, UPDATE ON campuslands_mysql.jugadores_futbol_sala_roles TO rol_editor_futbol_sala;

-- Rol de administracion del modulo: control total sobre las dos tablas,
-- incluyendo DELETE.
CREATE ROLE rol_admin_futbol_sala;
GRANT ALL PRIVILEGES ON campuslands_mysql.equipos_futbol_sala_roles TO rol_admin_futbol_sala;
GRANT ALL PRIVILEGES ON campuslands_mysql.jugadores_futbol_sala_roles TO rol_admin_futbol_sala;

-- Usuarios de demostracion, cada uno con un solo rol asignado.
CREATE USER 'lector_demo_fs'@'%' IDENTIFIED BY 'LectorDemo#2026';
CREATE USER 'editor_demo_fs'@'%' IDENTIFIED BY 'EditorDemo#2026';

GRANT rol_lector_futbol_sala TO 'lector_demo_fs'@'%';
GRANT rol_editor_futbol_sala TO 'editor_demo_fs'@'%';

-- SET DEFAULT ROLE hace que el rol se active automaticamente al iniciar
-- sesion, sin que el usuario tenga que ejecutar SET ROLE manualmente.
SET DEFAULT ROLE rol_lector_futbol_sala TO 'lector_demo_fs'@'%';
SET DEFAULT ROLE rol_editor_futbol_sala TO 'editor_demo_fs'@'%';

FLUSH PRIVILEGES;
