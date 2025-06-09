use techforallwithvasu;
show tables;
 
-- count the no. of students who joined the courses via linkedin , yt , community ?
select SourceOfJoining , count(*) as num_of_students
from learners
group by SourceOfJoining;

-- corresponding to each course, how many students have enrolled ?
select selectedCourse , count(*)as num_of_students
from learners
group by selectedCourse;

select SourceOfJoining , max(YearOfExp) as max_exp
from learners
group by  SourceOfJoining;

select SourceOfJoining , min(YearOfExp) as min_exp
from learners
group by  SourceOfJoining;

select SourceOfJoining , avg(YearOfExp) as avg_exp
from learners
group by  SourceOfJoining;

-- display the count of those students who joined via linkedln ?
select SourceOfJoining, count(*) as num_of_students
from learners
group by SourceOfJoining
having SourceOfJoining="linkedln";

-- alter command in sql
alter table employee add column jobPosition varchar(50);
alter table employee modify column firstname varchar(40);
alter table employee drop column jobPosition ;

desc employee;


-- truncate in sql -> H.with
-- truncate vs delete
 