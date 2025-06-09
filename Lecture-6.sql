use techforallwithvasu;
select * from courses;

-- conditional statement - case statement.
select courseID , courseName,courseFee,
case
   when courseFee>3999 then 'expensive course'
   when courseFee>1499 then 'moderate course'
   else 'cheap course'
end as courseFeeStatus
from courses;   

-- case expressions in sql.
select courseID , courseName,courseFee,
case courseFee
   when 4999 then 'premium course'
   when 1499 then 'regular course'
   else 'plus course'
end as courseType
from courses; 

-- CTE
create table orders(
orderID int auto_increment,
order_Date timestamp not null,
order_learner_ID int not null,
order_status varchar(50) not null,
primary key(orderID),
foreign key(order_learner_ID) references learners(learnerID)
);
drop table orders;
DESC orders;

insert into orders(order_Date,order_learner_ID,order_status) values('2024-01-25',1,'closed');
insert into orders(order_Date,order_learner_ID,order_status) values('2024-05-13',3,'pending');
insert into orders(order_Date,order_learner_ID,order_status) values('2024-08-12',5,'complete');
insert into orders(order_Date,order_learner_ID,order_status) values('2024-01-09',2,'complete');
insert into orders(order_Date,order_learner_ID,order_status) values('2024-03-29',4,'pending');
insert into orders(order_Date,order_learner_ID,order_status) values('2024-04-12',6,'complete');

select order_learner_ID, count(*) as total_orders
from orders
group by order_learner_ID;

select order_learner_ID,learner_firstName,learner_lastName, count(*) as total_orders
from orders join learners
on orders.order_learner_ID=learners.learnerID
group by order_learner_ID;