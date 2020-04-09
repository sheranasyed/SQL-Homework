--1. List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT e.emp_no as "Employee No.", e.last_name as "Last Name", e.first_name as "First Name", e.gender as "Gender", s.salary as "Salary"
FROM employees as e
INNER JOIN salaries as s ON s.emp_no = e.emp_no;

--2. List employees who were hired in 1986

SELECT first_name as "First Name", last_name as "Last Name", hire_date as "Hire Date"
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates

SELECT d.dept_no as "Department No.", d.dept_name as "Department Name", dm.emp_no as "Empoyee No.", e.last_name as "Last Name", e.first_name as "First Name", dm.from_date as "From Date", dm.to_date as "To Date"
FROM departments as d
JOIN dept_manager as dm
ON d.dept_no = dm.dept_no
JOIN employees as e
ON dm.emp_no = e.emp_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name

SELECT de.emp_no as "Employee No.", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
FROM dept_emp as de
JOIN employees as e
ON de.emp_no = e.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no;

--5. List all employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name as "First Name", last_name as "Last Name"
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name

SELECT de.emp_no as "Employee No.", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
FROM dept_emp as de
JOIN employees as e
ON de.emp_no = e.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name

SELECT de.emp_no as "Employee No.", e.last_name as "Last Name", e.first_name as "First Name", d.dept_name as "Department Name"
FROM dept_emp as de
JOIN employees as e
ON de.emp_no = e.emp_no
JOIN departments as d
ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' 
OR d.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name

SELECT last_name as "Last Name",
COUNT(last_name) AS "Frequency" 
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;