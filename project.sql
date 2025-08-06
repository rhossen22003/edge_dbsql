
###  SQL File Content (save as `project_34_37_solution.sql):


-- Part A – Advanced SQL (10 Marks)

-- 11. Create a view named TopStudents
CREATE VIEW TopStudents AS
SELECT 
    s.student_id, 
    s.name, 
    AVG(e.grade) AS average_grade
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
GROUP BY 
    s.student_id, s.name
HAVING 
    AVG(e.grade) > 3.5;


-- 12. Stored Procedure to increase grades by 0.5 (max 4.0)
DELIMITER //

CREATE PROCEDURE IncreaseGrade(IN p_course_id INT)
BEGIN
    UPDATE Enrollments
    SET grade = CASE 
                    WHEN grade + 0.5 > 4.0 THEN 4.0
                    ELSE grade + 0.5 
                END
    WHERE course_id = p_course_id;
END //

DELIMITER ;


-- 13. Correlated Subquery for students with highest grade in any course
SELECT 
    s.student_id,
    s.name,
    e.course_id,
    e.grade
FROM 
    Students s
JOIN 
    Enrollments e ON s.student_id = e.student_id
WHERE 
    e.grade = (
        SELECT MAX(e2.grade)
        FROM Enrollments e2
        WHERE e2.course_id = e.course_id
    );

-- Part B – Applied Scenario (15 Marks)

-- Single SQL query to generate the report
SELECT 
    d.department_name,
    COUNT(DISTINCT s.student_id) AS total_students,
    AVG(e.grade) AS average_grade,
    COUNT(DISTINCT c.course_id) AS number_of_courses
FROM 
    Departments d
JOIN 
    Courses c ON d.department_id = c.department_id
JOIN 
    Enrollments e ON c.course_id = e.course_id
JOIN 
    Students s ON e.student_id = s.student_id AND s.department_id = d.department_id
GROUP BY 
    d.department_id, d.department_name
HAVING 
    COUNT(DISTINCT c.course_id) >= 2
ORDER BY 
    average_grade DESC;
