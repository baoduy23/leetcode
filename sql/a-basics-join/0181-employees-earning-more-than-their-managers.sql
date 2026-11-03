-- LC 181 - Employees Earning More Than Their Managers (E)
-- https://leetcode.com/problems/employees-earning-more-than-their-managers/
-- Pattern: Self-join (employee -> manager)
-- Dialect: MySQL
-- Bẫy: managerId NULL (không có sếp) bị INNER JOIN loại luôn, đúng ý đề.
-- Complexity: self-join theo m.id (primary key) -> hash/index lookup ~O(n);
--             không có index thì nested loop O(n^2).

SELECT e.name AS Employee
FROM Employee e
JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;
