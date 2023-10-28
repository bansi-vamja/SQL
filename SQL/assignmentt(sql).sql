use assignment;
/* page 1 (12)*/

/*Q1---Display all information in the tables EMP and DEPT. */
 select * from departments;
 select * from employees;

-- q-2. Display only the hire date and employee name for each employee. --  
select hire_date,first_name from employees;

/* q-3 3. Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title */

select first_name,job_id , concat(first_name,'  ',job_id) as employee_title from employees;  

-- q4 4. Display the hire date, name and department number for all clerks.--

select hire_date,first_name,department_id from employees;

/*  q-5 . Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT */

select first_name,last_name ,email,phone_number, hire_date,job_id,salary,commission_pct,manager_id, department_id , 
concat(first_name,'  ',last_name,' ',email,' ',phone_number,' ', hire_date,' ' ,
job_id,' ',salary,' ' ,commission_pct, ' ',manager_id,' ', department_id)
as the_output from employees;

-- q-6  6. Display the names and salaries of all employees with a salary greater than 2000.  --

select first_name ,salary from employees where salary >2000; 

/* q7  Display the names and dates of employees with the column headers "Name" and "Start 
Date */

select first_name  as 'Name' , hire_date as 'start date' from employees;

-- q8   Display the names and hire dates of all employees in the order they were hired. --

select first_name,hire_date from employees order by hire_date asc;  

-- q9  Display the names and salaries of all employees in reverse salary order.-- 

select first_name ,salary from employees order by salary desc;  

/* q10  . Display 'ename" and "deptno" who are all earned commission and display salary in 
reverse order. */

select first_name,department_id ,salary from employees where commission_pct is not null  order by salary  desc;
select * from employees;

-- q11 . Display the last name and job title of all employees who do not have a manager-- 

select last_name ,job_id from employees where manager_id is null;

/*q12  Display the last name, job, and salary for all employees whose job is sales representative 
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000*/

select last_name,job_id,salary from employees where job_id in('sa_rep','st_clerk') and salary not in(2500,3500,5000);


/* page =2 (14) */

/*Q1---1) Display the maximum, minimum and average salary and commission earned.*/

select min(salary) ,max(salary),avg(salary),
 min(commission_pct) ,max(commission_pct),avg(commission_pct) from  employees;

/*Q2---Display the department number, total salary payout and total commission payout for 
each department. */

select department_id ,sum(salary),sum(commission_pct)
from employees
group by department_id;

/*Q3---Display the department number and number of employees in each department.*/

select department_id,count(*) as no_of_emoloyees from employees group by(department_id);
select * from employees;

 /*q4 display the department num and total salary of employees in each department*/
 
 select department_id ,sum(salary)as total_salary  from employees group by(department_id) ;
 
 /*q5 display the employees name who doesnt earn commi order the result set without using the column name*/
 
 select first_name, commission_pct from employees where commission_pct is null order by rand();

/* 6) (*)Display the employees name, department id and commission.If an Employee doesn't 
earn the commission, then display as 'No commission'. Name the columns appropriately */

select
first_name,department_id,
 COALESCE(commission_pct,'no_commission') as commission 
FROM employees;
 

 /*7) Display the employee's name, salary and commission multiplied by 2. If an Employee 
doesn't earn the commission, then display as 'No commission. Name the columns 
appropriately */

SELECT first_name, salary,
CASE
    WHEN commission_pct > 0 THEN commission_pct * 2
    ELSE 'No Commission'
END as COMMISSION_EARN
 FROM employees;

/*8) Display the employee's name, department id who have the first name same as another 
employee in the same department */

select first_name,department_id
FROM employees 
where (first_name,department_id)
in(select first_name,department_id from employees 
group by first_name,department_id having count(*)>1);
   
   
   /* que 9= Display the sum of salaries of the employees working under each Manager */

select manager_id ,sum(salary) from employees group by (manager_id);

/* que 10= Select the Managers name, the count of employees working under and the department 
ID of the manager. */

select department_id ,count(employee_id) from employees group by(department_id);
select * from employees;

/* que 11= Select the employee name, department id, and the salary. Group the result with the 
manager name and the employee last name should have second letter 'a! */

select  first_name,department_id,salary ,last_name,manager_id as manager_name from employees 
 where last_name like '_a%' ;
 
 /* que 12=Display the average of sum of the salaries and group the result with the department id. 
Order the result with the department id.*/

select  sum(salary)as salary_amount,
avg(salary) as avg_salary,
department_id from employees group by(department_id)
 order by department_id  asc;
 select * from employees;
 
/*  que 13=Select the maximum salary of each department along with the department id */

select max(salary) as max_salary,department_id from employees group by(department_id);

/* que 14=Display the commission, if not null display 10% of salary, if null display a default value 1*/

