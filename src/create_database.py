from pathlib import Path
import sqlite3

ROOT = Path(__file__).resolve().parents[1]
DB_PATH = ROOT / "data" / "infrastructure_fiscal.db"
DB_PATH.parent.mkdir(parents=True, exist_ok=True)

employees = [
    (1, "Alice", "Engineering", 78000),
    (2, "Charlie", "Engineering", 92000),
    (3, "Diana", "Engineering", 85000),
    (4, "Ethan", "Engineering", 71000),
    (5, "Bob", "Marketing", 62000),
    (6, "Fiona", "Marketing", 68000),
    (7, "George", "Marketing", 75000),
    (8, "Hannah", "Finance", 88000),
    (9, "Ian", "Finance", 95000),
    (10, "Julia", "Finance", 72000),
    (11, "Kevin", "Operations", 58000),
    (12, "Laura", "Operations", 64000),
]

departments = [
    (1, "Engineering", 650000),
    (2, "Marketing", 320000),
    (3, "Finance", 480000),
    (4, "Operations", 280000),
]

with sqlite3.connect(DB_PATH) as conn:
    conn.executescript("""
    DROP TABLE IF EXISTS employees;
    DROP TABLE IF EXISTS departments;

    CREATE TABLE employees (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        department TEXT NOT NULL,
        salary INTEGER NOT NULL CHECK (salary > 0)
    );

    CREATE TABLE departments (
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL UNIQUE,
        budget INTEGER NOT NULL CHECK (budget > 0)
    );
    """)
    conn.executemany("INSERT INTO employees VALUES (?, ?, ?, ?)", employees)
    conn.executemany("INSERT INTO departments VALUES (?, ?, ?)", departments)

print(f"Database created: {DB_PATH}")
print(f"Employees: {len(employees)} | Departments: {len(departments)}")
