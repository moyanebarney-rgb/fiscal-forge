from pathlib import Path
import csv
import re
import sqlite3

ROOT = Path(__file__).resolve().parents[1]
DB_PATH = ROOT / "data" / "infrastructure_fiscal.db"
SQL_DIR = ROOT / "sql"
OUTPUT_DIR = ROOT / "outputs" / "reports"
OUTPUT_DIR.mkdir(parents=True, exist_ok=True)

QUERY_RE = re.compile(
    r"-- QUERY:\s*(?P<name>[A-Za-z0-9_]+)\s*\n(?P<sql>.*?)(?=\n-- QUERY:|\Z)",
    re.DOTALL,
)

def load_queries(path):
    text = path.read_text(encoding="utf-8")
    return QUERY_RE.findall(text)

def run():
    if not DB_PATH.exists():
        raise FileNotFoundError("Database not found. Run: python src/create_database.py")

    count = 0
    with sqlite3.connect(DB_PATH) as conn:
        for sql_file in sorted(SQL_DIR.glob("*.sql")):
            for name, sql in load_queries(sql_file):
                rows = conn.execute(sql.strip()).fetchall()
                headers = [col[0] for col in conn.execute(sql.strip()).description]

                output = OUTPUT_DIR / f"{name}.csv"
                with output.open("w", newline="", encoding="utf-8") as f:
                    writer = csv.writer(f)
                    writer.writerow(headers)
                    writer.writerows(rows)

                print(f"✓ {output.relative_to(ROOT)}")
                count += 1

    print(f"\nExported {count} query results.")

if __name__ == "__main__":
    run()
