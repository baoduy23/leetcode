-- LC 182 - Duplicate Emails (E)
-- https://leetcode.com/problems/duplicate-emails/
-- Pattern: GROUP BY + HAVING / Window Function COUNT() OVER
-- Dialect: MySQL
-- Bẫy: email lặp nhiều lần thì window function trả nhiều dòng -> cần DISTINCT.
-- Complexity: window function phải sort/partition theo email -> O(n log n) time, O(n) space.
-- TODO: viết lại bằng GROUP BY email HAVING COUNT(*) > 1 và so sánh.

WITH emailRanked AS (
    SELECT email AS Email,
           COUNT(*) OVER (PARTITION BY email) AS so_lan_lap
    FROM Person
)
SELECT DISTINCT Email
FROM emailRanked
WHERE so_lan_lap > 1;