select commission_pct,salary,
case
    WHEN commission_pct > 0 THEN (salary*10)/100 
    ELSE '1'
END as commission_
 from employees;
 

  /* page=4(10) */

 /* Q1--1. Write a query to display the last name, department number, department name for all 
employees. */

select e.last_name,e.department_id,d.department_name  from employees e 
join departments d on e.department_id=d.department_id;

/*
Q2--2. Create a unique list of all jobs that are in department 4.Include the location of the 
department in the output...*/

/*select  distinct job from departments where department_id=40 group by(department_id);*/

/* Q3--Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission...*/

select e.last_name,e.commission_pct ,d.department_name,l.location_id,l.city
from employees e join departments d 
on e.department_id=d.department_id
join locations l
on l.location_id= d.location_id
where commission_pct is not null;
select * from employees;

/* Q4---4. Display the employee last name and department name of all employees who have an 'a' 
in their last name..*/

select e.last_name,d.department_name from employees e join departments d
 on e.department_id=d.department_id
 where last_name like "%a%";

/*Q5-- 5. Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA...*/
select  * from locations;
select e.last_name,e.job_id,e.department_id,d.department_name from employees e join departments d
on e.department_id=d.department_id= (select location_id from locations where city='atlanta');

select * from countries;

/* 6. Display the employee last name and employee number along with their manager's last 
name and manager number. */

/*SELECT e.employee_id as 'Emp_Id', e.last_name as'Employee', 
m.employee_id as 'Mgr_Id', m.last_name as 'Manager' 
FROM employees e 
join employees m 
ON (e.employee_id = m.manager_id);*/
select * from manager;

/* 7. Display the employee last name and employee number along with their manager's last 
name and manager number (including the employees who have no manager).*/


/* SELECT e.employee_id as 'Emp_Id', e.last_name as'Employee', 
m.employee_id as 'Mgr_Id', m.last_name as 'Manager' 
FROM employees e 
join employees m 
ON (e.manager_id = m.employee_id) where e.manager_id is null;*/

/* 8. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee. */
 
SELECT last_name, department_id 
 FROM employees 
 order by department_id;


/* 9. Create a query that displays the name,job,department name,salary,grade for all 
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C)*/

SELECT E.first_name, e.job_id,E.salary,d.department_name,
case
when salary>=50000 then 'A'
when salary>=30000 then 'b'
when salary<=30000 then 'c'
end as grade
from employees e,departments d;


/*10. Display the names and hire date for all employees who were hired before their 
managers along withe their manager names and hire date. Label the columns as Employee 
name, emp_hire_date,manager name,man_hire_date*/


/* select e.first_name,e.hire_date,m.first_name as manager_name ,m.hire_date as  manager_date from employees e
 join employees m 
on e.employee_id=m.employee_id; */


/* page =3(14) */

/* 1. Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label. */

select CONCAT(UPPER(SUBSTRING(last_name,1,1)),LOWER(SUBSTRING(last_name,2,4))) AS Name from employees;


/* 2. Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.*/

select first_name,last_name, concat(first_name,' - ',last_name)as name from employees; 

/* 3. Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label.*/

select last_name ,salary,
case
when salary>10000 then (salary+salary*10/100)
else
(salary+1500+salary*11.5/100)
 end as label
from employees;

/* 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$!*/

/* 5. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names */

select  length(last_name),CONCAT(UPPER(LEFT(last_name,1)),
LOWER(RIGHT(last_name,LENGTH(last_name)-1)))
AS name FROM employees WHERE last_name LIKE 'J%'
OR last_name LIKE 'M%'
OR last_name LIKE 'A%'
ORDER BY last_name ASC; 

select * from employees;

/* 6. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY*/

select last_name ,salary , lpad(salary,'15','$')as salary from employees;

/* 7. Display the employee's name if it is a palindrome */

select first_name from employees where (SELECT REVERSE(first_name));

/* 8. Display First names of all employees with initcaps.*/

select concat(upper(left(first_name,1)),
substring(first_name,2)) as initcaps from employees;

/* 9. From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.*/
select replace(street_address,' ','  ')as address from locations;

/* 10.10. Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name. */

select  first_name,concat(lcase(substring(first_name,1,1)), lower(last_name),'@systechusa.com')as email from employees;

/* 11. Display the names and job titles of all employees with the same job as Trenna.*/

select e.first_name,j.job_title from employees e 
join jobs j
on e.job_id=j.job_id
where e.job_id=(select job_id from employees where first_name ='Trenna');

/*12. Display the names and department name of all employees working in the same city as 
Trenna.*/


select e.first_name,d.department_name,l.city from employees e
join departments d on e.department_id=d.department_id
join locations l on d.location_id=l.location_id
where l.city=
(select l.city from employees em
join departments dt on em.department_id=dt.department_id
join locations l on dt.location_id=l.location_id
where em.first_name='trenna');


