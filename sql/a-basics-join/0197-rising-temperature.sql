-- LC 197 - Rising Temperature (E)
-- https://leetcode.com/problems/rising-temperature/
-- Pattern: Self-join theo ngày (date arithmetic)
-- Dialect: MySQL
-- Bẫy: ngày có thể bị thiếu -> so với "ngày hôm qua" chứ không phải "dòng trước".
--      LAG() OVER (ORDER BY recordDate) sẽ sai khi có ngày bị nhảy.
--      Không so id - 1 vì id không đảm bảo theo thứ tự ngày.
-- Complexity: có index recordDate -> O(n log n); không index -> O(n^2) (hash join -> O(n)).

SELECT w2.id
FROM Weather w2
JOIN Weather w1
  ON w1.recordDate = DATE_SUB(w2.recordDate, INTERVAL 1 DAY)
WHERE w2.temperature > w1.temperature;
