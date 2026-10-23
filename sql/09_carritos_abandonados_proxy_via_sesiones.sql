-- 1.9 “Carritos abandonados” (proxy vía sesiones)
-- La base no contiene un evento explícito de “carrito abandonado” a nivel de pedidos, pero sí una marca binaria a nivel de sesiones (abandoned_cart).
-- Esta consulta calcula:
-- - Total de sesiones en el sitio.
-- - Cantidad de sesiones donde se abandonó el carrito.
-- - Porcentaje de sesiones con carrito abandonado (proxy de fricción en el funnel de compra).
-- Es un indicador relevante para entender problemas en checkout, medios de pago, costos de envío, tiempos de entrega, etc.

SELECT
 COUNT(*) AS total_sessions,
 SUM(CASE WHEN abandoned_cart = 1 THEN 1 ELSE 0 END) AS abandoned,
 ROUND(
 100.0 * SUM(CASE WHEN abandoned_cart = 1 THEN 1 ELSE 0 END) / COUNT(*),
 2
 ) AS abandoned_pct
FROM sessions;
