-- CREATE SCHEMA Security;
-- GRANT SELECT ON HumanResources.EmployeeDepartmentHistory TO User_Karmanov_571_2;
-- DROP FUNCTION Security.fn_employee_data_recording;

CREATE FUNCTION Security.fn_employee_data_recording(@DepartmentId SMALLINT)
    RETURNS TABLE
        WITH SCHEMABINDING
        AS
        RETURN SELECT 1 AS fn_employee_data_recording_result
               WHERE DATABASE_PRINCIPAL_ID() = DATABASE_PRINCIPAL_ID(N'User_Karmanov_571_2')
                 AND CAST(SESSION_CONTEXT(N'DepartmentId') AS SMALLINT) = @DepartmentId;
GO
CREATE SECURITY POLICY [Security].[EmployeeDepartmentHistory]
    ADD FILTER PREDICATE [Security].fn_employee_data_recording(DepartmentID) ON HumanResources.EmployeeDepartmentHistory
    WITH (STATE = ON)
DROP SECURITY POLICY Security.EmployeeDepartmentHistory;
GO
EXECUTE AS USER = 'User_Karmanov_571_2'
GO
EXEC sp_set_session_context @key=N'DepartmentId', @value=3
GO
SELECT E.LoginID, E.JobTitle, D.Name, D.DepartmentID
FROM HumanResources.Employee E
        JOIN HumanResources.EmployeeDepartmentHistory EDH on E.BusinessEntityID = EDH.BusinessEntityID
        JOIN HumanResources.Department D on D.DepartmentID = EDH.DepartmentID;