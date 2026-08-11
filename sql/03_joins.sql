-- QUERY: employees_with_budgets
-- What budget is associated with each employee's department?
SELECT e.name, e.department, e.salary, d.budget
FROM employees e
JOIN departments d ON e.department = d.name
ORDER BY d.budget DESC, e.salary DESC;

-- QUERY: department_budget_analysis
-- How does departmental salary expenditure compare with budget?
SELECT d.name AS department,
       d.budget,
       SUM(e.salary) AS total_salary,
       ROUND(100.0 * SUM(e.salary) / d.budget, 1) AS salary_budget_pct
FROM departments d
JOIN employees e ON e.department = d.name
GROUP BY d.name, d.budget
ORDER BY salary_budget_pct DESC;
