create database ecommerce1

use ecommerce1

-- Roles
-- 1 Admin
-- 2 Manager
-- 3 Employee
create table RoleDetails
(
RoleId int primary key identity,
RoleName varchar(20)
)

insert into RoleDetails values 
('Admin'),('Manager'),('Staff'), ('Customer')

select * from RoleDetails

-- Customer Details
create table CustomerDetails
(CustomerId int primary key identity (1000,1),
Username varchar(25) not null,
FirstName varchar(25) not null,
LastName varchar(25) not null,
DateOfBirth date not null,
ContactNo varchar(25) unique not null,
Email varchar(30) unique not null,
RoleId int foreign key references RoleDetails(RoleId),
CustomerAddress varchar(200)
)

alter table CustomerDetails ADD Constraint DF_Constraint DEFAULT 4 For RoleId 
select * from CustomerDetails
insert into CustomerDetails (Username, FirstName, LastName, DateOfBirth, ContactNo, Email, RoleId, CustomerAddress) values(
'Gautham04', 'Gautham', 'Asir', '2000/04/12', '8268154625', 'gauthamasir@gmail.com', 1, '')

update CustomerDetails set RoleId = 1 where CustomerId = 1000

-- Login ID & Pass
create table LoginCredentials
(CustomerId int foreign key references CustomerDetails(CustomerId),
LoginPassword varbinary(max) not null,
LastUpdated DateTime
)
alter table LoginCredentials ADD Constraint DF_Password_Update DEFAULT GetDate() For LastUpdated
insert into LoginCredentials(CustomerId, LoginPassword) values (1000, HASHBYTES('SHA2_512','1234'))
select * from LoginCredentials

--Porduct Details
create table ProductDetails
(PorductId int primary key identity(100,1),
PorductName varchar(50) not null,
ProductDescription varchar(100) not null,
LastModified datetime not null,
AddedOn datetime not null,
ProductPrice money not null,
AddedBy int foreign key references CustomerDetails(CustomerId),
isDeleted bit,
ProductQuantity int,
ProductImage varchar(max)
)

alter table ProductDetails ADD LastModifiedBy int foreign key references CustomerDetails(CustomerId)

-- Product Category Detail
create table Categories(
CategoryId int primary key identity (10,1),
PorductId int foreign key references ProductDetails(PorductId),
CategoryName varchar(50) not null
)

-- Order Status
-- 1 Processing
-- 2 Placed
-- 3 OnGoing
-- 4 Delivered
-- 5 Cancelled
-- 6 Rejected
create table OrderStatus
(
StatusId int primary key identity,
StatusName varchar(20)
)

insert into OrderStatus values 
('Processing'),('Placed'),('OnGoing'),('Delivered'),('Cancelled'),('Rejected')

-- Order Details
create table OrderDetails(
OrderId int primary key identity (1,1),
PaymentId int unique,
CustomerId int foreign key references CustomerDetails(CustomerId),
OrderPlacedOn datetime not null,
LastModifiedOn datetime,
LastModifiedBy int foreign key references CustomerDetails(CustomerId),
OrderStatusId int foreign key references OrderStatus(StatusId) Default 1,
OrderMessage varchar(200),
)
