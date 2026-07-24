USE campuslands_mysql;

CREATE TABLE IF NOT EXISTS jugadoresMOBA(
    id_jugador Int AUTO_INCREMENT PRIMARY KEY,
    nombre Text NOT NULL,
    categoria Text NOT NULL,
    blindaje Decimal NOT NULL
)