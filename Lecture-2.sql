show databases;
use techforallwithvasu;
show tables;
select * from employee;

create table courses(
courseID int auto_increment,
courseName varchar(50) not null,
course_duration int not null,
courseFee int not null,
primary key(courseID)
);

desc courses;

insert into courses(courseName,course_duration,courseFee) values("The Complete Excel Mastery Course",3,1499);
insert into courses(courseName,course_duration,courseFee) values("DSA for Interview Preparation",2,4999);
insert into courses(courseName,course_duration,courseFee) values("SQL Bootcamp",1,2999);

select * from courses;

create table learners(
learnerID int auto_increment,
learner_firstName varchar(50) not null,
learner_lastName varchar(50) not null,
learner_email varchar(50) not null,
learner_phoneNumber varchar(15) not null,
learner_EnrollmentDate timestamp not null,
selectedCourse int not null,
YearOfExp int not null,
LearnerCompany varchar(50) not null,
SourceOfJoining varchar(50) not null,
location varchar(50) not null,
primary key(learnerID),
unique key(learner_email),
foreign key(selectedCourse) references courses(courseID)
);

desc learners;

insert into learners(learner_firstName,learner_lastName,learner_email,learner_phoneNumber,learner_EnrollmentDate,selectedCourse,YearOfExp,LearnerCompany,SourceOfJoining,location) values("vasu","jain","vasu@gmail.com","6735865790","2024-01-29",1,4,"microsoft","youtube","india");
insert into learners(learner_firstName,learner_lastName,learner_email,learner_phoneNumber,learner_EnrollmentDate,selectedCourse,YearOfExp,LearnerCompany,SourceOfJoining,location) values("atharv","jain","atharv@gmail.com","6735865450","2024-02-29",1,7,"google","linkedln","america");
insert into learners(learner_firstName,learner_lastName,learner_email,learner_phoneNumber,learner_EnrollmentDate,selectedCourse,YearOfExp,LearnerCompany,SourceOfJoining,location) values("anuj","jain","anuj@gmail.com","673586565","2024-01-16",2,6,"facebook","youtube","austria");
insert into learners(learner_firstName,learner_lastName,learner_email,learner_phoneNumber,learner_EnrollmentDate,selectedCourse,YearOfExp,LearnerCompany,SourceOfJoining,location) values("pooja","jain","ppoja@gmail.com","9935865790","2024-03-25",3,8,"RBI","inkedln","USA");
insert into learners(learner_firstName,learner_lastName,learner_email,learner_phoneNumber,learner_EnrollmentDate,selectedCourse,YearOfExp,LearnerCompany,SourceOfJoining,location) values("lakshay","jain","lakshay@gmail.com","9835865790","2024-01-16",2,24,"ONGC","Community","india");
insert into learners(learner_firstName,learner_lastName,learner_email,learner_phoneNumber,learner_EnrollmentDate,selectedCourse,YearOfExp,LearnerCompany,SourceOfJoining,location) values("amit","jain","amit@gmail.com","6776865790","2024-03-25",3,14,"Amazon","Community","Canada");

select * from learners;

-- data analysis

-- 1. the record of the employee getting highest salary ?
select * from employee
order by salary desc
limit 1;

-- 2. the record of the employee getting highest salary and age is bigger than 30.?
select * from employee
where age>30
order by salary desc
limit 1;
-- code flow => from->where->select->order by->limit.

-- 3. display the no. of enrollments in the website of databse.?
select count(*) as num_of_enrollments
from learners;

-- 4. display the no. of enrollments for the courseid =3 ?
select count(learnerID) as num_of_enrollments
from learners
where selectedCourse=3;

-- 5. count the no. of learners enrolled in the month of january .?
select count(*) as num_of_learners from learners
where learner_EnrollmentDate like '%-01-%';

-- 6. update the vasu data with years of experience as 1 and learner company as "Amazon". ?
update learners
set YearofExp = 2 , learnerCompany = "amazon"
where learnerID=4;

-- 7. count the unique no. of companies where learners currently doing their job ?
select count(distinct learnerCompany) as distinct_no_of_companies
from learners;