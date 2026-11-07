-- LC 577 - Employee Bonus (E)
-- https://leetcode.com/problems/employee-bonus/
-- Pattern: LEFT JOIN + NULL handling
-- Dialect: MySQL
-- Bẫy: nhân viên không có bonus -> b.bonus NULL -> NULL < 1000 = UNKNOWN -> bị loại,
--      nên phải có OR b.bonus IS NULL.
--      Đặt điều kiện ở WHERE (lọc sau join) khác với ở ON (lọc trước khi ghép).
-- Complexity: join qua empId (có index) ~O(n log m); hash join O(n + m).

SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
