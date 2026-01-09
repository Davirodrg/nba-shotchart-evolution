# nba-shotchart-evolution (2004 - 2025)

Shot chart heatmap + efficiency metrics (FG%, PPS) for each of the past +20 seasons.
Built with PostgreSQL (pgAdmin) + Power BI.

## Data
Raw CSV is not stored in the repo due to size. A small sample is included under /data_sample.

## Data model
This model supports season filtering (2004 - 2025) using dim_season and aggregated tables for performance

## Repo structure
- /sql: SQL scripts (staging, transformations, aggregations)
- /powerbi: PBIX report
- /docs: setup/import/minor checks screenshots
- /data_sample: small sample dataset for reference

## How to reproduce
1) Load raw data (CSV) into PostgreSQL staging table
2) Run SQL scripts in /sql to build fact + aggregates
3) Open PBIX and refresh
