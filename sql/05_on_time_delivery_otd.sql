-- 1.5 On-Time Delivery (OTD)
-- El OTD (On-Time Delivery) evalúa si la entrega ocurrió antes o en la fecha estimada reconstruida.
-- Dado que la ETA se basó en la duración real histórica, el resultado tiende a mostrar puntualidad perfecta.

SELECT
 COUNT(*) AS total_entregas,
 SUM(CASE WHEN delivered_date <= estimated_delivery_date1 THEN 1 ELSE 0 END) AS entregas_a_tiempo,
 ROUND(100.0 * SUM(CASE WHEN delivered_date <= estimated_delivery_date1 THEN 1 ELSE 0 END) / COUNT(*), 2) AS otd_pct
FROM shipments
WHERE delivered_date IS NOT NULL
AND estimated_delivery_date1 IS NOT NULL;
