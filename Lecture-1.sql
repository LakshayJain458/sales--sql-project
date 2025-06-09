show databases;

create database if not exists techforallwithvasu;

use techforallwithvasu;

select database();

create table employee(
EID int primary key auto_increment,
firstname varchar(50) not null,
lastname varchar(50) not null,
age int not null,
salary int not null,
location varchar(50) not null
-- primary key(EID)
);

show tables;

-- description of table
desc employee;

insert into employee values(1,"vasu","jain",19,2000000,"india");
insert into employee values(2,"vasu","jain",25,100000,"india");
insert into employee values(3,"vasu","jain",67,800000,"india");
insert into employee values(4,"vasu","jain",11,100000,"india");
insert into employee values(5,"vasu","jain",15,60000,"india");

-- view table from database
select * from employee;

-- retrieval od particular data
select * from employee
where salary>1000000;

-- retrieval od particular data
select * from employee
where age>25;

-- update an element
update employee set age=51
where EID =2 ;

-- delete an element of table
delete from employee
where EID=5;

-- delete table 
drop table employee;