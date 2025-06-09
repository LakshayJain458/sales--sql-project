use techforallwithvasu;
select * from employee;

update employee
set location = "India"
where EID=4;

select Location ,count(Location) as total, avg(Salary) as avg_salary
from employee
group by Location;

select firstname , LastName , Location,
count(Location) over (partition by location) as total,
avg(salary) over (partition by location) as avg_salary
from employee;

-- difference between row_number(),rank() and , dense_rank() ?
select firstname , lastname , salary,
row_number() over (order by salary desc) as priority_emp
from employee;

select firstname , lastname , salary,
rank() over (order by salary desc) as priority_emp
from employee;

select firstname , lastname , salary,
dense_rank() over (order by salary desc) as priority_emp
from employee
