# Netflix Global Analytics Dashboard

Proyecto de análisis y visualización orientado a estudiar el consumo global de contenido de Netflix mediante sus rankings semanales y datos financieros.

## Objetivo de negocio

Construir una vista ejecutiva que permita analizar:

- Evolución semanal del consumo.
- Contenidos con mayor permanencia en el Top 10.
- Diferencias entre películas, series y mercados.
- Relación exploratoria entre horas vistas, suscriptores e ingresos.
- Contenidos con desempeño sostenido mediante un `Longevity Score`.

## Tecnologías

`Power BI` · `DAX` · `SQL` · `Excel` · `Data Modeling` · `KPI Design`

## KPIs

- Global Hours Viewed.
- Longevity Score.
- Average Hours per Subscriber.
- Revenue by Quarter.
- Weekly Growth.

## Hallazgos

- Las series mostraron mayor permanencia en los rankings semanales que las películas.
- El engagement presentó picos asociados con lanzamientos globales.
- Los patrones de consumo variaron entre mercados.
- El Longevity Score ayudó a diferenciar popularidad inicial de desempeño sostenido.

## Vista previa

![Dashboard 1](https://github.com/user-attachments/assets/2628ae0d-8b9c-4df2-9bdb-66c9ca308a81)

![Dashboard 2](https://github.com/user-attachments/assets/9f550bc9-7be1-4434-b0ff-c722e44535df)

![Dashboard 3](https://github.com/user-attachments/assets/f75104cb-f071-487b-93ac-b3f6-81372e023191)

## Estado del repositorio

Este repositorio funciona actualmente como una muestra visual y metodológica del proyecto. Algunos archivos binarios publicados son marcadores incompletos y no permiten reconstruir el dashboard.

El archivo `netflix_queries.sql` corresponde a una práctica independiente de modelado dimensional con datos sintéticos de ventas y **no fue la fuente del dashboard de Netflix**. Se conserva temporalmente como evidencia de práctica en SQL, pero será separado en otro repositorio.

Para completar la reproducción del proyecto falta publicar:

- El archivo `.pbix` válido.
- El dataset de países completo.
- Las medidas DAX utilizadas.
- Un diccionario de datos y las fuentes exactas.

Esta aclaración evita atribuir al dashboard archivos que no participaron en su construcción.

## Limitaciones

- Las métricas agregadas no permiten inferir comportamiento individual.
- Comparar consumo con variables financieras requiere considerar diferencias de periodicidad.
- Los rankings Top 10 representan popularidad relativa, no todo el catálogo.

## Autora

**Sofía González Semper** — Data Analytics, operaciones y mejora de procesos.
