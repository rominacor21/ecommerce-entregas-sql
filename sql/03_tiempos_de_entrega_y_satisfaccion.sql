-- 1.3 Tiempos de entrega y satisfacción
-- Son tres análisis complementarios:
-- 1. Tiempo promedio de entrega:
-- La duración real del envío desde despacho a entrega.
-- 1. Rating general de entrega:
-- Satisfacción del cliente respecto a la logística.
-- 1. Relación entre rapidez y satisfacción:
-- Muestra cómo mejora o empeora el rating según rango de días.

SELECT ROUND(AVG(delivery_duration_days), 2) AS avg_delivery_days
FROM shipments
WHERE delivered_date IS NOT NULL AND shipped_date IS NOT NULL;
SELECT ROUND(AVG(rating), 2) AS avg_rating
FROM delivery_ratings
WHERE rating IS NOT NULL;
WITH tiempos AS (
 SELECT s.id AS shipment_id, s.delivery_duration_days AS dias_entrega
 FROM shipments s
 WHERE s.delivered_date IS NOT NULL AND s.shipped_date IS NOT NULL
)
SELECT
 CASE
 WHEN dias_entrega < 3 THEN '<3 días'
 WHEN dias_entrega BETWEEN 3 AND 7 THEN '3-7 días'
 ELSE '>7 días' END AS rango_entrega,
 ROUND(AVG(r.rating), 2) AS rating_promedio,
 COUNT(*) AS n_envios
FROM tiempos t
JOIN delivery_ratings r ON r.shipment_id = t.shipment_id
GROUP BY rango_entrega
ORDER BY MIN(dias_entrega);
