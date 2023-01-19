-- SPs

use ecommerce1
-- Login
create proc sp_login(@email varchar(30),@password varchar(50),@success int output,@roleid int output, @cid int output,@custName varchar(50) output)
as begin
declare @loggedpass binary(64),@actualpass binary(64), @custid int
set @custid = (select CustomerId from CustomerDetails where Email=@email)
set @actualpass=(select LoginPassword from LoginCredentials where CustomerId=@custid)
set @loggedpass = HASHBYTES('SHA2_512',@password)
if (@loggedpass=@actualpass)
begin
set @success=1
set @custName = (select CONCAT(FirstName ,' ', LastName) from CustomerDetails where CustomerId = @custid)
set @roleid=(select RoleId from CustomerDetails where CustomerId=@custid)
set @cid = @custid
end
else
begin
set @success = 0
set @custName = NULL
set @roleid = -1
end
end

declare @s int,@cid int, @r int, @c varchar(50)
begin
exec sp_login 'gauthamasir@gmail.com', '1234', @s output, @r output, @cid output, @c output
print @s
print @c
print @cid
print @r
end

-- Add Login credentials into table 
create proc sp_AddCustIdandPassword(@custid int,@password varchar(25))
as begin
insert into LoginCredentials(CustomerId, LoginPassword) values(@custid,HASHBYTES('SHA2_512',@password))
end

declare @s int, @c int, @m varchar(max)
begin
exec sp_AddCustomer 'Gautham04', 'Gautham', 'Asir', '2000/04/12', '8268154625', 'gauthamasir@gmail.com', 4, '1234', @s output, @c output, @m output
print @m
print @s
print @c
end

-- Register / Add Customer
create or alter proc sp_AddCustomer(@cUserName varchar(25), @fName varchar(25), 
	@lName varchar(25), @dob date, @phone varchar(25), @email varchar(30), @roleId int, @pass varchar(50), 
	@success bit output, @custId int output, @message varchar(max) output)
as begin
	set @success = 0
	set @custId = 0
	set @message = ''
	BEGIN TRY
		insert into CustomerDetails (Username, FirstName, LastName, DateOfBirth, ContactNo, Email) 
		values(@cUserName, @fName, @lName, @dob, @phone, @email)

		if(@@ROWCOUNT>0)
			set @custId  = SCOPE_IDENTITY()	
			insert into LoginCredentials(CustomerId, LoginPassword) values (SCOPE_IDENTITY(), HASHBYTES('SHA2_512',@pass))
			if(@@ROWCOUNT >0) 
				begin
					set @success=1
				end
	END TRY
	BEGIN CATCH
	set @message = ERROR_MESSAGE()
	set @success = 0
	set @custId = 0
	END CATCH
end

-- Get All Available Roles
create or alter proc sp_GetAvailableRoles
as begin
select RoleId, RoleName from RoleDetails where RoleId <> 1
end

-- Get All Products
create or alter proc sp_GetAllProducts
as begin
select * from ProductDetails
end

exec sp_GetAllProducts

-- Add Product
create or alter proc sp_AddProduct(@pName varchar(50), @pDesc varchar(100), 
	@pPrice money, @AddedBy int, @pQuantity int, @pImage varchar(max), @success bit output)
as begin
set @success=0
insert into ProductDetails (PorductName, ProductDescription, LastModified, 
	AddedOn, ProductPrice, AddedBy, isDeleted, ProductQuantity, ProductImage) 
	values(@pName, @pDesc, GETDATE(), GETDATE(), @pPrice, @AddedBy, 0, @pQuantity, @pImage)

if(@@ROWCOUNT>0)
	begin
	set @success=1
	end
end

declare @s int
begin
exec sp_AddProduct 'Pepsi', 'Cold Bevarage', 45.12, 1000, 10, 'https://toppng.com/uploads/preview/pepsi-11528331449u5hyzmfwnd.png', @s output
print @s
select * from ProductDetails
end

declare @s int
begin
exec sp_AddProduct 'Coca Cola', 'Cold Bevarage', 40, 1000, 5, 'https://static8.depositphotos.com/1179869/817/i/450/depositphotos_8170202-stock-photo-coca-cola.jpg', @s output
print @s
select * from ProductDetails
end

-- Get Customer Details By ID
create or alter proc sp_GetCustomerDetailsById(@cid int)
as begin
select * from CustomerDetails where CustomerId = @cid
end

-- Get Customer Details By ID
create or alter proc sp_GetCustomerDetailsByEmail(@email varchar(30))
as begin
select * from CustomerDetails where Email = @email
end

exec sp_GetCustomerDetailsById 1001
exec sp_GetCustomerDetailsByEmail 'mellowradan@gmail.com'