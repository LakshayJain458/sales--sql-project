create database lab;
use lab;
CREATE TABLE EMP (
    Empno INT PRIMARY KEY,         
    Ename VARCHAR(50) NOT NULL,     
    Designation VARCHAR(50) NOT NULL, 
    Salary INT NOT NULL,            
    Deptno INT,                     
    FOREIGN KEY (Deptno) REFERENCES DEPT(Deptno) 
);

INSERT INTO EMP (Empno, Ename, Designation, Salary, Deptno)
VALUES
(1001, 'Axay', 'CEO', 8000, 10),
(1002, 'Ashish', 'Manager', 5000, 10),
(1003, 'Sparsh', 'Manager', 6000, 20),
(1004, 'Meenal', 'Sales Person', 4000, 20),
(1005, 'Tanu', 'Sales Person', 4500, 20),
(1006, 'Rahul', 'Manager', 5000, 10),
(1007, 'Vivek', 'Admin Officer', 5500, 10);


CREATE TABLE DEPT (
    Deptno INT PRIMARY KEY,        
    Dname VARCHAR(50) NOT NULL,    
    Location VARCHAR(50) NOT NULL  
);

INSERT INTO DEPT (Deptno, Dname, Location)
VALUES
(10, 'Physics', 'Delhi'),
(20, 'Chemistry', 'Bombay');

select Ename
From EMP
where Salary > 5000;

SELECT Deptno, COUNT(Empno) AS EmployeeCount
FROM EMP
GROUP BY Deptno
HAVING COUNT(Empno) > 2;

SELECT E2.Ename
FROM EMP E1
JOIN EMP E2
ON E1.Deptno = E2.Deptno
WHERE E1.Salary = (SELECT MAX(Salary) FROM EMP)
AND E1.Empno != E2.Empno;

UPDATE EMP
SET Designation = 'Senior'
WHERE Salary > 6000;

