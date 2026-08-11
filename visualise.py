from pathlib import Path
import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

ROOT = Path(__file__).resolve().parents[1]
DB_PATH = ROOT / "data" / "infrastructure_fiscal.db"
CHART_DIR = ROOT / "outputs" / "charts"
CHART_DIR.mkdir(parents=True, exist_ok=True)

def salary_by_department():
    with sqlite3.connect(DB_PATH) as conn:
        df = pd.read_sql_query(
            "SELECT department, AVG(salary) AS avg_salary "
            "FROM employees GROUP BY department ORDER BY avg_salary DESC",
            conn,
        )

    fig, ax = plt.subplots(figsize=(9, 5.5))
    bars = ax.bar(df["department"], df["avg_salary"])
    ax.bar_label(bars, labels=[f"R{x:,.0f}" for x in df["avg_salary"]], padding=4)
    ax.set_title("Average Salary by Department")
    ax.set_xlabel("Department")
    ax.set_ylabel("Average salary (ZAR)")
    ax.spines[["top", "right"]].set_visible(False)
    fig.tight_layout()
    fig.savefig(CHART_DIR / "salary_by_department.png", dpi=180, bbox_inches="tight")
    plt.close(fig)

def salary_distribution():
    with sqlite3.connect(DB_PATH) as conn:
        df = pd.read_sql_query(
            "SELECT department, salary FROM employees ORDER BY department",
            conn,
        )

    fig, ax = plt.subplots(figsize=(9, 5.5))
    groups = [group["salary"].values for _, group in df.groupby("department")]
    labels = [name for name, _ in df.groupby("department")]
    ax.boxplot(groups, tick_labels=labels)
    ax.set_title("Salary Distribution by Department")
    ax.set_xlabel("Department")
    ax.set_ylabel("Salary (ZAR)")
    ax.spines[["top", "right"]].set_visible(False)
    fig.tight_layout()
    fig.savefig(CHART_DIR / "salary_distribution.png", dpi=180, bbox_inches="tight")
    plt.close(fig)

if __name__ == "__main__":
    salary_by_department()
    salary_distribution()
    print(f"Charts saved to {CHART_DIR}")
