

--Assignment NUmber 1 --
create table emp4(
EmployeId int primary key,
EmployeName varchar(20), 
Email varchar(50),
Department varchar(30),
Salary decimal,
JoiningDate date
);

select * from emp4

insert into emp4 values(1,'shivani','shivani@gmail.com','HR',5000.00,'2025-02-19');
insert into emp4 values(2,'Anajali','Anajali@gmail.com','IT',5000.00,'2025-02-19');
insert into emp4 values(3,'Gokul','Gokul@gmail.com','HR',5000.00,'2025-02-19');
insert into emp4 values(4,'Lavanya','Lavanya@gmail.com','TI',5000.00,'2025-02-19');

update emp4 set EmployeName='Shivani kurade' where EmployeName='shivani';


--Assignment NUmber 2 --
create table OrdersExample(
orderid int primary key,
customerName varchar(50),
productName varchar(40),
quntity int,
price decimal ,
orderDate date
);

select * from  OrdersExample

insert into OrdersExample values (1,'shivani','phone',2,2000000.00,'2025-09-23');
insert into OrdersExample values (2,'anjali','car',2,2000000.00,'2025-09-23');
insert into OrdersExample values (3,'gokul','pan',2,2000000.00,'2025-09-23');
insert into OrdersExample values (4,'lavanya','pancile',2,2000000.00,'2025-09-23');
insert into OrdersExample values (5,'muskan','pot',2,2000000.00,'2025-09-23');
insert into OrdersExample values (6,'aditya','taddy',2,2000000.00,'2025-09-23');
insert into OrdersExample values (7,'rani','phone',2,2000000.00,'2025-09-23');
insert into OrdersExample values (8,'namdev','i-phone',2,2000000.00,'2025-09-23');


update OrdersExample set productName='cloths' where productName='phone';

--Assignment NUmber 3 --

create table patientsExample(
patientid int primary key Identity(1,1),
patientName varchar(30),
age int,
disease varchar(30),
doctorAssigned varchar(30),
);
begin transaction;
insert into patientsExample values('Anjali',22,'cold','Lohit Sharma');
insert into patientsExample values('shivani',22,'fevere',' Sharma');
insert into patientsExample values('gokul',22,'nimoniya','Lohit Sharma');
insert into patientsExample values('lavanya',22,'fevere',' Sharma');
insert into patientsExample values('aashwini',22,'nimoniya','Lohit Sharma');
insert into patientsExample values('abhid',22,'fevere',' Sharma');
insert into patientsExample values('sandya',22,'fevere','Lohit Sharma');
insert into patientsExample values('prachi',22,'nimoniya','Lohit Sharma');

select * from patientsExample;
update patientsExample set disease='cold' where disease='fevere';
commit transaction;
rollback ;
select patientName from patientsExample where doctorAssigned=' Sharma';

SELECT disease, COUNT(*) as patientCount
FROM patientsExample
GROUP BY disease;

--Assignment 4 --

create table Booking(
bookingid int primary key Identity (1,1),
CustomerName varchar(30),
MoviName varchar(40),
SeatBooking int ,
totalprice int,
);

truncate table Booking;
select * from Booking;
begin transaction;
insert into Booking values('rohan','Ramaiya Vastavaya',2,200);
insert into Booking values('sohan','Chhava',3,300);
insert into Booking values('mohan','Sky Force',1,100);
insert into Booking values('ram','Baggi',5,500);

select SeatBooking ,count(*) as seatcount
from Booking 
group by SeatBooking;

commit;
BEGIN TRANSACTION;
save TRANSACTION savepoint1;

update Booking set totalprice =220 where CustomerName='rohan';  

ROLLBACK TRANSACTION ;
COMMIT TRANSACTION;