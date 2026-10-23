-- 1.2 Cancelaciones y tasa de cancelación
-- Se calculan:
-- - total de pedidos,
-- - total de cancelaciones,
-- - la tasa de cancelación sobre el total.
-- Incluye múltiples variantes del estado "cancelado" para asegurar consistencia semántica de los datos.

SELECT
 COUNT(*) AS total_orders,
 SUM(CASE WHEN status IN
 ('cancelled','canceled','Cancelado','cancelled_by_user','cancelled_by_system')
 THEN 1 ELSE 0 END
 ) AS cancellations,
 ROUND(100.0 * SUM(CASE WHEN status IN
 ('cancelled','canceled','Cancelado','cancelled_by_user','cancelled_by_system')
 THEN 1 ELSE 0 END
 ) / COUNT(*), 2) AS cancellation_rate_pct
FROM orders;
