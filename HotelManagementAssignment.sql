create table Coustomers(
coustomerid int primary key identity(1,1),
customername varchar(30),
email varchar(50),
phone bigint,
address varchar(50)
);

create table RoomsTable(
roomid int primary key identity(1,1),
roomtype varchar(20),
pricepernight int,
status varchar(20)
);
select * from RoomsTable
update roomstable set status = 'Avaliable' where roomid = 1;

create table BookingTable(
bookingid int primary key identity(1,1),
coustomerid int 
constraint fk_coustomer foreign key (coustomerid) references Coustomers(coustomerid),
roomid int 
constraint fk_room foreign key (roomid) references RoomsTable(roomid),
checkindate date,
checkoutdate date,
totalamount int
);

create table payment(
paymentid int primary key identity(1,1),
bookingid int 
constraint fk_booking foreign key (bookingid) references BookingTable(bookingid),
paymetdate date,
amount int,
paymentmode varchar(20)
);

create table employesTable(
employeeid int primary key identity(1,1),
name varchar(20),
position varchar(30),
salary int ,
hiredate date,
managerid int foreign key references employesTable(employeeid), --self join
);

create table servises(
serviceid int primary key identity(1,1),
servicename varchar(30),
price int
);

create table hotelbranchs(
branchid int primary key identity(1,1),
branchname varchar(30),
hotellocation varchar(20)
);

create table bookingservice(
bookingid int 
constraint fk_booking1 foreign key (bookingid) references BookingTable(bookingid),
serviceid int 
constraint fk_service foreign key (serviceid) references servises(serviceid),
quntity int,
totalservicecoust int
);
-- Inserting records into Coustomers table
INSERT INTO Coustomers (customername, email, phone, address) VALUES
('Amit Sharma', 'amit.sharma@example.com', 9876543210, 'Mumbai'),
('Sonia Rao', 'sonia.rao@example.com', 9876543211, 'Delhi'),
('Rajiv Mehta', 'rajiv.mehta@example.com', 9876543212, 'Bangalore'),
('Neha Verma', 'neha.verma@example.com', 9876543213, 'Hyderabad'),
('Rahul Gupta', 'rahul.gupta@example.com', 9876543214, 'Chennai');
insert into Coustomers values('anjali sharma', 'anjali@example.com', 9876543214, 'jammu');
insert into Coustomers values('Gokul Ganesh', 'gokul@example.com', 9876543214, 'kolhapur');
insert into Coustomers values('lavanya satpute', 'lavanya@example.com', 9876543214, 'nagpur');


--Task 1 insert qury for each table 
-- Inserting records into RoomsTable
INSERT INTO RoomsTable (roomtype, pricepernight, status) VALUES
('Single', 2000, 'Available'),
('Double', 3000, 'Available'),
('Suite', 5000, 'Booked'),
('Single', 2000, 'Booked'),
('Double', 3000, 'Available');

-- Inserting records into BookingTable
INSERT INTO BookingTable (coustomerid, roomid, checkindate, checkoutdate, totalamount) VALUES
(1, 3, '2025-02-15', '2025-02-18', 15000),
(2, 2, '2025-02-20', '2025-02-23', 9000),
(3, 1, '2025-02-25', '2025-02-27', 4000),
(4, 4, '2025-03-01', '2025-03-05', 10000),
(5, 5, '2025-03-10', '2025-03-12', 6000);
insert into BookingTable values(6, null, '2025-03-10', '2025-03-12', 6000);
insert into BookingTable values(6, null, '2025-03-10', '2025-03-12', 6000);
insert into BookingTable values(6, null, '2025-03-10', '2025-03-12', 6000);
delete from BookingTable where coustomerid=2;

-- Inserting records into payment table
INSERT INTO payment (bookingid, paymetdate, amount, paymentmode) VALUES
(1, '2025-02-15', 15000, 'Credit Card'),
(2, '2025-02-20', 9000, 'Debit Card'),
(3, '2025-02-25', 4000, 'Cash'),
(4, '2025-03-01', 10000, 'Credit Card'),
(5, '2025-03-10', 6000, 'Debit Card');

-- Inserting records into employesTable
INSERT INTO employesTable (name, position, salary, hiredate, managerid) VALUES
('Karan Singh', 'Manager', 50000, '2020-01-10', NULL),
('Pooja Patel', 'Receptionist', 25000, '2021-06-15', 1),
('Rohit Kumar', 'Housekeeping', 20000, '2019-11-20', 1),
('Sneha Desai', 'Chef', 30000, '2020-05-25', 1),
('Anil Reddy', 'Maintenance', 22000, '2021-03-10', 1),
('Radhika kuri', 'Chef', 22000, '2021-03-10', 3),
('ramesh jadhv', 'Maintenance', 22000, '2021-03-10', 4);

