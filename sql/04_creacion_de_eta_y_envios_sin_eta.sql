-- 1.4 Creación de ETA y envíos sin ETA
-- La base original no incluía una columna ETA (fecha estimada de entrega), esencial para calcular la puntualidad logística.
-- Para reconstruirla, se generó una ETA sintética basada en:
-- ETA = shipped_date + delivery_duration_days
-- Esto permite procesar métricas de puntualidad (OTD) y detectar envíos incompletos.
-- Finalmente, se identifica cuántos registros no pudieron recibir ETA por contener valores nulos o inconsistentes.

ALTER TABLE shipments
ADD COLUMN estimated_delivery_date1 TEXT;
UPDATE shipments
SET estimated_delivery_date1 = DATE(shipped_date, '+' || delivery_duration_days || ' days')
WHERE shipped_date IS NOT NULL;
SELECT COUNT(*) AS envios_sin_eta
FROM shipments
WHERE estimated_delivery_date1 IS NULL;
