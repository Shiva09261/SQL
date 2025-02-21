--Online Book store assignment

create table AuthortableExample(
AuthorId int primary key identity(1,1),
fristname varchar(20) not null,
lastname varchar(20) not null
);

create table BookTableExample(
BookId int primary key identity(1,1),
titel varchar (30) not null,
AuthorId int ,
constraint fk_Authors foreign key (AuthorId) references AuthortableExample(AuthorId),
publishedyear date unique,
constraint check_publishyears check (year(publishedyear) between 1900 and year(getdate())),
);

create table MemberTableExample1(
memberId int primary key identity(1,1),
fristname varchar (30) not null,
lastname varchar(30) not null,
email varchar(60) unique not null,
);

create table loanTableExample(
loanid int primary key identity(1,1),
BookId int,
constraint fk_loans foreign key(BookId) references BookTableExample(BookId),
loandate date not null,
returndate date ,
constraint check_returndates check (returndate is null or returndate > loandate),
);

insert into AuthortableExample values ('amitabh', 'bachchan');
insert into AuthortableExample values ('narendra', 'modi');
insert into AuthortableExample  values ('ratan', 'tata');

insert into BookTableExample  values ('wings of fire', 1, '1999-07-29');
insert into BookTableExample values ('ignited minds', 2, '2002-05-01');
insert into BookTableExample values ('the secret', 3, '2006-11-26');

INSERT INTO MemberTableExample1 VALUES ('rahul', 'sharma', 'rahul@example.com');
insert into MemberTableExample1 values ('priya', 'kumar', 'priya@example.com');
insert into MemberTableExample1 values ('sachin', 'tendulkar', 'sachin@example.com');

insert into loanTableExample  values (1, '2025-01-15', '2025-02-15');
insert into loanTableExample values (2, '2025-02-01', '2025-03-01');
insert into loanTableExample values (3, '2025-03-10', '2025-04-10');

SELECT * FROM MemberTableExample1 WHERE MemberTableExample1.memberId IN (SELECT DISTINCT loanTableExample.loanid FROM loanTableExample);
SELECT titel FROM BookTableExample WHERE BookId NOT IN (SELECT DISTINCT BookId FROM loanTableExample);


select * from AuthortableExample;
select * from BookTableExample;
select * from MemberTableExample1;
select * from loanTableExample;
