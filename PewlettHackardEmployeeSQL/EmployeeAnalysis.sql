-- Analysis
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
INNER JOIN salaries s ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM EMPLOYEES
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 

-- 3. List the manager of each department along with their 
-- department number, department name, employee number, last name, and first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name 
FROM dept_manager m
INNER JOIN employees e ON e.emp_no = m.emp_no
INNER JOIN departments d ON d.dept_no = m.dept_no;

-- 4. List the department number for each employee along with that employee’s 
-- employee number, last name, first name, and department name.
SELECT d.dept_no, d.emp_no, e.last_name, e.first_name, n.dept_name
FROM dept_emp d
INNER JOIN employees e ON e.emp_no = d.emp_no
INNER JOIN departments n ON n.dept_no = d.dept_no;

-- 5. List first name, last name, and sex of each employee 
-- whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
INNER JOIN dept_emp ON dept_emp.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'

-- 7. List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
INNER JOIN dept_emp ON dept_emp.emp_no = e.emp_no
INNER JOIN departments d ON d.dept_no = dept_emp.dept_no
WHERE dept_name = 'Sales'
OR dept_name = 'Development'

-- 8. List the frequency counts, in descending order, of all the employee last names 
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY COUNT(*) DESC;