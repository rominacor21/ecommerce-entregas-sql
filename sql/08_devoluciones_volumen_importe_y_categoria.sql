-- 1.8 Devoluciones: volumen, importe y categorías
-- Este bloque de consultas permite analizar las devoluciones desde tres ángulos:
-- 1. Impacto en volumen: cuántos pedidos tuvieron al menos una devolución y qué porcentaje representan sobre el total de órdenes.
-- 1. Impacto económico: monto total reembolsado por devoluciones, cuantificando la pérdida directa de ingresos.
-- 1. Origen por categoría: qué tipos de productos concentran más devoluciones y reembolsos, ayudando a detectar problemas de calidad, expectativas o descripciones poco claras.
-- Es una pieza clave para comprender el costo de la postventa y priorizar acciones (ej.: revisión de fichas de producto, proveedores, controles de calidad, políticas de cambio).

Pedidos con al menos una devolución:
SELECT COUNT(DISTINCT oi.order_id) AS orders_with_returns
FROM returns r
JOIN order_items oi ON oi.id = r.order_item_id;
Cantidad total de devoluciones y tasa sobre pedidos:
SELECT
 COUNT(*) AS total_returns,
 ROUND(
 100.0 * (
 SELECT COUNT(DISTINCT oi.order_id)
 FROM returns r2
 JOIN order_items oi ON oi.id = r2.order_item_id
 ) / (SELECT COUNT(*) FROM orders),
 2
 ) AS orders_with_returns_pct
FROM returns r;
Importe total reembolsado:
SELECT ROUND(SUM(refund_amount), 2) AS total_refund_amount
FROM returns;
Devoluciones por categoría:
SELECT
 p.category,
 COUNT(*) AS devoluciones,
 ROUND(SUM(r.refund_amount), 2) AS importe
FROM returns r
JOIN order_items oi ON oi.id = r.order_item_id
JOIN products p ON p.id = oi.product_id
GROUP BY p.category
ORDER BY devoluciones DESC;
