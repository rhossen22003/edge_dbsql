**1. (3 marks) Write an SQL statement to create the Departments table:**


CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) DEFAULT 'Dhaka'
);

**2. (3 marks) Insert a record into Departments:**


INSERT INTO Departments (dept_id, dept_name, location)
VALUES (101, 'IT', 'Chattogram');


**3. (3 marks) Retrieve all employees who earn more than 50,000:**


SELECT emp_name
FROM Employees
WHERE salary > 50000;


**4. (3 marks) Display all distinct job designations from Employees:**


SELECT DISTINCT designation
FROM Employees;


**5. (3 marks) Delete all employees working in department 103:**


DELETE FROM Employees
WHERE dept_id = 103;




SELECT E.emp_name, D.dept_name, D.location
FROM Employees E
JOIN Departments D ON E.dept_id = D.dept_id;
```

SELECT E.emp_name
FROM Employees E
LEFT JOIN Assignments A ON E.emp_id = A.emp_id
WHERE A.proj_id IS NULL;



**8. (4 marks) Find the average salary of employees in each department. Show only departments with an average salary greater than 60,000:**


SELECT D.dept_name, AVG(E.salary) AS avg_salary
FROM Employees E
JOIN Departments D ON E.dept_id = D.dept_id
GROUP BY D.dept_name
HAVING AVG(E.salary) > 60000;





SELECT P.proj_name, SUM(A.hours_worked) AS total_hours
FROM Projects P
JOIN Assignments A ON P.proj_id = A.proj_id
GROUP BY P.proj_name;



SELECT E.emp_name
FROM Employees E
JOIN Departments D ON E.dept_id = D.dept_id
WHERE E.salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = E.dept_id
);

### Part C – Applied Query (5 Marks)

SELECT D.dept_name, COUNT(P.proj_id) AS number_of_projects, SUM(P.budget) AS total_budget
FROM Departments D
JOIN Projects P ON D.dept_id = P.dept_id
GROUP BY D.dept_name
HAVING COUNT(P.proj_id) > 2 AND SUM(P.budget) > 5000000
ORDER BY total_budget DESC;