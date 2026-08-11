-- QUERY: ranked_employees
-- Rank employees within each department.
SELECT name,
       department,
       salary,
       ROW_NUMBER() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS rank_in_dept
FROM employees
ORDER BY department, rank_in_dept;

-- QUERY: salary_comparison
-- Compare each employee with the next lower salary in their department.
SELECT name,
       department,
       salary,
       LAG(salary) OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS previous_higher,
       LEAD(salary) OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS next_lower
FROM employees
ORDER BY department, salary DESC;

-- QUERY: rank_comparison
-- Compare RANK and DENSE_RANK behaviour.
SELECT name,
       department,
       salary,
       RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS rank,
       DENSE_RANK() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS dense_rank
FROM employees
ORDER BY department, salary DESC;