-- Inserting records into servises table
INSERT INTO servises (servicename, price) VALUES
('Room Service', 500),
('Laundry', 300),
('Wi-Fi', 200),
('Breakfast', 400),
('Gym Access', 600);

-- Inserting records into hotelbranch table
INSERT INTO hotelbranch (branchname, hotellocation) VALUES
('Taj Mumbai', 'Mumbai'),
('Taj Delhi', 'Delhi'),
('Taj Bangalore', 'Bangalore'),
('Taj Hyderabad', 'Hyderabad'),
('Taj Chennai', 'Chennai');

-- Inserting records into bookingservice table
INSERT INTO bookingservice (bookingid, serviceid, quntity, totalservicecoust) VALUES
(1, 1, 2, 1000),
(2, 2, 3, 900),
(3, 3, 1, 200),
(4, 4, 2, 800),
(5, 5, 1, 600);


--Tasck 2 retrive booking deatails,list of employes along ther manager find room w
SELECT c.customername, r.roomtype, b.checkindate, b.totalamount
FROM BookingTable b
JOIN Coustomers c ON b.coustomerid = c.coustomerid
JOIN RoomsTable r ON b.roomid = r.roomid;

select * from employesTable
select * from Coustomers where coustomerid not in (select distinct coustomerid from BookingTable);

--Task 3 
select customername ,email,phone
from coustomers 
where coustomerid in 
(select coustomerid from BookingTable group by coustomerid having count(bookingid)>1);


select  max(pricepernight)  as highprice
from RoomsTable

--Task 4 create view 
create view ActiveBookingDemo as 
select 
c.customername,
r.roomtype,
b.checkindate,
b.checkoutdate,

from coustomers c
JOIN 
    BookingTable b ON c.coustomerid = b.coustomerid
JOIN 
    RoomsTable r ON b.roomid = r.roomid; 

select * from ActiveBookingDemo

--Task 5 indexing for optimization 
create index idx_room on RoomsTable(roomtype);
create index idx_booking on BookingTable( checkindate, checkoutdate);

--Task 6 procedure and functions

CREATE FUNCTION dbo.CalculateTotalDays
(
    @CheckInDate DATE,
    @CheckOutDate DATE
)
return int
as
begin
    declare @TotalDays INT;
    set @TotalDays = datediff(day, @CheckInDate, @CheckOutDate);
    return @TotalDays;
end;


SELECT bookingid, dbo.CalculateTotalDays(checkindate, checkoutdate) AS TotalDays
FROM BookingTable;


-- creating a stored procedure to calculate total revenue generated in a month
create procedure dbo.calculatemonthlyrevenue
(
    @month int
)
as
begin
    set nocount on;

    declare @totalbookingrevenue int;
    declare @totalservicerevenue int;
    declare @totalrevenue int;
    select @totalbookingrevenue = sum(totalamount)
    from bookingtable
    where month(checkindate) = @month;
    select @totalservicerevenue = sum(totalservicecoust)
    from bookingservice
    where bookingid in (
        select bookingid 
        from bookingtable
        where month(checkindate) = @month
    );
    set @totalrevenue = isnull(@totalbookingrevenue, 0) + isnull(@totalservicerevenue, 0);
     select @totalrevenue as totalrevenue;
end;
EXEC dbo.calculatemonthlyrevenue @Year = 2025, @Month = 2;

--Task 7 trigger
-- creating a trigger to update room status when a booking is canceled
create trigger afterbookingcanceled
on bookingtable
after delete
as
begin
    set nocount on;

    update roomstable
    set status = 'available'
    where roomid in (
        select roomid
        from deleted
    );
end;

--Task 8 security and priviligious
--create role hotel_manager;
--grant select, insert, update, delete on bookingtable to hotel_manager;
--alter role hotel_manager add member manager_user;

--Task 9 backup
--backup database JIBE_Main_Training
--to disk = 'C:\Backup\JIBE_Main_Training.bak'
--with init;

--Task 10 full text search
exec sp_fulltext_database 'enable';
create fulltext catalog roomcatlog as default;

create unique index inx_roomid on RoomsTable(roomid);
create fulltext index on RoomsTable(roomtype)
key index inx_roomid;

select * from RoomsTable

select roomid,roomtype
from RoomsTable
where contains(roomtype,'single');