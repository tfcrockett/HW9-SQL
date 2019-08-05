-- Drop Tables if Existing
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_employees;
DROP TABLE IF EXISTS dept_managers;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/amWXcb
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "departments" (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_managers" (
    "dept_no" varchar(20),
    "emp_no" int,
    "from_date" varchar(30),
    "to_date" varchar(30)  
);

CREATE TABLE "dept_employees" (
    "emp_no" int,
    "dep_no" varchar(30),
    "from_date" varchar(30),
    "to_date" varchar(30) 
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" varchar(20)   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "gender" varchar(5)   NOT NULL,
    "hire_date" varchar(20)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "from_date" varchar(20)   NOT NULL,
    "to_date" varchar(20)   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "from_date" varchar(20)   NOT NULL,
    "to_date" varchar(20)   NOT NULL
);

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_employees" ADD CONSTRAINT "fk_dept_employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_employees" ADD CONSTRAINT "fk_dept_employees_dep_no" FOREIGN KEY("dep_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

SELECT *
FROM departments

--List the following details of each employee: employee number, last name, first name, gender, and salary

SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
JOIN salaries as s
ON e.emp_no = s.emp_no

--2. List employees who were hired in 1986.

SELECT *
from employees
WHERE hire_date LIKE '1986%'

--3. List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date
FROM dept_managers as dm
JOIN departments as d
ON dm.dept_no = d.dept_no
JOIN employees as e
ON dm.emp_no=e.emp_no

--5.List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dep_no = d.dept_no

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dep_no = d.dept_no
WHERE d.dept_name = 'Sales'

SELECT * 
FROM departments

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name,
--and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_employees AS de ON e.emp_no = de.emp_no
JOIN departments as d ON de.dep_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, Count(last_name) as "frequency"
FROM employees
GROUP BY last_name
ORDER BY "frequency" DESC

