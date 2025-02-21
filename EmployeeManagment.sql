create table EmpTable1(
empid int primary key identity(1,1),
empnmae varchar(30),
departmentid int ,
CONSTRAINT fk_departdemo123 FOREIGN KEY (departmentid) REFERENCES DepTable(departmentid),
hierdate date,
salary int
);

create table DepTable(
departmentid int primary key identity(1,1),
departmentname varchar (20)
);

create table salaryTable(
salid int primary key identity(1,1),
empid int,
constraint fk_emp FOREIGN KEY (empid) references EmpTable1(empid),
empsal int ,
bonus int
);

insert into deptable values ('hr');
insert into deptable values ('it');
insert into deptable values ('finance');
insert into deptable values ('marketing');
insert into deptable values ('operations');

insert into emptable1  values ('shivani kurade', 1, '2023-01-15', 50000);
insert into emptable1  values ('aditya kurade', 2, '2023-02-20', 60000);
insert into emptable1  values ('muskan latif', 3, '2023-03-10', 55000);
insert into emptable1  values ('anjali sharma', 4, '2023-04-05', 58000);
insert into emptable1  values ('randeep rai', 5, '2023-05-12', 62000);
insert into emptable1  values ('siddharth kamble', 5, '2023-05-12', 62000);
insert into emptable1  values ('ayush kamble', 3, '2023-03-10', 55000);
insert into emptable1  values ('sakshi kamble', 1, '2023-01-15', 50000);
insert into emptable1  values ('neha kurade', null, '2023-01-15', 50000);
insert into emptable1  values ('vrushabh kurade', null, '2023-01-15', 50000);
insert into emptable1  values ('saurabh kurade', null, '2020-01-15', 50000);

select * from emptable1

insert into salarytable  values (1, 50000, 5000);
insert into salarytable  values (2, 60000, 6000);
insert into salarytable  values (3, 55000, 5500);
insert into salarytable  values (4, 58000, 5800);
insert into salarytable  values (5, 62000, 6200);
insert into salarytable  values (6, 62000, 6200);
insert into salarytable  values (7, 62000, 6200);
insert into salarytable  values (8, 62000, 6200);
insert into salarytable  values (9, 58000, 5800);
insert into salarytable  values (10, 58000, 5800);


--Task one inner join example 
select e.empnmae, d.departmentname, e.hierdate
from emptable1 e inner join deptable d 
on e.departmentid = d.departmentid;


--Task two list employee without department (self join and left join)
select e.empnmae as employee_name, e.departmentid,e.hierdate
from emptable1 e left join deptable d 
on e.departmentid = d.departmentid
where e.departmentid is null;

--Task three the department without employee(left join)
select d.departmentid,d.departmentname
from deptable d left join emptable1 e 
on d.departmentid = e.departmentid
where e.empid is null

--Task 4 get a total salary (salary+bonous) for each employe (join+calculate) disply salary of each employe
select e.empnmae, e.salary, s.bonus,(e.salary + s.bonus) as total_salary
from emptable1 e inner join salarytable s 
on e.empid = s.empid;

--Task 5 identify the employee having high salary
select e.empnmae, e.salary, s.bonus,(e.salary + s.bonus) as total_salary
from emptable1 e inner join salarytable s 
on e.empid = s.empid
where (e.salary + s.bonus) = (select max(e.salary + s.bonus) from emptable1 e inner join salarytable s on e.empid = s.empid);

--Task 6 find the employee earning more than there manager (self join)


--Task 7 creat the view for hr to see employe salary details creat a view as employeviewer include empid ,name departmentname,salary bonus and total satary
create view employeviweExample as
select e.empid, e.empnmae, d.departmentname, e.salary, s.bonus, (e.salary + s.bonus) as total_salary
from emptable1 e inner join deptable d 
on e.departmentid = d.departmentid inner join salarytable s 
on e.empid = s.empid;

select * from employeviweExample

--Task 8 get employee who work more than 1 year (from todyas date)
select empid, empnmae, departmentid,hierdate, salary
from emptable1
where datediff(year, hierdate, getdate()) > 2;

--Task 9 find the number of employe for each department
select d.departmentname, count(e.empid) as employee_count
from emptable1 e inner join deptable d 
on e.departmentid = d.departmentid
group by d.departmentname;