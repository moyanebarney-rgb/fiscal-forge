-- QUERY: dept_vs_overall_avg
-- How do departmental averages compare with the overall average?
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
overall AS (
    SELECT AVG(salary) AS overall_avg
    FROM employees
)
SELECT d.department,
       ROUND(d.avg_salary, 2) AS dept_avg,
       ROUND(o.overall_avg, 2) AS overall_avg,
       ROUND(d.avg_salary - o.overall_avg, 2) AS difference
FROM dept_avg d
CROSS JOIN overall o
ORDER BY difference DESC;

-- QUERY: ranked_departments
-- Rank departments by total salary expenditure.
WITH totals AS (
    SELECT department, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
)
SELECT department,
       total_salary,
       RANK() OVER (ORDER BY total_salary DESC) AS expenditure_rank
FROM totals
ORDER BY expenditure_rank;
