USE [master]
GO
/****** Object:  Database [DailyJob]    Script Date: 17-Oct-18 01:18:03 ******/
CREATE DATABASE [DailyJob]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DailyJob', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DailyJob.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DailyJob_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DailyJob_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DailyJob] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DailyJob].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DailyJob] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DailyJob] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DailyJob] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DailyJob] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DailyJob] SET ARITHABORT OFF 
GO
ALTER DATABASE [DailyJob] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DailyJob] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DailyJob] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DailyJob] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DailyJob] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DailyJob] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DailyJob] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DailyJob] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DailyJob] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DailyJob] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DailyJob] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DailyJob] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DailyJob] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DailyJob] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DailyJob] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DailyJob] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DailyJob] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DailyJob] SET RECOVERY FULL 
GO
ALTER DATABASE [DailyJob] SET  MULTI_USER 
GO
ALTER DATABASE [DailyJob] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DailyJob] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DailyJob] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DailyJob] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DailyJob] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DailyJob', N'ON'
GO
ALTER DATABASE [DailyJob] SET QUERY_STORE = OFF
GO
USE [DailyJob]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DailyJob]
GO
/****** Object:  Table [dbo].[AdminSettings]    Script Date: 17-Oct-18 01:18:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminSettings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Type] [int] NOT NULL,
	[IncludeInCalculation] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminSettingsTypesDescriptions]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminSettingsTypesDescriptions](
	[Type] [int] NOT NULL,
	[Decription] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCosts]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientCosts](
	[ClientId] [int] NOT NULL,
	[CostType] [int] NOT NULL,
	[CostDate] [date] NOT NULL,
	[UserId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientServices]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientServices](
	[ClientId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Couriers]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Couriers](
	[CourierId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[LegalId] [nchar](13) NOT NULL,
	[Address] [nvarchar](150) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Name] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Place] [nvarchar](50) NOT NULL,
	[Municipality] [nvarchar](50) NOT NULL,
	[PIB] [nvarchar](13) NOT NULL,
	[LegalID] [nvarchar](13) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Activity] [nvarchar](100) NOT NULL,
	[Form] [nvarchar](30) NOT NULL,
	[ResponsiblePerson] [nvarchar](50) NOT NULL,
	[ResponsiblePersonPhone] [nvarchar](50) NOT NULL,
	[ResponsiblePersonMail] [nvarchar](50) NOT NULL,
	[PDV] [nvarchar](10) NOT NULL,
	[BookKeepingType] [nvarchar](10) NOT NULL,
	[Director] [nvarchar](150) NOT NULL,
	[Account] [nvarchar](150) NOT NULL,
	[EmployeesNumber] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[MainUserId] [int] NOT NULL,
	[SecondUserId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[AmountCode] [nvarchar](3) NOT NULL,
	[Slava] [nvarchar](50) NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[ResponsiblePersonBirthDate] [datetime] NOT NULL,
	[DeliveryMethod] [nvarchar](50) NOT NULL,
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityCode] [nvarchar](10) NOT NULL,
	[FormSubType] [nvarchar](50) NOT NULL,
	[AdditionalMails] [nvarchar](250) NULL,
	[CourierDay] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomersChanges]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersChanges](
	[ChangeNumber] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
	[OldValue] [nvarchar](50) NOT NULL,
	[NewValue] [nvarchar](50) NOT NULL,
	[ChangeDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomersReports]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersReports](
	[CustomerId] [int] NOT NULL,
	[ReportId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTimes]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTimes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Time] [decimal](18, 2) NOT NULL,
	[InsertionDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Firms]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[FirmId] [int] IDENTITY(1,1) NOT NULL,
	[FirmName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Offers](
	[OfferId] [int] IDENTITY(1,1) NOT NULL,
	[ContactPerson] [nvarchar](100) NOT NULL,
	[PIB] [nvarchar](9) NOT NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ServiceId] [nvarchar](50) NOT NULL,
	[HeardFrom] [nvarchar](150) NOT NULL,
	[IsSuccesful] [bit] NOT NULL,
	[Impression] [nvarchar](50) NOT NULL,
	[BackInfo] [nvarchar](50) NOT NULL,
	[Amount] [int] NOT NULL,
	[AmountCurrency] [nvarchar](3) NOT NULL,
	[IsOurCreation] [bit] NOT NULL,
	[Note] [nvarchar](150) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[MakeRent] [bit] NULL,
	[CompanyType] [nvarchar](50) NULL,
	[CompanySubType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PossibleCreations]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PossibleCreations](
	[CreationId] [int] IDENTITY(1,1) NOT NULL,
	[JobType] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[FormularDate] [datetime] NULL,
	[Mail] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[IsPaid] [bit] NOT NULL,
	[EndDate] [datetime] NULL,
	[IsDone] [bit] NOT NULL,
	[IsMailSent] [bit] NOT NULL,
	[IsAnswerSuccesful] [bit] NOT NULL,
	[ClientType] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](150) NULL,
	[PaymentMethod] [int] NULL,
	[PIB] [nvarchar](50) NULL,
	[Amount] [int] NULL,
	[CompanySubType] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportTypes]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTypes](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceId] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](50) NOT NULL,
	[ServiceDescription] [nvarchar](150) NOT NULL,
	[Price] [int] NOT NULL,
	[Type] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[TeamID] [int] NOT NULL,
	[TeamName] [nvarchar](50) NOT NULL,
	[TeamLeaderId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Times]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Times](
	[TimeId] [int] IDENTITY(1,1) NOT NULL,
	[TimeDescription] [nvarchar](150) NOT NULL,
	[TimeName] [nvarchar](50) NOT NULL,
	[Value] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trace]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trace](
	[Timestamp] [datetime] NOT NULL,
	[RequestUrl] [nvarchar](50) NOT NULL,
	[UserId] [int] NULL,
	[Request] [nvarchar](max) NULL,
	[Response] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[Gender] [nvarchar](1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[BirthDate] [datetime] NOT NULL,
	[EmploymentDate] [datetime] NOT NULL,
	[Slava] [nvarchar](50) NOT NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK__Users__3214EC0742451A45] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_System_Users_Username]    Script Date: 17-Oct-18 01:18:04 ******/
