-- LC 185 - Department Top Three Salaries (H)
-- https://leetcode.com/problems/department-top-three-salaries/
-- Pattern: Top-N per group (DENSE_RANK window function)
-- Dialect: MySQL 8+
-- Bẫy: "top 3 mức lương" chứ không phải "3 người" -> phải DENSE_RANK.
--      ROW_NUMBER cắt mất người đồng lương; RANK nhảy số (1,1,3) nên thiếu mức lương thứ 3.
-- Complexity: sort trong mỗi partition -> O(n log n) time, O(n) space.

WITH ranked AS (
    SELECT e.name, e.salary, e.departmentId,
           DENSE_RANK() OVER (
               PARTITION BY e.departmentId
               ORDER BY e.salary DESC
           ) AS rnk
    FROM Employee e
)
SELECT d.name AS Department,
       r.name AS Employee,
       r.salary AS Salary
FROM ranked r
JOIN Department d ON d.id = r.departmentId
WHERE r.rnk <= 3;
