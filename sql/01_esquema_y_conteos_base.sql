-- 1.1 Esquema y conteos base
-- Este bloque permite visualizar la estructura general de la base (todas las tablas creadas por el sistema) y obtener los volúmenes principales necesarios para dimensionar la operación: cantidad de pedidos, envíos, tickets y devoluciones.
-- Estos valores funcionan como línea base para validar consistencia y magnitud del dataset.

SELECT name AS table_name
FROM sqlite_master
WHERE type='table' AND name NOT LIKE 'sqlite_%'
ORDER BY name;
SELECT COUNT(*) AS total_pedidos FROM orders;
SELECT COUNT(*) AS total_envios FROM shipments;
SELECT COUNT(*) AS total_tickets FROM support_tickets;
SELECT COUNT(*) AS total_devoluciones FROM returns;
