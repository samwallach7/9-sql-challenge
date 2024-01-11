-- Question 1
-- List the employee number, last name, first name, sex, and salary of each employee

CREATE VIEW da_q1 AS
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM Employees as e
	JOIN Salaries as s
	ON (e.emp_no = s.emp_no)
ORDER BY e.emp_no;
	
SELECT * FROM da_q1;

DROP VIEW da_q1;

-- Question 2
-- List the first name, last name, and hire date for the employees who were hired in 1986

CREATE VIEW da_q2 AS
SELECT e.first_name, e.last_name, e.hire_date
FROM Employees as e
WHERE e.hire_date LIKE '%1986%'
ORDER BY e.last_name;

SELECT * FROM da_q2;

DROP VIEW da_q2;

-- Question 3
-- List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name

CREATE VIEW da_q3 AS
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM Department_Manager as dm
	JOIN Employees as e
	ON (dm.emp_no = e.emp_no)
	JOIN Departments as d
	ON (dm.dept_no = d.dept_no)
ORDER BY dm.dept_no;
	
SELECT * FROM da_q3;

DROP VIEW da_q3;

--Question 4
-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name

CREATE VIEW da_q4 AS
SELECT de.dept_no, d.dept_name, de.emp_no, e.first_name, e.last_name
FROM Department_Employees as de
	JOIN Employees as e
	ON (de.emp_no = e.emp_no)
	JOIN Departments as d
	ON (de.dept_no = d.dept_no)
ORDER BY de.emp_no;
	
SELECT * FROM da_q4;

DROP VIEW da_q4;

-- Question 5
-- List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B

CREATE VIEW da_q5 AS
SELECT e.first_name, e.last_name, e.sex
FROM Employees as e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%'
ORDER BY e.last_name;

SELECT * FROM da_q5;

DROP VIEW da_q5;

-- Question 6
-- List each employee in the Sales department, including their employee number, last name and first name

CREATE VIEW da_q6 AS
SELECT de.dept_no, d.dept_name, de.emp_no, e.first_name, e.last_name
FROM Department_Employees as de
	JOIN Employees as e
	ON (de.emp_no = e.emp_no)
	JOIN Departments as d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no;

SELECT * FROM da_q6;

DROP VIEW da_q6;

-- Question 7
-- List each employee in the Sales and Development departments, including their employee number, 
-- last name and first name

CREATE VIEW da_q7 AS
SELECT de.dept_no, d.dept_name, de.emp_no, e.first_name, e.last_name
FROM Department_Employees as de
	JOIN Employees as e
	ON (de.emp_no = e.emp_no)
	JOIN Departments as d
	ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY de.emp_no;

SELECT * FROM da_q7;

DROP VIEW da_q7;

-- Question 8
-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name)

CREATE VIEW da_q8 AS
SELECT e.last_name, COUNT(e.last_name) AS "last_name_count"
FROM Employees AS e
GROUP BY e.last_name
ORDER BY "last_name_count" DESC;

SELECT * FROM da_q8;

DROP VIEW da_q8;