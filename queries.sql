--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salary.salary 
FROM employees
JOIN salaries as salary
	ON employees.emp_no = salary.emp_no;

--2. List employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date  
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date < '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT d.dept_no AS "Department Number", d.dept_name AS "Department Name",dm.emp_no AS "Employee Number",
	e.first_name AS "First Name", e.last_name AS "Last Name", 
	dm.from_date AS "Start Date", dm.to_date AS "End Date"
FROM dept_manager dm
INNER JOIN employees e ON dm.emp_no=e.emp_no 
INNER JOIN departments d on dm.dept_no=d.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no=de.emp_no
JOIN departments d ON de.dept_no=d.dept_no
ORDER BY e.emp_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
	WHERE first_name = 'Hercules'
	AND
	last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd007'

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
INNER JOIN employees e ON de.emp_no = e.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005'
ORDER BY emp_no

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name AS "Last Name", COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC