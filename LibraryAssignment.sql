create table AuthorsTable(
AuthorId int primary key identity(1,1),
fristname varchar(20) not null,
lastname varchar(20) not null
);

create table BookTable(
BookId int primary key identity(1,1),
titel varchar (30) not null,
AuthorId int ,
constraint fk_Author foreign key (AuthorId) references AuthorsTable(AuthorId),
publishedyear date unique,
constraint check_publishyear check (year(publishedyear) between 1900 and year(getdate())),
);

create table MemberTable(
memberId int primary key identity(1,1),
fristname varchar not null,
lastname varchar not null,
email varchar unique not null,
);

create table loanTable(
loanid int primary key identity(1,1),
BookId int,
constraint fk_loan foreign key(BookId) references BookTable(BookId),
loandate date not null,
returndate date ,
constraint check_returndate check (returndate is null or returndate > loandate),
);

insert into authorstable values ('amitabh', 'bachchan');
insert into authorstable values ('narendra', 'modi');
insert into authorstable  values ('ratan', 'tata');

insert into booktable  values ('wings of fire', 1, '1999-07-29');
insert into booktable values ('ignited minds', 2, '2002-05-01');
insert into booktable values ('the secret', 3, '2006-11-26');

insert into membertable values ('rahul', 'sharma', 'rahul.sharma@example.com');
insert into membertable values ('priya', 'kumar', 'priya.kumar@example.com');
insert into membertable values ('sachin', 'tendulkar', 'sachin.tendulkar@example.com');

insert into loantable  values (1, '2025-01-15', '2025-02-15');
insert into loantable values (2, '2025-02-01', '2025-03-01');
insert into loantable values (3, '2025-03-10', '2025-04-10');

select * from authorstable;
select * from booktable;
select * from membertable;
select * from loantable;
