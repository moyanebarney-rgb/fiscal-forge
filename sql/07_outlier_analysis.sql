-- QUERY: salary_outliers
-- Flag employees earning more than 20% above their departmental average.
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT e.name,
       e.department,
       e.salary,
       ROUND(d.avg_salary, 2) AS dept_avg,
       ROUND(e.salary - d.avg_salary, 2) AS difference,
       ROUND(100.0 * (e.salary - d.avg_salary) / d.avg_salary, 1) AS pct_above_avg
FROM employees e
JOIN dept_avg d ON e.department = d.department
WHERE e.salary > d.avg_salary * 1.2
ORDER BY pct_above_avg DESC;

-- QUERY: salary_distribution
-- Summarise salary dispersion by department.
SELECT department,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary,
       ROUND(AVG(salary), 0) AS avg_salary,
       MAX(salary) - MIN(salary) AS salary_range
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- QUERY: conditional_aggregation
-- Compare the proportion of high and low earners by department.
SELECT department,
       COUNT(*) AS employee_count,
       SUM(CASE WHEN salary >= 80000 THEN 1 ELSE 0 END) AS high_earners,
       SUM(CASE WHEN salary < 70000 THEN 1 ELSE 0 END) AS lower_earners,
       ROUND(100.0 * SUM(CASE WHEN salary >= 80000 THEN 1 ELSE 0 END) / COUNT(*), 1) AS pct_high_earners
FROM employees
GROUP BY department
ORDER BY pct_high_earners DESC;
