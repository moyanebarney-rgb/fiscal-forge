-- QUERY: engineering_team
-- Which employees are in Engineering?
SELECT name, department, salary
FROM employees
WHERE department = 'Engineering'
ORDER BY salary DESC;

-- QUERY: salary_range
-- What is the overall salary range?
SELECT MIN(salary) AS min_salary,
       MAX(salary) AS max_salary,
       ROUND(AVG(salary), 2) AS avg_salary
FROM employees;