/* 13. Display the name of the employee whose salary is the lowest.*/

select * from employees
where salary =(select min(salary) from employees);


/*14. Display the names of all employees except the lowest paid*/

 SELECT MIN(salary) AS "Lowest salary" FROM employees;
 
 /* page=5(12) */
 
 
/* que 1. Write a query to display the last name and hire date of any employee in the same 
department as SALES. */
SELECT e.last_name, e.hire_date
	FROM employees e
	WHERE e.department_id = (SELECT department_id
	FROM departments
	WHERE department_name like 'sales');

/* 2. Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary. */

SELECT employee_id, last_name ,salary
  FROM employees 
    WHERE salary > (SELECT AVG(salary)
                   FROM employees )
    ORDER BY salary asc;


/* 3. Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a' u */

sELECT e.employee_id, e.last_name
	FROM employees e
	WHERE department_id IN (SELECT department_id
				FROM employees s
				WHERE e.last_name like '%u%');

/* 4. Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA. */

select last_name,department_id,job_id from employees
where department_id in(select location_id  from locations  where city like'tokyo');              

/* 5. Display the last name and salary of every employee who reports to FILLMORe */

select last_name,salary from employees  where last_name like 'fillmore';

 /* 6. Display the department number, last name, and job ID for every employee in the 
OPERATIONS department. */

select e.department_id,e.last_name,e.job_id from employees e
where  e.department_id =(select department_id from departments
 where department_name ='Operations');

select * from departments;

/* 7. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name.*/

select employee_id,last_name,salary from employees
where department_id in(select department_id from departments where last_name like '%u%')
and salary > (select avg(salary) from employees); 

/* 8. Display the names of all employees whose job title is the same as anyone in the sales 
dept. */

select e.first_name from employees e
join jobs j on  e.job_id = j.job_id
where e.department_id =(select department_id from departments where department_name = 'sales');

select * from employees;

/* 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries. */

select last_name,salary from employees order by salary desc limit 3;

/* 11. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column */

select first_name,salary,commission_pct,
case
when commission_pct is not null then commission_pct
else 0
end as commission from employees;


/* 12 .Display the Managers (name) with top three salaries along with their salaries and 
department information       */
 /*
sect manager_name,salary,department_id from employees order by salary desc limit 3; */


/* date function */

/* 1) Find the date difference between the hire date and resignation_date for all the 
employees. Display in no. of days, months and year(1 year 3 months 5 days).
Emp_ID Hire Date Resignation_Date
1 1/1/2000 7/10/2013
2 4/12/2003 3/8/2017
3 22/9/2012 21/6/2015
4 13/4/2015 NULL
5 03/06/2016 NULL
6 08/08/2017 NULL
7 13/11/2016 NULL */


select e.employee_id,j.start_date,j.end_date,
concat(datediff(j.end_date,j.start_date)div 365, ' years ',
(datediff(j.end_date,j.start_date)mod 365)div 30,' months ',
(datediff(j.end_date,j.start_date)mod 365)mod 30,' days ')
as datedifference from employees e
join job_history j on e.hire_date=j.start_date;

/* 2) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd, 
yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900) */

SELECT date_FORMAT (start_date, '%m/%d/%Y') as hire_date ,
ifnull(date_FORMAT(end_date, '%b %D, %Y') , 'DEC, 01th 1900')resignation_date from job_history;

select * from job_history;

/* 3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 
months)  */


select concat(datediff(j.end_date,j.start_date)div 365, ' years ','   ',
(datediff(j.end_date,j.start_date)mod 365)div 30,' months')as month 
 from job_history j;
 select * from job_history;
 
 
 /* 4) Display the count of days in the previous quarter */
 SELECT  
    DATEDIFF(
        MAKEDATE(YEAR(CURDATE()), 2) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 DAY, 
        MAKEDATE(YEAR(CURDATE()),1) + INTERVAL QUARTER(CURDATE()) QUARTER - INTERVAL 1 QUARTER 
    )as prev_qua;
    
    /* 5) Fetch the previous Quarter's second week's first day's date */
    
SELECT DATE_ADD(

    DATE_ADD(makedate(year(curdate()),1), 
   INTERVAL(QUARTER(CURDATE())-2) QUARTER),
  INTERVAL 7 DAY
) AS PreviousQuarterSecondWeekFirstDay;

 
/* 6) Fetch the financial year's 15th week's dates (Format: Mon DD YYYY) */
  
  SELECT
  DATE_FORMAT(DATE_ADD(makedate(year(curdate()),1),
  interval 15 week),
  '%m-%d-%y') as 15th_week_date;

/* 7) Find out the date that corresponds to the last Saturday of January, 2015 using with 
clause. */


