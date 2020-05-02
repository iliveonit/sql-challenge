-- 1. List the following details of each employee: 
--    employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e, Salaries s
WHERE e.emp_no = s.emp_no
ORDER by e.emp_no
;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT e.first_name, e.last_name, e.hire_date
FROM Employees e
WHERE e.hire_date between '01/01/1986' and '12/31/1986'
ORDER BY e.hire_date;

select now(); -- date and time
select current_date; -- date
select current_time; -- time

-- 3. List the manager of each department with the following information: 
--    department number, department name, the manager's employee number, last name, first name.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM Titles t, Departments d, Employees e, Dept_Manager dm
WHERE t.Title = 'Manager'
  AND d.dept_no = dm.dept_no
  AND e.emp_no = dm.emp_no 
GROUP BY d.dept_no, d.dept_name, e.emp_no 
ORDER by d.dept_no, d.dept_name, e.emp_no
;


-- 4. List the department of each employee with the following information: 
--    employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments d, Employees e, Dept_Employee de
WHERE d.dept_no = de.dept_no
  AND e.emp_no = de.emp_no 
ORDER by d.dept_name, e.emp_no
;


-- 5. List first name, last name, and sex for employees 
--    whose first name is "Hercules" and last names begin with "B."

SELECT e.first_name, e.last_name, e.sex 
FROM Employees e
WHERE e.first_name = 'Hercules'
  AND e.last_name like 'B%'
ORDER by e.first_name, e.last_name
;

-- 6. List all employees in the Sales department, 
--    including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments d, Employees e, Dept_Employee de
WHERE d.dept_name = 'Sales'
  AND d.dept_no = de.dept_no
  AND e.emp_no = de.emp_no  
ORDER by e.emp_no
;


-- 7. List all employees in the Sales and Development departments, 
--    including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Departments d, Employees e, Dept_Employee de
WHERE d.dept_name in ('Sales', 'Development')
  AND d.dept_no = de.dept_no
  AND e.emp_no = de.emp_no  
ORDER by e.emp_no
;


-- 8. In descending order, list the frequency count of employee last names, 
--    i.e., how many employees share each last name.

SELECT e.last_name, count(*) as "Frequency Count[Last Name]"
FROM Employees e
GROUP BY e.last_name
ORDER by count(*) desc
;

