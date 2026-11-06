-- LC 584 - Find Customer Referee (E)
-- https://leetcode.com/problems/find-customer-referee/
-- Pattern: NULL handling (three-valued logic)
-- Dialect: MySQL
-- Bẫy: referee_id != 2 với referee_id NULL -> UNKNOWN -> bị WHERE loại.
--      Phải thêm OR referee_id IS NULL (hoặc COALESCE(referee_id, 0) != 2,
--      hoặc NOT (referee_id <=> 2) - toán tử NULL-safe của MySQL).
-- Complexity: full scan O(n); OR IS NULL thường khiến index kém hiệu quả.

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
