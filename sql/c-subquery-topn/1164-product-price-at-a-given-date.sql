-- LC 1164 - Product Price at a Given Date (M)
-- https://leetcode.com/problems/product-price-at-a-given-date/
-- Pattern: Point-in-time lookup (latest value as of T) - logic của SCD Type 2
-- Dialect: MySQL
-- Bẫy: sản phẩm chỉ có thay đổi SAU ngày 2019-08-16 -> vẫn phải xuất hiện với giá mặc định 10.
--      2 nhánh không giao nhau -> UNION ALL đủ, UNION tốn thêm bước khử trùng.
-- Complexity: 2 lần GROUP BY + tuple IN -> ~O(n log n).
-- TODO: viết lại bằng LEFT JOIN từ danh sách product + COALESCE(price, 10).

SELECT product_id, new_price AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date)
    FROM Products
    WHERE change_date <= '2019-08-16'
    GROUP BY product_id
)
UNION
SELECT product_id, 10 AS price
FROM Products
GROUP BY product_id
HAVING MIN(change_date) > '2019-08-16';
