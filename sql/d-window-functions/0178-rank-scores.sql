-- LC 178 - Rank Scores (M)
-- https://leetcode.com/problems/rank-scores/
-- Pattern: Window Function (DENSE_RANK)
-- Dialect: MySQL 8+
-- Bẫy: rank không được nhảy số khi trùng điểm (1,1,2 chứ không 1,1,3) -> DENSE_RANK, không phải RANK.
--      `rank` là từ khoá trong MySQL 8 -> phải bọc backtick.
-- Complexity: sort theo score -> O(n log n) time, O(n) space.

WITH ranked AS (
    SELECT score,
           DENSE_RANK() OVER (ORDER BY score DESC) AS `rank`
    FROM Scores
)
SELECT score, `rank`
FROM ranked
ORDER BY score DESC;