CREATE NONCLUSTERED INDEX [IX_System_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__CreationD__37A5467C]  DEFAULT (getdate()) FOR [CreationDate]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Firm]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Delete_Firm]
(
	@FirmId INT,  
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		DELETE
		FROM DBO.Firms
		WHERE FirmId = @FirmId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_Service]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Delete_Service]
(
	@ServiceId INT,  
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		DELETE
		FROM DBO.Services
		WHERE ServiceId = @ServiceId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Delete_User_Data]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Delete_User_Data]
(
	@UserId INT,  
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		DELETE
		FROM DBO.Users
		WHERE Id = @UserId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Get_AdminSettings]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_AdminSettings]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [Id]
      ,[Amount]
      ,[Type]
	  ,[IncludeInCalculation]
  FROM [DailyJob].[dbo].[AdminSettings]
end
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Changes]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Changes]
@CustomerNumber int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [ChangeNumber]
      ,[CustomerId]
      ,CONCAT(u.FirstName, ' ', u.LastName) as [User]
      ,[FieldName]
      ,[OldValue]
      ,[NewValue]
      ,[ChangeDate]
	FROM dbo.CustomersChanges c JOIN dbo.Users u on c.UserId = u.Id
	where CustomerId = @CustomerNumber
	order by ChangeDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Clients]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Clients]
(
	@Role int,
	@TeamId int
)
AS
BEGIN
	SET NOCOUNT ON;
	if(@Role != 1 )
		SELECT *, (SELECT SUM(time) 
					from dbo.CustomerTimes ct where ct.CustomerId = c.CustomerID 
											and  MONTH(ct.[InsertionDate]) =  MONTH(GETDATE()) AND YEAR(ct.[InsertionDate]) =  YEAR(GETDATE()) ) as TotalTime
											,
											(SELECT count(*) 
					from dbo.[ClientCosts] cc where cc.ClientId = c.CustomerID and cc.[CostType] = 1
											and  MONTH(cc.[CostDate]) =  MONTH(GETDATE()) AND YEAR(cc.[CostDate]) =  YEAR(GETDATE()) ) as TotaCourierVisits
		FROM dbo.Customers c
		where (c.MainUserId in ( select id from dbo.Users where TeamId = @TeamId)
			or c.SecondUserId in ( select id from dbo.Users where TeamId = @TeamId)) and c.Status = 1
	else
SELECT *, (SELECT SUM(time) 
					from dbo.CustomerTimes ct where ct.CustomerId = c.CustomerID 
											and  MONTH(ct.[InsertionDate]) =  MONTH(GETDATE()) AND YEAR(ct.[InsertionDate]) =  YEAR(GETDATE()) ) as TotalTime	
												,
											(SELECT count(*) 
					from dbo.[ClientCosts] cc where cc.ClientId = c.CustomerID and cc.[CostType] = 1
											and  MONTH(cc.[CostDate]) =  MONTH(GETDATE()) AND YEAR(cc.[CostDate]) =  YEAR(GETDATE()) ) as TotaCourierVisits
											FROM dbo.Customers c
