-- QUERY: above_dept_avg
-- Which employees earn above their departmental average?
SELECT e1.name,
       e1.department,
       e1.salary,
       ROUND((
           SELECT AVG(e2.salary)
           FROM employees e2
           WHERE e2.department = e1.department
       ), 2) AS dept_avg
FROM employees e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e1.department
)
ORDER BY e1.department, e1.salary DESC;

-- QUERY: high_earners
-- Which employees earn more than R70,000?
SELECT name, department, salary
FROM employees
WHERE salary > 70000
ORDER BY salary DESC;
