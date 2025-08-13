### 1. **List all employees with a salary greater than 50,000.**


SELECT emp_name
FROM Employees
WHERE salary > 50000;


### 2. **Display the emp\_name and proj\_name of employees who have worked on projects, using a JOIN.**


SELECT E.emp_name, P.proj_name
FROM Employees E
JOIN Assignments A ON E.emp_id = A.emp_id
JOIN Projects P ON A.proj_id = P.proj_id;


### 3. **Find the total number of projects handled by each department.**


SELECT D.dept_name, COUNT(DISTINCT P.proj_id) AS total_projects
FROM Departments D
JOIN Projects P ON D.dept_id = P.dept_id
GROUP BY D.dept_name;


### 4. **Show all employees who are not assigned to any project.**


SELECT emp_name
FROM Employees E
LEFT JOIN Assignments A ON E.emp_id = A.emp_id
WHERE A.proj_id IS NULL;



