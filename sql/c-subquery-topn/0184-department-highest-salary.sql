-- LC 184 - Department Highest Salary (M)
-- https://leetcode.com/problems/department-highest-salary/
-- Pattern: Top-1 per group (tuple IN + GROUP BY MAX)
-- Dialect: MySQL
-- Bẫy: tie (2 người cùng lương max trong 1 phòng) -> phải trả cả 2.
--      Cách (departmentId, salary) IN (...) giữ được tie; LIMIT 1 hay ORDER BY thì mất.
-- Complexity: GROUP BY O(n) (hash) / O(n log n) (sort) + join Department qua PK.
-- TODO: viết lại bằng DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC),
--       nền cho bài 185 (Top 3).

SELECT d.name AS Department,
       e.name AS Employee,
       e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
    SELECT departmentId, MAX(salary)
    FROM Employee
    GROUP BY departmentId
);
