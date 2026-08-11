-- QUERY: department_salary_totals
-- Which department has the highest total salary?
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

-- QUERY: department_stats
-- What are the core departmental statistics?
SELECT department,
       COUNT(*) AS employee_count,
       ROUND(AVG(salary), 2) AS avg_salary,
       SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

-- QUERY: high_avg_departments
-- Which departments have an average salary above R70,000?
SELECT department,
       COUNT(*) AS employee_count,
       ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 70000
ORDER BY avg_salary DESC;
