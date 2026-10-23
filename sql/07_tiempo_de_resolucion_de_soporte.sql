-- 1.7 Tiempo de resolución de soporte
-- Esta consulta convierte la diferencia entre apertura y resolución del ticket a horas, permitiendo un análisis más preciso.
-- El tiempo promedio de resolución es un indicador crítico de experiencia de cliente.

SELECT
 ROUND(AVG((julianday(resolved_at) - julianday(created_at)) * 24), 2) AS avg_resolution_hours
FROM support_tickets
WHERE resolved_at IS NOT NULL AND created_at IS NOT NULL;
