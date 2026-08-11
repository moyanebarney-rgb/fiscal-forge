# FiscalForge

## SQL & Python Fiscal Analysis

## A SQL & Python Portfolio Case Study

> **Data → Analysis → Insight → Engineering Decision**

### Overview

This portfolio project uses a small simulated departmental workforce dataset to demonstrate how SQL and Python can turn structured financial data into decision-oriented analysis.

The project is deliberately framed around **fiscal analysis and infrastructure economics** rather than SQL syntax alone. The analytical workflow moves from data exploration to departmental cost analysis, comparative analysis, workforce ranking and outlier detection.

> **Important:** The dataset is simulated for educational and portfolio purposes. It is not a representation of actual South African government expenditure.

### Problem Statement

A decision-maker needs to understand where personnel expenditure is concentrated, how departments differ, and whether individual salaries appear unusual relative to their departmental peers.

**Core questions**
1. Which departments are the largest salary cost centres?
2. Which departments have the highest average compensation?
3. Which employees earn above their departmental average?
4. How do departmental averages compare with the organisation-wide average?
5. Are there material salary outliers?
6. What do these patterns imply for workforce and fiscal planning?

### Dataset

| Department | Employees | Total Salary | Budget | Salary / Budget |
|---|---:|---:|---:|---:|
| Engineering | 4 | R326,000 | R650,000 | 50.2% |
| Finance | 3 | R255,000 | R480,000 | 53.1% |
| Marketing | 3 | R205,000 | R320,000 | 64.1% |
| Operations | 2 | R122,000 | R280,000 | 43.6% |

**Schema**

- `employees(id, name, department, salary)`
- `departments(id, name, budget)`

### Analytical Architecture

```text
SQLite data
    ↓
SQL analysis
    ↓
CSV evidence
    ↓
Python visualisation
    ↓
Fiscal interpretation
    ↓
Engineering decision lens
```

### SQL Coverage

| Phase | Technique | Decision question |
|---|---|---|
| 1 | WHERE / MIN / MAX / AVG | What does the workforce dataset look like? |
| 2 | GROUP BY / SUM / COUNT / HAVING | Where is salary expenditure concentrated? |
| 3 | JOIN | How does salary expenditure relate to departmental budgets? |
| 4 | CTEs | How do departments compare with the organisation-wide average? |
| 5 | Correlated subqueries | Who earns above their departmental benchmark? |
| 6 | Window functions | How are employees ranked within departments? |
| 7 | Outlier analysis / CASE | Which observations deserve further investigation? |

### Key Findings

Using the simulated dataset:

- **Engineering is the largest salary cost centre**, at R326,000, representing approximately 35.9% of total salary expenditure.
- **Finance has the highest average salary**, at R85,000.
- **Marketing has the highest salary-to-budget ratio**, at approximately 64.1%.
- **No employee exceeds 120% of their departmental average**, so the defined extreme-outlier rule does not flag any employee.
- The absence of statistical outliers should **not** be interpreted as proof of efficiency. A salary dataset alone cannot measure productivity, service quality, workload, vacancy levels or infrastructure outcomes.

### Engineering & Fiscal Interpretation

| Observation | Engineering lens | Fiscal lens |
|---|---|---|
| Engineering has the largest salary bill | Workforce capacity may support technical delivery | Personnel costs should be assessed against infrastructure outputs |
| Finance has the highest average salary | Specialist financial capability may carry a premium | Higher compensation should be evaluated against capability and control outcomes |
| Marketing has the highest salary/budget ratio | Small teams can still consume significant budget capacity | Budget allocation should be assessed alongside measurable outputs |
| No >20% salary outliers | No extreme individual observation under this rule | Further analysis should examine workload, grades and performance before conclusions |

### Limitations

This is a **simulated, intentionally small dataset**. It cannot establish real-world public-sector inefficiency, overstaffing, underinvestment or performance.

A production-grade fiscal analysis should add variables such as:

- employee grade and tenure
- vacancy rates
- overtime and benefits
- procurement and maintenance expenditure
- departmental outputs
- service-delivery indicators
- project completion and cost variance
- historical budget and actual expenditure
- geographic and infrastructure asset data

### Reproducibility

Requires Python 3.10+.

```bash
pip install -r requirements.txt
python src/create_database.py
python src/run_queries.py
python src/visualise.py
```

Results are written to `outputs/reports/` and charts to `outputs/charts/`.

### Repository Structure

```text
infrastructure-fiscal-analysis/
├── README.md
├── requirements.txt
├── .gitignore
├── data/
│   └── infrastructure_fiscal.db        # generated locally
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_aggregations.sql
│   ├── 03_joins.sql
│   ├── 04_ctes.sql
│   ├── 05_subqueries.sql
│   ├── 06_window_functions.sql
│   └── 07_outlier_analysis.sql
├── src/
│   ├── create_database.py
│   ├── run_queries.py
│   └── visualise.py
└── outputs/
    ├── charts/
    └── reports/
```

### Author

**Samkele Barney Moyane**  
Aspiring Fiscal Technocrat | Infrastructure Economics | Data Analysis

### License

Educational and portfolio purposes.
