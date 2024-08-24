-- Drop tables if needed
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;


-- Table for titles.csv
CREATE TABLE titles(
	title_id CHAR(5) PRIMARY KEY,
	title VARCHAR NOT NULL
);
SELECT *
FROM titles;

-- Table for employees.csv
CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY,
	emp_title CHAR(5),
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex CHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id)
);
SELECT *
FROM employees;

-- Table for salaries.csv
CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
SELECT *
FROM salaries;

-- Table for departments.csv
CREATE TABLE departments(
	dept_no CHAR(4) PRIMARY KEY,
	dept_name VARCHAR NOT NULL
);
SELECT *
FROM departments;

-- Table for dept_manager.csv
CREATE TABLE dept_manager(
	dept_no CHAR(4),
	emp_no INTEGER,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
SELECT *
FROM dept_manager;

-- Table for dept_emp.csv
CREATE TABLE dept_emp(
	emp_no INTEGER,
	dept_no CHAR(4),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
SELECT *
FROM dept_emp;

