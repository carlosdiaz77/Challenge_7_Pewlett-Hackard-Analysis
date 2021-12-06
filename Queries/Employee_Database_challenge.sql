
-------------------Employee_Database_challenge.sql-----------------


--******************** DELIVERABLE 1 ***************************-----------------
----------------- retirement_titles.csv-----------------------------

SELECT 
	ti.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
  
INTO retirement_titles	
FROM titles as ti            
LEFT JOIN employees as e
ON ti.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no ;

--******************* DELIVERABLE 1 **********************----------
----------------- unique_titles.csv-----------------------------
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no,to_date DESC;


--**************** DELIVERABLE 1 ***************************
--------------- retiring_titles------------------------------

SELECT title, COUNT(first_name) as "total_employees"
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY total_employees desc;

--**************** DELIVERABLE 2********************-------- 
----------------mentorship_eligibilty----------------------

 
SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	ti.title,
	de.from_date,
	de.to_date
INTO mentorship_eligibilty
FROM titles as ti            
INNER JOIN employees as e
ON ti.emp_no = e.emp_no

INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no

WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date > '2021-12-05' )
ORDER BY emp_no ;
----------------------------------------------------------------