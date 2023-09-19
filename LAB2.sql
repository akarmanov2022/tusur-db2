-- Задание 1 (Вариант 1)
-- Часть 1
USE master;
GO
CREATE LOGIN Karmanov_571 WITH PASSWORD = '<Karmanov_571>';
GO
ALTER SERVER ROLE sysadmin ADD MEMBER Karmanov_571;

-- Часть 2
USE AdventureWorks2019;
GO
CREATE LOGIN Karmanov_without_select WITH PASSWORD = '<Karmanov_571>';
GO
CREATE USER user_without_select_1 FROM LOGIN Karmanov_without_select;
GO
DENY SELECT TO user_without_select_1;


-- Задание 2 (Вариант 1)
USE AdventureWorks2019;
GO
CREATE LOGIN Karmanov_571_3 WITH PASSWORD = '<Karmanov_571>';
GO
CREATE USER User_Karmanov_571_2 FOR LOGIN Karmanov_571_3;
GO
CREATE ROLE accountant;
GO
ALTER ROLE accountant ADD MEMBER User_Karmanov_571_2;

GRANT SELECT ON HumanResources.Department TO accountant;
GO
DENY INSERT, DELETE, UPDATE ON HumanResources.Department TO accountant;
GO
GRANT SELECT ON HumanResources.Employee TO accountant;
GO
DENY INSERT, DELETE, UPDATE ON HumanResources.Employee TO accountant;
GO
GRANT SELECT ON HumanResources.EmployeeDepartmentHistory TO accountant;
GO
DENY INSERT, DELETE, UPDATE ON HumanResources.EmployeeDepartmentHistory TO accountant;
GO
GRANT SELECT ON HumanResources.EmployeePayHistory TO accountant;
GO
DENY INSERT, DELETE, UPDATE ON HumanResources.EmployeePayHistory TO accountant;
GO
GRANT SELECT ON HumanResources.Shift TO accountant;
GO
DENY INSERT, DELETE, UPDATE ON HumanResources.Shift TO accountant;