use techforallwithvasu;
select * from learners;

select courseID,courseName,count(*) as num_enrollments
from learners
join courses
on learners.selectedCourse = courses.courseID
group by courseID
order by num_enrollments desc
LIMIT 1;