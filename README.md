# Olist E-Commerce Data Pipeline & SQL Analysis


SQL analysis of 100k+ orders from the Olist Brazilian E-Commerce dataset, using a Python-built SQLite pipeline to answer business questions on revenue, delivery, growth, and customer value.


## Pipeline


- `build_db.py` → loads raw CSVs into a local SQLite database (olist.db), one table per file
- `queries.sql` → 4 analytical queries (joins, aggregation, date math, HAVING filters)
- `test_query.py` → runs queries via pandas for quick output checks

  
## Key Findings


- **Top revenue categories** → beleza_saude (health & beauty) leads with R$1.23M, followed closely by relogios_presentes (watches & gifts) at R$1.17M and cama_mesa_banho (bed/bath/table) at R$1.02M. Top 5 categories are all within a tight range, no single category dominates.

- **Delivery bottlenecks** → Northern states have the slowest delivery: Roraima (RR) averages 29.4 days, Amapá (AP) 27.2 days, and Amazonas (AM) 26.4 days - roughly 2x slower than the national average, pointing to a logistics gap in remote regions.

- **Order volume trend** → 2016 shows negligible activity (likely incomplete early records). Real growth begins Jan 2017 (750 orders) and climbs steadily to a peak of 7,289 in Nov 2017, then holds in the 6,000-7,300/month range through Aug 2018 - sustained demand growth, not a seasonal blip.

- **High-value customers** → Top spender placed a single order worth R$13,664; several others cross R$6,900-7,600 in total spend, mostly from 1-2 orders - indicating a small but high-value customer segment worth targeted retention.


## Tech Stack

- Python 
- SQLite 
- SQL 
- Pandas


## Project Structure

```bash
├── data/                → Raw CSVs   
├── build_db.py          → DB ingestion script  
├── queries.sql          → Analytical queries 
├── test_query.py        → Query runner  
├── LICENSE              → MIT license  
└── README.md            → Project documentation 
```
