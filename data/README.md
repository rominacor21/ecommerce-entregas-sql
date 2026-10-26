# Datos

El análisis usa la base `unknown_company.sqlite`, entregada por la cátedra. No se publica porque es material del curso.

Tablas que usan las consultas de `sql/`:

| Tabla | Para qué se usa |
|---|---|
| `orders` | pedidos y su estado, para medir cancelaciones |
| `order_items` | ítems de cada pedido, para importes de devoluciones |
| `products` | categorías de producto |
| `shipments` | fechas de despacho y entrega, duración y fallas |
| `delivery_ratings` | satisfacción del cliente con la entrega |
| `support_tickets` | tickets de soporte y tiempos de resolución |
| `returns` | devoluciones, importes y categorías |
| `sessions` | sesiones, para aproximar carritos abandonados |

Para correr las consultas, ubicá el archivo en `data/unknown_company.sqlite`.
