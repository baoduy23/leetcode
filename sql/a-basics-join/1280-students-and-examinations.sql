-- LC 1280 - Students and Examinations (E)
-- https://leetcode.com/problems/students-and-examinations/
-- Pattern: CROSS JOIN dựng "khung" đầy đủ + LEFT JOIN đếm
-- Dialect: MySQL
-- Bẫy: COUNT(*) đếm cả dòng NULL của LEFT JOIN -> ra 1 thay vì 0.
--      Phải COUNT(một cột bên phải) như e.subject_name.
--      Điều kiện subject phải nằm trong ON, để ở WHERE là biến LEFT JOIN thành INNER.
-- Complexity: khung S x J dòng; join + group by ~O(S*J + E) (hash) hoặc thêm log nếu sort.

SELECT s.student_id,
       s.student_name,
       sj.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sj
LEFT JOIN Examinations e
       ON s.student_id = e.student_id
      AND sj.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sj.subject_name
ORDER BY s.student_id, sj.subject_name;
