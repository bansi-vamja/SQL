/* from the following table write a squal query those employees whos first name cantion letter z return first,last,department,city,and streat _province*/

select e.first_name,e.last_name,d.department_name,l.city,l.state_province
from employees e join departments d
on e.department_id=d.department_id
join locations l
on l.location_id=l.location_id
where first_name like '%z%';

select * from locations;

/*find the employee who earn <employee_id of 182 return first,last,salary*/

SELECT E.first_name, E.last_name, E.salary,e.employee_id 
  FROM employees E 
   JOIN employees S
     ON E.salary < S.salary 
      AND S.employee_id = 182;
      
/* find out which employees have or do not have a department return first,last,department_id,depart_name*/
use assignment;
select e.first_name,e.last_name,e.department_id,d.department_name
from employees e
left join departments d
on e.department_id=d.department_id ;
select * from employees;

	/* from the dollowing table write a squal query to find all employees who join on 
    or after first january 1993 and on or before 31 august  1997  return job_title,
    department_name,employee_name,joinning_date of the job */
    
    select * from jobs;
    select j.job_title,d.department_name,e.first_name, jh.start_date
    from  employees e join departments d on e.department_id=d.department_id
    join jobs j     on  j.job_id= e.job_id
    join job_history jh on e.hire_date = jh.start_date
    where jh.start_date >='1993-01-01' and jh.start_date<='1997-08-31';
    
select * from job_history;


/* SELECT EMPLOYEE WHERE SALARY < JOB_ID="ANY FILED" */
  select * from employees  where salary< any (select salary from employees where job_id = "it_prog" );
  
  /* WRITE A QUERY TO DISPLAY EMPLOYEE ID ,NAME AND,SALARY, SALARY STUTUS whose salary is more than and less than  avg salary  more employees. */
  
  select employee_id,first_name,salary,
  case when salary>=(select avg(salary)from employees)then 'high'
  else 'low' end as salary_status from employees;
  
  /* avg salary < data & id department */
  select * from  employees where 
  salary >(select avg (salary) from employees ) 
  and 
  job_id in (select job_id from employees where Job_id like '%it%');
  
  /*write a query find whose employees whose salarys exis 50% of their departments total salary bill return first name and last name */
  SELECT first_name, last_name 
FROM employees e1
WHERE salary > 
( SELECT (SUM(salary))/2 
FROM employees  e2
where  e1.department_id=e2.department_id);
