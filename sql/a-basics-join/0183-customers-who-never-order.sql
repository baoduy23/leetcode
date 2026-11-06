-- LC 183 - Customers Who Never Order (E)
-- https://leetcode.com/problems/customers-who-never-order/
-- Pattern: Anti-join (NOT IN / NOT EXISTS / LEFT JOIN ... IS NULL)
-- Dialect: MySQL
-- Bẫy: NOT IN + subquery có NULL -> id <> NULL = UNKNOWN -> trả về rỗng.
--      Đề này customerId không NULL nên pass, nhưng thực tế nên dùng NOT EXISTS.
-- Complexity: có index customerId -> O(n log m); không index -> O(n*m).
-- TODO: viết thêm bản NOT EXISTS và LEFT JOIN ... IS NULL.

SELECT name AS Customers
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders
);
