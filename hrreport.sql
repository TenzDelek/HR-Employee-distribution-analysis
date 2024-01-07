create database project1;
USE project1;
select * from hr;
alter table hr
change column ï»¿id emp_id varchar(20) null;

describe hr;

select birthdate from hr;

set sql_safe_updates=0;
update hr set birthdate=case 
when birthdate like '%/%'then date_format(str_to_date(birthdate,'%m/%d/%Y'),'%Y-%m-%d')
when birthdate like '%-%'then date_format(str_to_date(birthdate,'%m-%d-%Y'),'%Y-%m-%d')
else null 
end;

alter table hr
modify column birthdate date;

update hr set hire_date=case 
when hire_date like '%/%'then date_format(str_to_date(hire_date,'%m/%d/%Y'),'%Y-%m-%d')
when hire_date like '%-%'then date_format(str_to_date(hire_date,'%m-%d-%Y'),'%Y-%m-%d')
else null 
end;
alter table hr
modify column hire_date date;

alter table hr
add column age int;

update hr
set age=timestampdiff(YEAR,birthdate,CURDATE());
SELECT age from hr;

select min(age) as youngest,
max(age) as oldest from hr where age>18;

select count(*) from hr where age <18;

-- what is the gender breakdown
select gender, count(*) as count 
from hr where age >=18 group by gender;

select race,count(*) as count from hr
where age>=18 group by race order by count(*) desc;

select case
when age>=18 and age<=24 then '18-24'
when age>=25 and age<=34 then '25-34'
when age>=35 and age<=44 then '35-44'
when age>=45 and age<=54 then '45-54'
when age>=55 and age<=64 then '55-64'
else '65+'
end as age_group,
count(*) as count from hr where age>=18 group by
age_group order by age_group;


select case
when age>=18 and age<=24 then '18-24'
when age>=25 and age<=34 then '25-34'
when age>=35 and age<=44 then '35-44'
when age>=45 and age<=54 then '45-54'
when age>=55 and age<=64 then '55-64'
else '65+'
end as age_group,gender,
count(*) as count from hr where age>=18 group by
age_group,gender order by age_group,gender;

select location,count(*) as count
from hr where age>=18 group by location;

select department,gender,count(*) as count 
from hr where age>=18 group by department,gender
order by department ;

select jobtitle,count(*) as count from hr
where age >=18 group by jobtitle order by 
jobtitle desc;

select location_state,count(*) as count from hr
where age>=18 group by location_state order by
count desc;

