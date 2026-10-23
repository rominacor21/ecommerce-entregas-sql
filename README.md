# Experiencia de entrega en un e-commerce: de SQL al backlog

Análisis con SQL de la base operativa de **Unknown Company**, una empresa de e-commerce y logística que perdía clientes. A partir de los datos armamos un business case, un backlog priorizado y un plan de trabajo por sprints.

> Trabajo grupal de Project Management y Business Analysis, Licenciatura en Negocios Digitales, Universidad ORT Uruguay, 2025.

## Hallazgos

| Indicador | Resultado |
|---|---|
| Pedidos analizados | 12.000 |
| Pedidos cancelados | 1.406, un 11,72 %: 1 de cada 9 |
| Tiempo promedio de resolución en soporte | 318 horas, casi 13 días |
| Rating con entrega en menos de 3 días | más de 4 sobre 5 |
| Rating con entrega de más de una semana | 1,34 sobre 5 |

La puntualidad y la visibilidad del envío son lo que más pesa en la experiencia del cliente.

## Consultas SQL

Cada archivo de [`sql/`](sql) tiene la consulta y una explicación de qué mide.

| Archivo | Qué responde |
|---|---|
| 01 | Esquema de la base y volúmenes de pedidos, envíos, tickets y devoluciones |
| 02 | Tasa de cancelación |
| 03 | Tiempo de entrega, rating y relación entre rapidez y satisfacción |
| 04 | Reconstrucción de la fecha estimada de entrega (ETA) y envíos sin ETA |
| 05 | Entregas a tiempo (On-Time Delivery) |
| 06 | Fallas de entrega y motivos |
| 07 | Tiempo de resolución de soporte |
| 08 | Devoluciones: volumen, importe y categorías |
| 09 | Carritos abandonados, aproximados a partir de las sesiones |

## Del dato al plan

- **Business case:** la experiencia está fragmentada: áreas desconectadas, sin ETA, sin alertas y con comunicación reactiva.
- **Backlog de prioridad alta:**
  - ETA visible y actualizada automáticamente.
  - Alertas proactivas antes de una demora.
  - Vista unificada para soporte.
  - Dashboard operativo.
- **Backlog de prioridad media:**
  - Validación automática de direcciones.
  - Encuesta post-entrega.
  - Panel ejecutivo de KPIs.
  - Programa de fidelización.
- **Planificación:** roadmap por sprints, matriz de riesgos y seguimiento del sprint.

## Metas propuestas

- 30 % menos cancelaciones
- Soporte resuelto en 24 horas
- Rating por encima de 4 sobre 5
- 15 % más recompra

## Stack

SQL (SQLite) · User stories · Scrum · Matriz de riesgos

La base `unknown_company.sqlite` es material del curso y no se publica.

---

**Romina Cor Castro** · [LinkedIn](https://www.linkedin.com/in/rominacor/)
