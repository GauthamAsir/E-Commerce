-- Triggers
use ecommerce1
-- Role Details
CREATE or Alter TRIGGER trReadOnly_tblRoleDetails ON RoleDetails
    INSTEAD OF INSERT,
               UPDATE,
               DELETE
AS
BEGIN
    RAISERROR( 'Role Details table is read only.', 16, 1 )
    ROLLBACK TRANSACTION
END

-- Order Status
CREATE or Alter TRIGGER trReadOnly_tblOrderStatus ON OrderStatus
    INSTEAD OF INSERT,
               UPDATE,
               DELETE
AS
BEGIN
    RAISERROR( 'Order Status table is read only.', 16, 1 )
    ROLLBACK TRANSACTION
END
