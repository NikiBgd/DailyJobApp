USE [DailyJob]
GO

/****** Object:  StoredProcedure [dbo].[GetBillingsByYear]    Script Date: 06/02/2019 23:27:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetWorkTempoByEmployeeId]
	@EmployeeID int,
	@Month int,
    @Year int
AS   

    SET NOCOUNT ON;  
SELECT * FROM [DailyJob].[dbo].[EmployeeWorkTempo] where Year(Date) = @Year AND Month(Date) = @Month AND EmployeeID = @EmployeeID


GO






USE [DailyJob]
GO

/****** Object:  StoredProcedure [dbo].[GetBillingsByYear]    Script Date: 06/02/2019 23:27:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetEmployeesWorkTempo]
    @Year int
AS   

    SET NOCOUNT ON;  
SELECT * FROM [DailyJob].[dbo].[EmployeeWorkTempo] where Year(Date) = @Year


GO





USE [DailyJob]
GO

/****** Object:  StoredProcedure [dbo].[GetBillingsByYear]    Script Date: 06/02/2019 23:27:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetAllWorkTempoStatuses]
AS   

    SET NOCOUNT ON;  
SELECT * FROM [DailyJob].[dbo].[WorkTempoStatus]


GO







USE [DailyJob]
GO

/****** Object:  StoredProcedure [dbo].[GetBillingsByYear]    Script Date: 06/02/2019 23:27:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetWorkTempoByEmployeeIdAndDate]
@EmployeeID int,
@Date date
AS   

    SET NOCOUNT ON;  
SELECT * FROM [DailyJob].[dbo].[EmployeeWorkTempo] where EmployeeID = @EmployeeID AND Date = @Date


GO






USE [DailyJob]
GO

/****** Object:  StoredProcedure [dbo].[GetBillingsByYear]    Script Date: 06/02/2019 23:27:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InsertWorkTempo]
@EmployeeID int,
@Date date,
@StatusID int
AS   

    SET NOCOUNT ON;  
INSERT INTO [DailyJob].[dbo].[EmployeeWorkTempo] (EmployeeID, Date, StatusID) VALUES (@EmployeeID, @Date, @StatusID)


GO






USE [DailyJob]
GO

/****** Object:  StoredProcedure [dbo].[GetBillingsByYear]    Script Date: 06/02/2019 23:27:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[UpdateWorkTempo]
@EmployeeID int,
@Date date,
@StatusID int
AS   

    SET NOCOUNT ON;  
 UPDATE [DailyJob].[dbo].[EmployeeWorkTempo] SET StatusID = @StatusID where EmployeeID = @EmployeeID AND Date = @Date


GO





USE [DailyJob]
GO

/****** Object:  StoredProcedure [dbo].[GetBillingsByYear]    Script Date: 07/02/2019 00:12:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetAllEmployees]

AS   

    SET NOCOUNT ON;  
SELECT * FROM [DailyJob].[dbo].[Users]



GO

