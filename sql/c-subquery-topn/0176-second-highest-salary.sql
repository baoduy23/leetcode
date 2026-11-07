-- LC 176 - Second Highest Salary (M)
-- https://leetcode.com/problems/second-highest-salary/
-- Pattern: Subquery / Top-N (cách MAX lồng MAX)
-- Dialect: MySQL
-- Bẫy: không có lương thứ 2 (1 dòng, hoặc mọi người cùng lương) -> phải trả NULL, không phải rỗng.
--      MAX() trên tập rỗng tự ra NULL nên cách này an toàn.
--      Lương trùng (100, 100, 90) -> đáp án là 90, dùng < để bỏ hết các dòng bằng max.
-- Complexity: 2 lần quét O(n) (có index trên salary thì ~O(log n)).
-- TODO: viết thêm bản LIMIT 1 OFFSET 1 (nhớ DISTINCT + bọc subquery để ra NULL)
--       và bản DENSE_RANK() -> tổng quát cho bài 177 (Nth Highest).

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
