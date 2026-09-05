import sqlite3, os, pandas as pd

conn = sqlite3.connect("olist.db")

# Ingest all CSVs from the ./data folder into SQLite with cleaned table names
for file in os.listdir("./data"):
    if file.endswith(".csv"):
        name = file.replace("olist_", "").replace("_dataset", "").replace(".csv", "")
        print(f"Loading {file} into table '{name}'...")
        pd.read_csv(f"./data/{file}").to_sql(name, conn, if_exists="replace", index=False)

conn.close()
print("olist.db ready!")