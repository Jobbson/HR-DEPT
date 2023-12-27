create database project;
use project;
select * from hr;


alter table hr
change column ï»¿id emp_id varchar(20);

describe hr;
set sql_safe_updates =0;
update hr
set birthdate = case
when birthdate like '%/%' then date_format(STR_TO_DATE(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%' then date_format(STR_TO_DATE(birthdate,'%m-%d-%Y'),'%Y-%m-%d') 
else null
end;

select birthdate from hr;

alter table hr
modify column birthdate DATE; 

update hr
set hire_date = case
when hire_date like '%/%' then date_format(STR_TO_DATE(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%' then date_format(STR_TO_DATE(hire_date,'%m-%d-%Y'),'%Y-%m-%d') 
else null
end;

select hire_date from hr;

alter table hr
modify column hire_date DATE;

update hr
set termdate = date(str_to_date(termdate, '%Y-%m-%d %H:%i:%s UTC'))
where termdate is not null and termdate !='';

SET GLOBAL SQL_MODE = 'modes';




select termdate from hr;

alter table hr
modify column termdate date;



alter table hr
add column age int;

update hr
set age = timestampdiff(year,birthdate,curdate());
select birthdate,age from hr;

select
min(age) as youngest,
max(age) as oldest
from hr;

select count(*)
from hr
where age < 18
