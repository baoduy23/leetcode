-- LC 180 - Consecutive Numbers (M)
-- https://leetcode.com/problems/consecutive-numbers/
-- Pattern: LAG/LEAD so với dòng trước và dòng sau
-- Dialect: MySQL 8+
-- Bẫy: số xuất hiện >= 4 lần liền ra nhiều dòng thỏa -> cần DISTINCT.
--      Dòng đầu/cuối có LAG/LEAD = NULL -> so sánh ra UNKNOWN, tự bị loại.
-- TODO (debug): OVER () chưa có ORDER BY -> thứ tự "dòng trước/sau" không được đảm bảo.
--      "Liên tiếp" theo cột nào? Sửa cả 2 chỗ OVER ().
-- Complexity: O(n log n) sort (gần O(n) nếu sort theo PK), O(n) space.

WITH
    T AS (
        SELECT
            *,
            LAG(num) OVER () AS a,
            LEAD(num) OVER () AS b
        FROM Logs
    )
SELECT DISTINCT num AS ConsecutiveNums
FROM T
WHERE a = num AND b = num;
