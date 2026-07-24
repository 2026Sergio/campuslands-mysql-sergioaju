USE campuslands_mysql;

-- 1. Saldo actual de cada equipo
SELECT nombre_equipo, saldo, estado
FROM billeteras_equipo
ORDER BY saldo DESC;

-- 2. Historial de movimientos con nombre de equipo (JOIN)
SELECT b.nombre_equipo, m.tipo_movimiento, m.monto, m.concepto, m.fecha_movimiento
FROM movimientos_premio m
INNER JOIN billeteras_equipo b ON m.id_billetera = b.id_billetera
ORDER BY m.fecha_movimiento;

-- 3. Total depositado vs retirado por equipo
SELECT b.nombre_equipo,
       SUM(CASE WHEN m.tipo_movimiento = 'deposito' THEN m.monto ELSE 0 END) AS total_depositos,
       SUM(CASE WHEN m.tipo_movimiento = 'retiro' THEN m.monto ELSE 0 END) AS total_retiros
FROM billeteras_equipo b
LEFT JOIN movimientos_premio m ON b.id_billetera = m.id_billetera
GROUP BY b.nombre_equipo;

-- 4. Equipos con billetera congelada (caso limite de la transaccion revertida)
SELECT nombre_equipo, saldo, estado
FROM billeteras_equipo
WHERE estado = 'congelada';

-- 5. Movimientos de tipo retiro relacionados a transferencias
SELECT b.nombre_equipo, m.monto, m.concepto
FROM movimientos_premio m
INNER JOIN billeteras_equipo b ON m.id_billetera = b.id_billetera
WHERE m.tipo_movimiento = 'retiro';