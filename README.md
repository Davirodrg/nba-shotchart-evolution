# nba-shotchart-evolution (2004 - 2025)

Interactive shot chart heatmap for NNBA seasons between 2004 and 2025 with efficiency metrics and context filters (quarter / minutes left).

## Tech
- PostgreSQL (pgAdmin)
- Power BI

## Repo structure
- /sql: database schema + transforms + aggregations
- /powerbi: PBIX report
- /docs: screenshots
- /data_sample: small sample dataset for reference

## How to reproduce
1) Load raw data (CSV) into PostgreSQL staging table
2) Run SQL scripts in /sql to build fact + aggregates
3) Open PBIX and refresh