end
GO
/****** Object:  StoredProcedure [dbo].[Get_All_ClientTimes]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_ClientTimes]
@CustomerNumber int,
@DateFrom datetime,
@DateTo datetime
AS
BEGIN
	SET NOCOUNT ON;
SELECT [Id]
      ,[CustomerId]
      ,[UserId]
      ,[Time]
      ,[InsertionDate]
  FROM [dbo].[CustomerTimes]
  WHERE [CustomerId] = @CustomerNumber and InsertionDate >= @DateFrom AND InsertionDate <= @DateTo
  ORDER BY InsertionDate desc
end
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Couriers]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get_All_Couriers]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT *
	FROM [dbo].[Couriers]
end
GO
/****** Object:  StoredProcedure [dbo].[Get_All_Users]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_Users]
(
	@TeamId int,
	@Role int
)
AS
BEGIN
	SET NOCOUNT ON;
	if(@Role != 1 )
		SELECT [Id]
		  ,[Username]
		  ,[Password]
		  ,[CreationDate]
		  ,[Email]
		  ,[FirstName]
		  ,[LastName]
		  ,[Address]
		  ,[City]
		  ,[PhoneNumber]
		  ,[Gender]
		  ,u.[TeamId]
		  ,t.[TeamName]
		  ,[BirthDate]
		  ,[EmploymentDate]
		  ,[Slava]
		  ,[Role]
		FROM dbo.Users u JOIN dbo.Teams t on u.TeamId = t.TeamID
		where Id in ( select id from dbo.Users where TeamId = @TeamId)
	ELSE
	SELECT [Id]
		  ,[Username]
		  ,[Password]
		  ,[CreationDate]
		  ,[Email]
		  ,[FirstName]
		  ,[LastName]
		  ,[Address]
		  ,[City]
		  ,[PhoneNumber]
		  ,[Gender]
		  ,u.[TeamId]
		  ,t.[TeamName]
		  ,[BirthDate]
		  ,[EmploymentDate]
		  ,[Slava]
		  ,[Role]
		FROM dbo.Users u JOIN dbo.Teams t on u.TeamId = t.TeamID
end
GO
/****** Object:  StoredProcedure [dbo].[Get_All_WorkerOrders]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_All_WorkerOrders]
@CustomerNumber int,
@DateFrom datetime,
@DateTo datetime
AS
BEGIN
	SET NOCOUNT ON;
SELECT [ClientId]
      ,[CostType]
      ,[CostDate]
      ,[UserId]
  FROM [dbo].ClientCosts
  WHERE [ClientId] = @CustomerNumber and [CostDate] >= @DateFrom AND [CostDate] <= @DateTo and CostType = 1
  ORDER BY [CostDate] desc
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Client_Reports]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Client_Reports]
(
	@CustomerNumber int
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT *, CAST(
             CASE 
                  When [ReportId] in (select [ReportId] from [dbo].[CustomersReports] where CustomerId = @CustomerNumber)
                     THEN 1 
                  ELSE 0 
             END AS bit) as [Using]
from  [dbo].[ReportTypes] 

	

end
GO
/****** Object:  StoredProcedure [dbo].[Get_Client_Services]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Client_Services]
@CustomerNumber int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT a.[ServiceId]
      ,[ServiceName]
      ,[ServiceDescription]
      ,[Price]
      ,[Type]
  FROM [dbo].[Services] a left join [dbo].[ClientServices] b on a.ServiceId = b.ServiceId
  WHERE b.[ClientId] = @CustomerNumber	
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Creations]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Creations]
(
	@TeamId int,
	@Role int
)
AS
BEGIN
	SET NOCOUNT ON;
	if(@Role != 1 )
		SELECT [CreationId]
		  ,[JobType]
		  ,[CreationDate]
		  ,[FormularDate]
		  ,[Mail]
		  ,[PhoneNumber]
		  ,[IsPaid]
		  ,[EndDate]
		  ,[IsDone]
		  ,[IsMailSent]
		  ,[IsAnswerSuccesful]
		  ,[ClientType]
		  ,[Name]
		  ,[UserId]
		  ,[Status]
          ,[Note]
          ,[PaymentMethod]
		  ,[PIB]
		  ,[Amount]
		  ,[CompanySubType]
	  FROM [DailyJob].[dbo].[PossibleCreations]
	  where [UserId] in ( select id from dbo.Users where TeamId = @TeamId)
	ELSE
	SELECT[CreationId]
		  ,[JobType]
		  ,[CreationDate]
		  ,[FormularDate]
		  ,[Mail]
		  ,[PhoneNumber]
		  ,[IsPaid]
		  ,[EndDate]
		  ,[IsDone]
		  ,[IsMailSent]
		  ,[IsAnswerSuccesful]
		  ,[ClientType]
		  ,[Name]
		  ,[UserId]
		  ,[Status]
		  ,[Note]
		  ,[PaymentMethod]
		  ,[PIB]
		  ,[Amount]
		  ,[CompanySubType]
	  FROM [DailyJob].[dbo].[PossibleCreations]
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Firms]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get_Firms]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT  [FirmId]
      ,[FirmName]
  FROM [DailyJob].[dbo].[Firms]
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Offers]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Offers]
(
	@TeamId int,
	@Role int
)
AS
BEGIN
	SET NOCOUNT ON;
	if(@Role != 1 )
			SELECT [OfferId]
		  ,[ContactPerson]
		  ,[PIB]
		  ,[Mail]
		  ,[PhoneNumber]
		  ,[CreationDate]
		  ,[ServiceId]
		  ,[HeardFrom]
		  ,[IsSuccesful]
		  ,[Impression]
		  ,[BackInfo]
		  ,[Amount]
		  ,[AmountCurrency]
		  ,[IsOurCreation]
		  ,[Note]
		  ,[UserId]
		  ,[Name]
		  ,[MakeRent]
		  ,[CompanyType]
          ,[CompanySubType]
	  FROM [DailyJob].[dbo].[Offers]
	  where [UserId] in ( select id from dbo.Users where TeamId = @TeamId)
	ELSE
	SELECT [OfferId]
		  ,[ContactPerson]
		  ,[PIB]
		  ,[Mail]
		  ,[PhoneNumber]
		  ,[CreationDate]
		  ,[ServiceId]
		  ,[HeardFrom]
		  ,[IsSuccesful]
		  ,[Impression]
		  ,[BackInfo]
		  ,[Amount]
		  ,[AmountCurrency]
		  ,[IsOurCreation]
		  ,[Note]
		  ,[UserId]
		  ,[Name]
		  ,[MakeRent]
		  ,[CompanyType]
          ,[CompanySubType]
	  FROM [DailyJob].[dbo].[Offers]
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Services]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Get_Services]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [ServiceId]
      ,[ServiceName]
      ,[ServiceDescription]
	  ,[Price]
	  ,[Type]
  FROM [DailyJob].[dbo].[Services]
end
GO
/****** Object:  StoredProcedure [dbo].[Get_Times]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Get_Times]
AS
BEGIN
	SET NOCOUNT ON;
	select [TimeId]
      ,[TimeDescription]
      ,[TimeName]
      ,[Value]
  FROM [DailyJob].[dbo].[Times]
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Client_Data]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Client_Data]
(
	@CustomerID int,
	@Name nvarchar(150) = '',
	@Address nvarchar(50) = '', 
	@Place nvarchar(50) = '',
	@Municipality nvarchar(50) = '',
	@PIB nvarchar(13) = '',
	@LegalID nvarchar(13) = '',
	@CreationDate datetime,
	@Activity nvarchar(100) = '',
	@ActivityCode nvarchar(10) = '',
	@Form nvarchar(30) = '',
	@FormSubType nvarchar(50) = '',
	@ResponsiblePerson nvarchar(50) = '',
	@ResponsiblePersonBirthDate datetime,
	@ResponsiblePersonMail nvarchar(50) = '',
	@ResponsiblePersonPhone nvarchar(50) = '',
	@PDV nvarchar(10) = '',
	@BookKeepingType nvarchar(10) = '',
	@Director nvarchar(150) = '',
	@Account nvarchar(150) = '',
	@EmployeesNumber int = -1,
	@StartDate datetime ,
	@MainUserId int = -1,
	@SecondUserId int = -1,
	@Amount int = -1,
	@AmountCode nvarchar(3) = '',
	@Slava nvarchar(50) = '',
	@BirthDate datetime,
	@DeliveryMethod nvarchar(50) = '',
	@AdditionalMails nvarchar(250) = '',
	@CourierDay int = 1,
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''

	BEGIN TRY
		INSERT INTO [dbo].[Customers]
           ([Name]
           ,[Address]
           ,[Place]
           ,[Municipality]
           ,[PIB]
           ,[LegalID]
           ,[CreationDate]
           ,[Activity]
           ,[Form]
           ,[ResponsiblePerson]
           ,[ResponsiblePersonPhone]
           ,[ResponsiblePersonMail]
           ,[PDV]
           ,[BookKeepingType]
           ,[Director]
           ,[Account]
           ,[EmployeesNumber]
           ,[StartDate]
           ,[MainUserId]
           ,[SecondUserId]
           ,[Amount]
           ,[AmountCode]
           ,[Slava]
           ,[BirthDate]
           ,[ResponsiblePersonBirthDate]
           ,[DeliveryMethod]
           ,[ActivityCode]
           ,[FormSubType]
           ,[AdditionalMails]
		   ,[CourierDay])
     VALUES
           (@Name
			,@Address 
			,@Place 
			,@Municipality
			,@PIB
			,@LegalID
           ,GETDATE()
           ,@Activity
           ,@Form
           ,@ResponsiblePerson
           ,@ResponsiblePersonPhone
           ,@ResponsiblePersonMail
           ,@PDV
           ,''
           ,@Director
           ,@Account
           ,@EmployeesNumber
           ,@StartDate
           ,@MainUserId
           ,@SecondUserId
           ,@Amount
           ,@AmountCode
           ,@Slava
           ,@BirthDate
           ,@ResponsiblePersonBirthDate
           ,@DeliveryMethod
           ,@ActivityCode
           ,@FormSubType
           ,@AdditionalMails
		   ,@CourierDay)

	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Clients_Changes]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Clients_Changes]
(
	@ChangeName NVARCHAR(250),
    @OldValue NVARCHAR(250),
	@NewValue NVARCHAR(250),
	@CustomerId int,
	@UserId int,
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		INSERT INTO [DailyJob].[dbo].[CustomersChanges](
	   [CustomerId]
      ,[UserId]
      ,[FieldName]
      ,[OldValue]
      ,[NewValue]
	  ,[ChangeDate])
		VALUES(@CustomerId,@UserId,@ChangeName, 
					@OldValue, @NewValue, GETDATE());
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Clients_Times]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Clients_Times]
(
	@CustomerId int,
	@UserId int,
	@Time decimal(18,2),
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		INSERT INTO [DailyJob].[dbo].[CustomerTimes](
	   [CustomerId]
      ,[UserId]
      ,[Time]
      ,[InsertionDate])
		VALUES(@CustomerId,@UserId,@Time, GETDATE());
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Clients_WorkerOrders]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Clients_WorkerOrders](
	@CustomerId int,
	@UserId int,

	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		INSERT INTO [dbo].[ClientCosts](
	   [ClientId]
      ,[CostType]
      ,[CostDate]
      ,[UserId])
		VALUES(@CustomerId,1,GETDATE(), @UserId);
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_Firm]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Firm]
(
	@FirmName NVARCHAR(150),
	
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		INSERT INTO [dbo].[Firms]
           ([FirmName])
     VALUES
           (@FirmName)

	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end

GO
/****** Object:  StoredProcedure [dbo].[Insert_Service]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Service]
(
	@ServiceName NVARCHAR(50),
	@ServiceDescription  NVARCHAR(150),
	@Price int,
	@Type int,

	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		
	INSERT INTO [dbo].[Services]
			   ([ServiceName]
			   ,[ServiceDescription]
			   ,[Price]
			   ,[Type])
		 VALUES
			   (@ServiceName
			   ,@ServiceDescription
			   ,@Price
			   ,@Type)
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end

GO
/****** Object:  StoredProcedure [dbo].[Insert_Time]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_Time]
(
	@TimeDescription NVARCHAR(150),
	@TimeName NVARCHAR(150),
	@Value int,
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		INSERT INTO [dbo].[Times]
           ([TimeDescription]
           ,[TimeName]
           ,[Value])
     VALUES
           (@TimeDescription
           ,@TimeName
           ,@Value)

	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Insert_User_Data]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Insert_User_Data]
(
	@UserName NVARCHAR(50),
    @Password NVARCHAR(MAX),
	@FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @BirthDate DATETIME,
    @Address NVARCHAR(50),
    @City  NVARCHAR(50),
    @Gender NVARCHAR(1),
    @Email NVARCHAR(50),
    @Slava NVARCHAR(50),
	@EmploymentDate DATETIME,
	@TeamId int,
	@Role int,
	--@PhoneNumber NVARCHAR(20),
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
	--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] ON;  
		INSERT INTO [DailyJob].[dbo].[Users](
      [Username]
      ,[Password]
      ,[CreationDate]
      ,[Email]
      ,[FirstName]
      ,[LastName]
      ,[Address]
      ,[City]
      ,[PhoneNumber]
      ,[Gender]
      ,[TeamId]
      ,[BirthDate]
      ,[EmploymentDate]
      ,[Slava]
      ,[Role])
		VALUES(@UserName,@Password,GETDATE ( ), 
					@Email, @FirstName, @LastName, @Address, @City, 
					'', 
					@Gender, @TeamId, @BirthDate, 
					@EmploymentDate, @Slava, @Role);
	--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] OFF
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[InsertCreation]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertCreation]
(
	@JobType NVARCHAR(MAX),
	@Mail NVARCHAR(50) = '',
    @Name NVARCHAR(MAX) = '',
	@PhoneNumber NVARCHAR(50) = '',
	@ClientType int = -1,
	@UserId int = -1,
	@PaymentMethod int = -1,
	@Note NVARCHAR(150)  = '',
	@PIB NVARCHAR(150) = '',
	@Amount int = 0,
	@CompanySubType NVARCHAR(150) = '',

	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
	--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] ON; 
	INSERT INTO [dbo].[PossibleCreations]
           ([JobType]
           ,[CreationDate]
           ,[FormularDate]
           ,[Mail]
           ,[PhoneNumber]
           ,[IsPaid]
           ,[EndDate]
           ,[IsDone]
           ,[IsMailSent]
           ,[IsAnswerSuccesful]
           ,[ClientType]
           ,[Name]
           ,[UserId]
		   ,[Status]
           ,[Note]
           ,[PaymentMethod]
		   ,[PIB]
		  ,[Amount]
		  ,[CompanySubType])
     VALUES
           (@JobType
           ,GETDATE()
           ,NULL
           ,@Mail
           ,@PhoneNumber
           ,0
           ,null
           ,0
           ,0
           ,0
           ,@ClientType
           ,@Name
           ,@UserId
		   ,1
          ,@Note
          ,@PaymentMethod
		  ,@PIB
		  ,@Amount
		  ,@CompanySubType)
	--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] OFF
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[InsertOffer]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertOffer]
(
	@ContactPerson nvarchar(100) = '',
	@PIB nvarchar(9)  = '',
	@Mail nvarchar(50)  = '',
	@PhoneNumber nvarchar(50)  = '',
	@ServiceId nvarchar(150)  = '',
	@HeardFrom nvarchar(150)  = '',
	@Impression nvarchar(50)  = '',
	@BackInfo nvarchar(50)  = '',
	@Amount int = 0,
	@AmountCurrency nvarchar(3)  = '',
	@IsOurCreation bit = 0,
	@Note nvarchar(150)  = '',
	@UserId int = 0,
	@Name nvarchar(50)  = '',
	@MakeRent bit = 0,
	@CompanyType nvarchar(150)  = '',
	@CompanySubType nvarchar(150)  = '',


	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
	--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] ON; 

		INSERT INTO [dbo].[Offers]
				   ([ContactPerson]
				   ,[PIB]
				   ,[Mail]
				   ,[PhoneNumber]
				   ,[CreationDate]
				   ,[ServiceId]
				   ,[HeardFrom]
				   ,[IsSuccesful]
				   ,[Impression]
				   ,[BackInfo]
				   ,[Amount]
				   ,[AmountCurrency]
				   ,[IsOurCreation]
				   ,[Note]
				   ,[UserId]
				   ,[Name]
				   ,[MakeRent]
				   ,[CompanyType]
				   ,[CompanySubType]
				   )
			 VALUES
				   (@ContactPerson
				   ,@PIB
				   ,@Mail
				   ,@PhoneNumber
				   ,GETDATE()
				   ,@ServiceId
				   ,@HeardFrom
				   ,0
				   ,@Impression
				   ,@BackInfo
				   ,@Amount
				   ,@AmountCurrency
				   ,@IsOurCreation
				   ,@Note
				   ,@UserId
				   ,@Name
				   ,@MakeRent
					,@CompanyType
					,@CompanySubType
				   )
			--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] OFF
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[MakeDboLog]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MakeDboLog]
(
	@Action NVARCHAR(50),
	@Request  NVARCHAR(MAX),
	@Response  NVARCHAR(MAX),
	@UserId int
)
AS
BEGIN
INSERT INTO [dbo].[Trace]
           ([Timestamp]
           ,[RequestUrl]
           ,[UserId]
           ,[Request]
           ,[Response])
     VALUES
           (GETDATE()
           ,@Action
           ,@UserId
           ,@Request
           ,@Response)
end

GO
/****** Object:  StoredProcedure [dbo].[SendMail]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SendMail]
(
	@CreationId INT,  
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		UPDATE  [DailyJob].[dbo].[PossibleCreations]
		SET [IsMailSent] = 1,
			[FormularDate] = Getdate()
		WHERE CreationId = @CreationId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Client_Data]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Client_Data]
(
	@CustomerID int,
	@Name nvarchar(150) = '',
	@Address nvarchar(50) = '', 
	@Place nvarchar(50) = '',
	@Municipality nvarchar(50) = '',
	@PIB nvarchar(13) = '',
	@LegalID nvarchar(13) = '',
	@CreationDate datetime,
	@Activity nvarchar(100) = '',
	@ActivityCode nvarchar(10) = '',
	@Form nvarchar(30) = '',
	@FormSubType nvarchar(50) = '',
	@ResponsiblePerson nvarchar(50) = '',
	@ResponsiblePersonBirthDate datetime,
	@ResponsiblePersonMail nvarchar(50) = '',
	@ResponsiblePersonPhone nvarchar(50) = '',
	@PDV nvarchar(10) = '',
	@BookKeepingType nvarchar(10) = '',
	@Director nvarchar(150) = '',
	@Account nvarchar(150) = '',
	@EmployeesNumber int = -1,
	@StartDate datetime ,
	@MainUserId int = -1,
	@SecondUserId int = -1,
	@Amount int = -1,
	@AmountCode nvarchar(3) = '',
	@Slava nvarchar(50) = '',
	@BirthDate datetime,
	@DeliveryMethod nvarchar(50) = '',
	@AdditionalMails nvarchar(250) = '',
	@CourierDay int  = -1,
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''

	if (@Name is not null and @Name != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET [Name] = @Name 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@AdditionalMails is not null and @AdditionalMails != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET AdditionalMails = @AdditionalMails 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH


	if (@Address is not null and @Address != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET [Address] = @Address 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

	if (@Place is not null and @Place != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Place = @Place 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@Municipality is not null and @Municipality != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Municipality = @Municipality 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@PIB is not null and @PIB != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET PIB = @PIB 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@LegalID is not null and @LegalID != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET LegalID = @LegalID 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH


		if (@Activity is not null and @Activity != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Activity = @Activity 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@ActivityCode is not null and @ActivityCode != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET [ActivityCode] = @ActivityCode 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@Form is not null and @Form != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Form = @Form 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@FormSubType is not null and @FormSubType != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET [FormSubType] = @FormSubType 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@ResponsiblePerson is not null and @ResponsiblePerson != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET ResponsiblePerson = @ResponsiblePerson 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@ResponsiblePersonBirthDate is not null)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET [ResponsiblePersonBirthDate] = @ResponsiblePersonBirthDate 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@ResponsiblePersonMail is not null and @ResponsiblePersonMail != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET ResponsiblePersonMail = @ResponsiblePersonMail 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@ResponsiblePersonPhone is not null and @ResponsiblePersonPhone != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET ResponsiblePersonPhone = @ResponsiblePersonPhone 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@CreationDate is not null)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET CreationDate = @CreationDate 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@StartDate is not null)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET StartDate = @StartDate 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@PDV is not null and @PDV != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET PDV = @PDV 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

	if (@BookKeepingType is not null and @BookKeepingType != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET BookKeepingType = @BookKeepingType 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@Director is not null and @Director != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Director = @Director 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@Account is not null and @Account != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Account = @Account 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@EmployeesNumber is not null and @EmployeesNumber != -1)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET EmployeesNumber = @EmployeesNumber 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH
		
			if (@MainUserId is not null and @MainUserId != -1)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET MainUserId = @MainUserId 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@CourierDay is not null and @CourierDay != -1)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET CourierDay = @CourierDay 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@SecondUserId is not null and @SecondUserId != -1)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET SecondUserId = @SecondUserId 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

				if (@Amount is not null and @Amount != -1)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Amount = @Amount 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@AmountCode is not null and @AmountCode != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET AmountCode = @AmountCode 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@Slava is not null and @Slava != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET Slava = @Slava 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

		if (@BirthDate is not null)
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET BirthDate = @BirthDate 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH

			if (@DeliveryMethod is not null and @DeliveryMethod != '')
	BEGIN TRY
			UPDATE [DailyJob].[dbo].[Customers]
			SET DeliveryMethod = @DeliveryMethod 	
			WHERE CustomerID = @CustomerID
		END TRY
		BEGIN CATCH
			SELECT @ERROR_CODE = ERROR_NUMBER(),
				   @ERROR = ERROR_MESSAGE()
		END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Client_Services]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Client_Services]
(
	@CustomerID int,
	@ServiceIds nvarchar(MAX),
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''

	Declare @delimiter As Varchar(1)=','
	Declare @Temp as Table ( item varchar(100))
	Declare @i as int=0
	Declare @j as int=0
	
	BEGIN TRY
		DELETE FROM [dbo].[ClientServices] WHERE ClientId = @CustomerID

		Set @j = (Len(@ServiceIds) - len(REPLACE(@ServiceIds,@delimiter,'')))
		While @i  < = @j
		Begin
		  if @i  < @j
		  Begin
			  Insert into @Temp 
			  Values(SUBSTRING(@ServiceIds,1,Charindex(@delimiter,@ServiceIds,1)-1))
			  set @ServiceIds = right(@ServiceIds,(len(@ServiceIds)- Charindex(@delimiter,@ServiceIds,1)))
		  End
		  Else
		  Begin
			 Insert into @Temp Values(@ServiceIds)
		  End

		 Set @i = @i + 1
		End

		INSERT INTO [dbo].[ClientServices]
		SELECT  @CustomerID, item
		FROM    @Temp
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Client_Status]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Update_Client_Status]
(
	@CustomerID int,
	@Status int,
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''

	
	BEGIN TRY
		UPDATE dbo.Customers
		SET Status = @Status
		WHERE CustomerID = @CustomerID
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Service]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Service]
(
	@ServiceId int,
	
	@ServiceDescription  NVARCHAR(150),
	@Price int,
	@Type int,
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY

		UPDATE [dbo].[Services]
		   SET [ServiceDescription] = @ServiceDescription
			  ,[Price] = @Price
			  ,[Type] = @Type
		 WHERE ServiceId = @ServiceId

	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Settings]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Update_Settings]
(
	@SettingId INT,  
	@IncludeInCalculation bit,
    @Amount decimal(18,2),
   
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		UPDATE [dbo].[AdminSettings]
		   SET [Amount] = @Amount
			  ,[IncludeInCalculation] = @IncludeInCalculation
		 WHERE [ID] = @SettingId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Update_Time]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_Time]
(
	@TimeDescription NVARCHAR(150),
	@TimeId int,
	@Value int,
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		update [dbo].[Times]
        set TimeDescription = @TimeDescription,
			[Value] = @Value
		where timeId = @TimeId

	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[Update_User_Data]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Update_User_Data]
(
	@UserId INT,  
	@FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @BirthDate DATETIME,
    @Address NVARCHAR(50),
    @City  NVARCHAR(50),
    @Gender NVARCHAR(1),
    @Email NVARCHAR(50),
    @Slava NVARCHAR(50),
    @Password NVARCHAR(MAX),
	@Role int,
	@TeamId int,
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		UPDATE [DailyJob].[dbo].[Users]
		SET [FirstName] = @FirstName, 
			[LastName] = @LastName,
			[BirthDate] = @BirthDate,
			[Address] = @Address,
			[City] = @City,
			[Gender] = @Gender,
			[Email] = @Email,
			[Slava] = @Slava,
			[Password] = @Password,
			[Role] = @Role,
			[TeamId] = @TeamId
		WHERE Id = @UserId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCreation]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCreation]
(
	@CreationId INT,
	@JobType NVARCHAR(MAX) = '',
	@Mail NVARCHAR(50) = '',
    @Name NVARCHAR(MAX) = '',
	@PhoneNumber NVARCHAR(50) = '',
	@ClientType int = 1,
	@UserId int = 1,
	@PaymentMethod int = 1,
	@Note NVARCHAR(150) = '',
	@PIB NVARCHAR(150) = '',
	@Amount int = 0,
	@CompanySubType NVARCHAR(150) = '',

	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
	--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] ON; 
	UPDATE [dbo].[PossibleCreations]
	SET JobType = @JobType
           ,Mail = @Mail
           ,PhoneNumber = @PhoneNumber
           ,ClientType = @ClientType
           ,[Name] = @Name
           ,UserId = @UserId
		   ,PaymentMethod = @PaymentMethod
		   ,Note = @Note
		   ,PIB = @PIB
		   ,Amount = @Amount
		   ,CompanySubType = @CompanySubType
	where [CreationId] = @CreationId
	--SET IDENTITY_INSERT [DailyJob].[dbo].[Users] OFF
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCreationStatus]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdateCreationStatus]
(
	@CreationId INT,  
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		UPDATE  [DailyJob].[dbo].[PossibleCreations]
		SET [IsAnswerSuccesful] = 1
		WHERE CreationId = @CreationId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateDoneStatus]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateDoneStatus]
(
	@CreationId INT,  
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		UPDATE  [DailyJob].[dbo].[PossibleCreations]
		SET IsDone = 1,
			[EndDate] = GetDATE()
		WHERE CreationId = @CreationId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdatePaymentStatus]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[UpdatePaymentStatus]
(
	@CreationId INT,  
	
	@ERROR NVARCHAR(MAX) OUT,
	@ERROR_CODE INT OUT 
)
AS
BEGIN
	SET @ERROR_CODE = 0
	SET @ERROR = ''
	BEGIN TRY
		UPDATE  [DailyJob].[dbo].[PossibleCreations]
		SET [IsPaid] = 1
		WHERE CreationId = @CreationId
	END TRY
	BEGIN CATCH
		SELECT @ERROR_CODE = ERROR_NUMBER(),
		       @ERROR = ERROR_MESSAGE()
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[usp_Login]    Script Date: 17-Oct-18 01:18:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Login]
(
	@UserName NVARCHAR(50),  
	@PassWord NVARCHAR(50)
)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT [Id]
      ,[Username]
      ,[Password]
      ,[CreationDate]
      ,[Email]
      ,[FirstName]
      ,[LastName]
      ,[Address]
      ,[City]
      ,[PhoneNumber]
      ,[Gender]
      ,u.[TeamId]
	  ,t.[TeamName]
	  ,[BirthDate]
      ,[EmploymentDate]
      ,[Slava]
      ,[Role]
	FROM dbo.Users u JOIN dbo.Teams t on u.TeamId = t.TeamID
	WHERE [UserName] = @UserName AND [Password] = @PassWord COLLATE SQL_Latin1_General_CP1_CS_AS
end
GO
USE [master]
GO
ALTER DATABASE [DailyJob] SET  READ_WRITE 
GO
