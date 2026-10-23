-- 1.6 Fallas de entrega y motivos
-- Esta consulta identifica los principales motivos de fallas logísticas.
-- La función COALESCE garantiza que los valores nulos sean agrupados como "Sin especificar".
-- Ordenar por cantidad ayuda a priorizar intervenciones en la cadena logística.

SELECT
 COALESCE(failure_reason, 'Sin especificar') AS motivo,
 COUNT(*) AS cantidad
FROM shipments
WHERE failure_reason IS NOT NULL AND failure_reason <> ''
GROUP BY motivo
ORDER BY cantidad DESC;
