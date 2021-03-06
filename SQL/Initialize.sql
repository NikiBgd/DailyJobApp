USE [master]
GO
/****** Object:  Database [DailyJob]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[AdminSettings]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[AdminSettingsTypesDescriptions]    Script Date: 17-Oct-18 01:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminSettingsTypesDescriptions](
	[Type] [int] NOT NULL,
	[Decription] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientCosts]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[ClientServices]    Script Date: 17-Oct-18 01:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientServices](
	[ClientId] [int] NOT NULL,
	[ServiceId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Couriers]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[CustomersChanges]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[CustomersReports]    Script Date: 17-Oct-18 01:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersReports](
	[CustomerId] [int] NOT NULL,
	[ReportId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTimes]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[Firms]    Script Date: 17-Oct-18 01:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Firms](
	[FirmId] [int] IDENTITY(1,1) NOT NULL,
	[FirmName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Offers]    Script Date: 17-Oct-18 01:38:15 ******/
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
/****** Object:  Table [dbo].[PossibleCreations]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  Table [dbo].[ReportTypes]    Script Date: 17-Oct-18 01:38:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportTypes](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[ReportName] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  Table [dbo].[Teams]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  Table [dbo].[Times]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  Table [dbo].[Trace]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 17-Oct-18 01:38:16 ******/
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
SET IDENTITY_INSERT [dbo].[AdminSettings] ON 
GO
INSERT [dbo].[AdminSettings] ([Id], [Amount], [Type], [IncludeInCalculation]) VALUES (1, CAST(220.00 AS Decimal(18, 2)), 1, 1)
GO
INSERT [dbo].[AdminSettings] ([Id], [Amount], [Type], [IncludeInCalculation]) VALUES (2, CAST(30.00 AS Decimal(18, 2)), 2, 1)
GO
INSERT [dbo].[AdminSettings] ([Id], [Amount], [Type], [IncludeInCalculation]) VALUES (3, CAST(45.00 AS Decimal(18, 2)), 3, 1)
GO
SET IDENTITY_INSERT [dbo].[AdminSettings] OFF
GO
INSERT [dbo].[AdminSettingsTypesDescriptions] ([Type], [Decription]) VALUES (1, N'WorkerHourCost')
GO
INSERT [dbo].[AdminSettingsTypesDescriptions] ([Type], [Decription]) VALUES (2, N'OneMailCost')
GO
INSERT [dbo].[AdminSettingsTypesDescriptions] ([Type], [Decription]) VALUES (3, N'OneMinutePhoneCallCost')
GO
INSERT [dbo].[ClientCosts] ([ClientId], [CostType], [CostDate], [UserId]) VALUES (1024, 1, CAST(N'2018-09-03' AS Date), 1)
GO
INSERT [dbo].[ClientCosts] ([ClientId], [CostType], [CostDate], [UserId]) VALUES (1024, 1, CAST(N'2018-09-03' AS Date), 1)
GO
INSERT [dbo].[ClientCosts] ([ClientId], [CostType], [CostDate], [UserId]) VALUES (1024, 1, CAST(N'2018-09-03' AS Date), 1)
GO
INSERT [dbo].[ClientCosts] ([ClientId], [CostType], [CostDate], [UserId]) VALUES (4, 1, CAST(N'2018-10-13' AS Date), 1)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (1024, 1)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (1024, 5)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (1024, 6)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (8, 9)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (4, 1)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (4, 2)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (4, 5)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (4, 10)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (1028, 1)
GO
INSERT [dbo].[ClientServices] ([ClientId], [ServiceId]) VALUES (1028, 10)
GO
SET IDENTITY_INSERT [dbo].[Couriers] ON 
GO
INSERT [dbo].[Couriers] ([CourierId], [FirstName], [LastName], [LegalId], [Address]) VALUES (1, N'Bogdan', N'Stojkov', N'0509959170037', N'Dr Drage Locic 8/3/17')
GO
INSERT [dbo].[Couriers] ([CourierId], [FirstName], [LastName], [LegalId], [Address]) VALUES (3, N'Milos', N'Bosic', N'0509959110018', N'Dr Drage Ločić 008/1/6')
GO
INSERT [dbo].[Couriers] ([CourierId], [FirstName], [LastName], [LegalId], [Address]) VALUES (4, N'Milan', N'Basaric', N'3009947172660', N'Bulevar Kralja Aleksandra 496/3 i')
GO
INSERT [dbo].[Couriers] ([CourierId], [FirstName], [LastName], [LegalId], [Address]) VALUES (5, N'Svetislav', N'Nikolic', N'0411964742014', N'Miloja Zakića 050/01/006')
GO
SET IDENTITY_INSERT [dbo].[Couriers] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'Jedno jako kul ime 2 xD', N'Dzona Kenedija 37', N'Beograd', N'Novi Beograd', N'102347211', N'06308833', CAST(N'1992-11-30T00:00:00.000' AS DateTime), N'Trgovina na malo manje', N'Preduzetnik', N'Veljko Car', N'-', N'odgovorno.lice1@gmail.com', N'mesecni', N'dvojno', N'Veljko Carina', N'125-0000001735646-24,105-0000002287529-99', 24, CAST(N'2018-02-22T00:00:00.000' AS DateTime), 1, 1, 115, N'RSD', N'NikoLA', CAST(N'1992-11-12T00:00:00.000' AS DateTime), CAST(N'1969-09-01T00:00:00.000' AS DateTime), N'kurir', 4, N'9989', N'Samooporezivanje', N'11@gmail.com, 22.gmail.com', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'DOO ZA UNUTARŠNJU I SPOLJNU TRGOVINU PETAR ELEKTRO, NOVI SAD', N'Cara Dusana 8a', N'Novi Sad', N'Novi Sad', N'102702983', N'08780668', CAST(N'2003-02-26T00:00:00.000' AS DateTime), N'Trgovina na veliko metalima i nemetalima', N'DOO', N'Petar Stojanovic', N'-', N'-', N'mesecni', N'prosto', N'Petar Stojanovic', N'250-2030001175770-36,340-0000010003304-72,340-0000000034600-17', 6, CAST(N'2018-01-01T00:00:00.000' AS DateTime), 1, 2, 12000, N'RSD', N'Marko', CAST(N'2003-02-26T00:00:00.000' AS DateTime), CAST(N'1957-12-20T00:00:00.000' AS DateTime), N'kurir', 8, N'4672', N'-', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'Keramika-Holding d.o.o. Beograd ', N'Bulevar Mihaila Pupina 108a', N'Beograd', N'Novi Beograd', N'100112489', N'07160330', CAST(N'1999-12-29T00:00:00.000' AS DateTime), N'Eksploatacija sljunka, peska, gline', N'DOO', N'Zdravko Ivankovic', N'-', N'-', N'mesecni', N'dvojno', N'Zdravko Ivankovic', N'285-0014037370001-82', 24, CAST(N'2000-02-15T00:00:00.000' AS DateTime), 1, 1, 22000, N'RSD', N'Petar', CAST(N'2000-02-15T00:00:00.000' AS DateTime), CAST(N'1983-08-03T00:00:00.000' AS DateTime), N'licno', 9, N'0812', N'-', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'AGROHEMIKA DOO ZA POLJOPRIVREDNU PROIZVODNJU I TRGOVINU, BAČKI PETROVAC', N'Lenjinova 35', N'Backi Petrovac', N'Backi Petrovac', N'101270080', N'08276188', CAST(N'1990-11-19T00:00:00.000' AS DateTime), N'Gajenje zita i uljarica', N'DOO', N'Mihail Palenkas', N'-', N'-', N'tromesecni', N'dvojno', N'Mihail Palenkas', N'220-2130200004980-12', 18, CAST(N'1990-11-19T00:00:00.000' AS DateTime), 2, 2, 6000, N'RSD', N'Nikola', CAST(N'1990-11-19T00:00:00.000' AS DateTime), CAST(N'1953-05-21T00:00:00.000' AS DateTime), N'kurir', 10, N'0111', N'-', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'BG TAŠ MIKAVICA DRAGAN DOO BEOGRAD', N'Prominska 17', N'Beograd', N'Palilula', N'101879695', N'17420160', CAST(N'2002-03-11T00:00:00.000' AS DateTime), N'Delatnost skola za vozace', N'DOO', N'Dragan Mikavica', N'-', N'-', N'mesecni', N'dvojno', N'Dragan Mikavica', N'310-0000000014159-28', 2, CAST(N'2002-03-11T00:00:00.000' AS DateTime), 2, 1, 8500, N'RSD', N'Mitrovdan', CAST(N'2002-03-11T00:00:00.000' AS DateTime), CAST(N'1971-04-18T00:00:00.000' AS DateTime), N'email', 11, N'8553', N'-', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'NENA KERAMIKA DOO, UŽICE', N'Uzicke republike 4', N'Uzice', N'Uzice', N'101779682', N'06803423', CAST(N'1998-10-13T00:00:00.000' AS DateTime), N'Trgovina na veliko drvetom, gradjevinskim materijalom i sanitarnom opremom', N'DOO', N'Radoje Zuncic', N'-', N'-', N'tromesecni', N'prosto', N'Radoje Zuncic', N'220-0000000014480-11', 31, CAST(N'1998-10-13T00:00:00.000' AS DateTime), 1, 1, 240, N'RSD', N'Luka', CAST(N'1998-10-13T00:00:00.000' AS DateTime), CAST(N'1961-11-19T00:00:00.000' AS DateTime), N'kurir', 13, N'4673', N'-', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'AUTOPREVOZNIČKA RADNJA NEŠIĆ NEŠIĆ MILANA PREDUZETNIK ZUCE', N'Nova 1', N'Zuce', N'Beograd-Vozdovac', N'104213100', N'61087338', CAST(N'2006-01-20T00:00:00.000' AS DateTime), N'Drumski prevoz tereta', N'Preduzetnik', N'Milan Nesic', N'-', N'-', N'mesecni', N'prosto', N'Milan Nesic', N'170-0050023602000-78', 2, CAST(N'2006-01-20T00:00:00.000' AS DateTime), 1, 1, 7000, N'RSD', N'Nikola', CAST(N'2006-01-20T00:00:00.000' AS DateTime), CAST(N'1983-12-25T00:00:00.000' AS DateTime), N'kurir', 14, N'4946', N'Licna zarada', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'MILAN ĐEVIĆ PR, POLJOPRIVREDNA APOTEKA AGROTEHNA ČAČAK', N'Milenka Niksica 1a', N'Cacak 1', N'Cacak 2', N'104225111', N'61091222', CAST(N'2006-02-28T00:00:00.000' AS DateTime), N'Ostala trgovina na malo i na jos manje', N'DOO', N'Milan Djevic', N'-', N'123', N'mesecni', N'prosto', N'Milan Djevic', N'55-0000000019082-91', 4, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 1, 1, 9600, N'RSD', N'Nikola', CAST(N'2006-02-01T00:00:00.000' AS DateTime), CAST(N'1970-11-07T00:00:00.000' AS DateTime), N'email', 15, N'4671', N'Pausal', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'MILAN ALEKSIĆ PR PROIZVODNJA VINA I AGRO SAVETI FITOMEDIK VENČAC', N'Vencac BB', N'Vencas', N'Aleksandrovac', N'104249348', N'60006881', CAST(N'2006-02-01T00:00:00.000' AS DateTime), N'Proizvodnja vina od grozdja', N'Preduzetnik', N'Milan Aleksic', N'-', N'-', N'mesecni', N'prosto', N'Milan Aleksic', N'105-0000000720083-67,325-9500700033124-54', 6, CAST(N'2006-02-01T00:00:00.000' AS DateTime), 1, 1, 4500, N'RSD', N'Nikola', CAST(N'2006-02-01T00:00:00.000' AS DateTime), CAST(N'1979-01-23T00:00:00.000' AS DateTime), N'dropbox', 16, N'1102', N'Licna zarada', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'DEČIJA IGRAONICA SVITAC-NP PAUNOVIĆ NIKOLA PREDUZETNIK BEOGRAD (ZEMUN)', N'Ugrinovacki put 78', N'Beograd', N'Zemun', N'104273645', N'60019274', CAST(N'2006-03-01T00:00:00.000' AS DateTime), N'Ostale zabavne i rekreativne delatnosti', N'Preduzetnik', N'Nikola Paunovic', N'-', N'-', N'mesecni', N'prosto', N'Nikola Paunovic', N'160-0000000332055-04 ', 3, CAST(N'2006-03-01T00:00:00.000' AS DateTime), 2, 1, 8000, N'RSD', N'Nikola', CAST(N'2006-03-01T00:00:00.000' AS DateTime), CAST(N'1985-07-18T00:00:00.000' AS DateTime), N'licno', 17, N'9329', N'Pausal', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'Udruženje odgajivača sitnih životinja "Paun" Obrovac', N'Mladena Stojanovica 24', N'Obrovac', N'Backa Palanka', N'106574212', N'28011814', CAST(N'2010-02-17T00:00:00.000' AS DateTime), N'Delatnost ostalih organizacija na bazi uclanjenja', N'Udruzenje', N'Jova Trkulja', N'-', N'-', N'tromesecni', N'dvojno', N'Jovica Trkulja', N'-', 40, CAST(N'2010-02-17T00:00:00.000' AS DateTime), 1, 1, 100, N'RSD', N'Trifun', CAST(N'2010-02-17T00:00:00.000' AS DateTime), CAST(N'1985-12-01T00:00:00.000' AS DateTime), N'licno', 18, N'9499', N'-', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'Lovačko društvo "Sloga" Nikinci2', N'Baradinci 66', N'Nikinci', N'Ruma', N'104795521', N'08015520', CAST(N'2011-04-03T00:00:00.000' AS DateTime), N'Delatnost ostalih organizacija na bazi uclanjenja', N'Udruzenje', N'Djordje Varnicic', N'-', N'-', N'mesecni', N'dvojno', N'Djordje Varnicic', N'-', 60, CAST(N'2011-04-03T00:00:00.000' AS DateTime), 1, 11, 56000, N'RSD', N'Nikola', CAST(N'2011-03-04T00:00:00.000' AS DateTime), CAST(N'1954-12-12T00:00:00.000' AS DateTime), N'kurir', 23, N'9499', N'-', N'-', NULL, 1)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'Nikica test firma', N'Mirijevski venac 14', N'Beograd', N'Zvezdara', N'123456789', N'98765432', CAST(N'2018-09-02T21:24:52.000' AS DateTime), N'Delatnost ostalih organizacija na bazi uclanjenja', N'Preduzetnik', N'Nikica Odgovorno lice', N'', N'nikolaos93@hotmail.com', N'mesecni', N'', N'Nikola B', N'125-0000001735646-24', 22, CAST(N'2011-04-01T00:00:00.000' AS DateTime), 17, 11, 14500, N'RSD', N'Slava', CAST(N'2018-09-08T00:00:00.000' AS DateTime), CAST(N'1993-12-04T00:00:00.000' AS DateTime), N'kurir', 1024, N'9989', N'Pausal', N'nema', 2, 0)
GO
INSERT [dbo].[Customers] ([Name], [Address], [Place], [Municipality], [PIB], [LegalID], [CreationDate], [Activity], [Form], [ResponsiblePerson], [ResponsiblePersonPhone], [ResponsiblePersonMail], [PDV], [BookKeepingType], [Director], [Account], [EmployeesNumber], [StartDate], [MainUserId], [SecondUserId], [Amount], [AmountCode], [Slava], [BirthDate], [ResponsiblePersonBirthDate], [DeliveryMethod], [CustomerID], [ActivityCode], [FormSubType], [AdditionalMails], [CourierDay], [Status]) VALUES (N'Test bre', N'Testna adresa 123', N'Mesto', N'Opstina', N'123456789', N'14785266', CAST(N'2018-09-02T22:13:53.000' AS DateTime), N'Trgovina na malo manje', N'DOO', N'Test odgovara', N'', N'-', N'mesecni', N'', N'Test direktor', N'test12', 15, CAST(N'2011-04-03T00:00:00.000' AS DateTime), 1, 1, 14500, N'RSD', N'Slava', CAST(N'1992-11-17T00:00:00.000' AS DateTime), CAST(N'2018-09-01T00:00:00.000' AS DateTime), N'kurir', 1028, N'9989', N'', N'-', 6, 1)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomersChanges] ON 
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (17, 4, 1, N'Direktor', N'Veljko Car', N'Veljko Carina', CAST(N'2018-02-22T02:27:09.767' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (18, 4, 1, N'Direktor', N'14', N'24', CAST(N'2018-02-22T02:27:09.767' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (19, 4, 1, N'Racuni', N'125-0000001735646-24,105-0000002287529-91', N'125-0000001735646-24,105-0000002287529-99', CAST(N'2018-02-22T02:27:09.770' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (20, 4, 1, N'Iznos', N'12000', N'14000', CAST(N'2018-02-22T02:27:43.590' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (21, 4, 1, N'Valuta', N'RSD', N'EUR', CAST(N'2018-02-22T02:27:43.590' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (22, 4, 1, N'Slava', N'Nikolica', N'NikoLA', CAST(N'2018-02-22T02:28:01.177' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (23, 4, 1, N'Rodjendan', N'11/30/1992 12:00:00 AM', N'11/12/1992 12:00:00 AM', CAST(N'2018-02-22T02:28:01.177' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (24, 4, 1, N'Knjigovodja', N'11', N'1', CAST(N'2018-02-22T02:28:21.347' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (25, 4, 1, N'Obracunski radnik', N'11', N'1', CAST(N'2018-02-22T02:28:21.350' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (26, 4, 1, N'Dostava', N'mail', N'kurir', CAST(N'2018-02-22T02:28:21.350' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (27, 4, 1, N'Datum saradnje', N'2/20/2018 12:00:00 AM', N'2/22/2018 12:00:00 AM', CAST(N'2018-02-22T02:29:38.990' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (30, 18, 1, N'Odgovorno lice', N'Jovica Trkulja', N'Jova Trkulja', CAST(N'2018-02-23T21:34:23.213' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (31, 14, 1, N'Adresa', N'Nova 44', N'Nova 12', CAST(N'2018-02-25T15:03:55.470' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (32, 14, 1, N'Knjigovodja', N'2', N'1', CAST(N'2018-02-25T15:03:55.470' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (33, 14, 1, N'Obracunski radnik', N'2', N'1', CAST(N'2018-02-25T15:03:55.470' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (34, 14, 1, N'Adresa', N'Nova 12', N'Nova 1', CAST(N'2018-02-26T16:41:29.673' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1035, 4, 1, N'Odgovorno lice - dodatni mailovi', N'1@gmail.com, 2.gmail.com', N'11@gmail.com, 22.gmail.com', CAST(N'2018-04-15T23:57:59.860' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1036, 18, 1, N'Iznos', N'4500', N'5000', CAST(N'2018-04-16T00:21:42.990' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1037, 18, 1, N'Iznos', N'5000', N'100', CAST(N'2018-04-16T00:22:26.523' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1038, 18, 1, N'Valuta', N'RSD', N'EUR', CAST(N'2018-04-16T00:22:26.523' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1039, 23, 1, N'Iznos', N'35', N'5000', CAST(N'2018-04-16T00:22:53.880' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1043, 4, 1, N'Iznos', N'120', N'115', CAST(N'2018-04-16T00:47:12.763' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1044, 23, 1, N'Iznos', N'6000', N'16000', CAST(N'2018-04-16T00:51:22.867' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1045, 23, 1, N'Iznos', N'16000', N'56000', CAST(N'2018-04-16T00:56:12.653' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1046, 4, 1, N'Valuta', N'EUR', N'RSD', CAST(N'2018-04-16T01:21:37.187' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1047, 18, 1, N'Valuta', N'EUR', N'RSD', CAST(N'2018-04-16T01:22:30.773' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (2035, 1024, 1, N'Datum osnivanja', N'9/2/2018 9:24:52 PM', N'9/2/2018 9:24:52 PM', CAST(N'2018-09-02T21:43:17.300' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (2036, 1024, 1, N'Knjigovodja', N'1017', N'17', CAST(N'2018-09-02T21:43:17.300' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (2037, 1024, 1, N'BrojZapolsenih', N'13', N'17', CAST(N'2018-09-03T02:13:11.660' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (2038, 1024, 1, N'BrojZapolsenih', N'17', N'9', CAST(N'2018-09-03T02:16:46.970' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (2039, 1024, 1, N'BrojZapolsenih', N'9', N'22', CAST(N'2018-09-03T03:14:14.150' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (2040, 1028, 1, N'Datum osnivanja', N'9/2/2018 10:13:53 PM', N'9/2/2018 10:13:53 PM', CAST(N'2018-09-03T03:15:04.290' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (2041, 1028, 1, N'BrojZapolsenih', N'12', N'15', CAST(N'2018-09-03T03:15:04.290' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (28, 23, 1, N'Naziv', N'Lovačko društvo "Sloga" Nikinci', N'Lovačko društvo "Sloga" Nikinci2', CAST(N'2018-02-22T03:42:55.157' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (29, 23, 1, N'Knjigovodja', N'2', N'1', CAST(N'2018-02-22T03:42:55.160' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (35, 4, 1, N'Oblik', N'Udruzenje', N'Preduzetnik', CAST(N'2018-03-10T13:42:03.103' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (36, 4, 1, N'Podoblik', N'-', N'Samooporezivanje', CAST(N'2018-03-10T13:42:16.470' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1040, 23, 1, N'Iznos', N'5000', N'6000', CAST(N'2018-04-16T00:35:14.653' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1041, 4, 1, N'Iznos', N'14000', N'120', CAST(N'2018-04-16T00:39:03.947' AS DateTime))
GO
INSERT [dbo].[CustomersChanges] ([ChangeNumber], [CustomerId], [UserId], [FieldName], [OldValue], [NewValue], [ChangeDate]) VALUES (1042, 4, 1, N'Valuta', N'RSD', N'EUR', CAST(N'2018-04-16T00:39:03.947' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CustomersChanges] OFF
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (4, 1)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (4, 2)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (4, 4)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (4, 15)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (4, 17)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (4, 18)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (23, 21)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (23, 20)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (23, 19)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (23, 17)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (8, 8)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (8, 7)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (8, 9)
GO
INSERT [dbo].[CustomersReports] ([CustomerId], [ReportId]) VALUES (8, 14)
GO
SET IDENTITY_INSERT [dbo].[CustomerTimes] ON 
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (2, 4, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2018-02-23T02:25:40.517' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (3, 4, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2018-02-23T02:25:59.277' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (4, 4, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2018-02-23T02:27:45.657' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (5, 4, 1, CAST(2.00 AS Decimal(18, 2)), CAST(N'2018-02-23T02:28:10.520' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (6, 4, 1, CAST(1.25 AS Decimal(18, 2)), CAST(N'2018-02-23T02:29:43.150' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (7, 23, 1, CAST(4.50 AS Decimal(18, 2)), CAST(N'2018-02-23T02:35:26.570' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (10, 4, 1, CAST(0.11 AS Decimal(18, 2)), CAST(N'2018-02-23T02:50:57.367' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (11, 4, 1, CAST(0.29 AS Decimal(18, 2)), CAST(N'2018-02-23T03:00:27.267' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (12, 4, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2018-02-23T03:04:25.700' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (13, 4, 1, CAST(1.00 AS Decimal(18, 2)), CAST(N'2018-02-23T03:06:51.223' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (14, 8, 1, CAST(11.00 AS Decimal(18, 2)), CAST(N'2018-02-23T03:07:40.630' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (15, 4, 1, CAST(0.60 AS Decimal(18, 2)), CAST(N'2018-02-23T05:40:05.490' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (16, 18, 1, CAST(4.50 AS Decimal(18, 2)), CAST(N'2018-02-23T21:34:47.047' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (18, 4, 3, CAST(11.00 AS Decimal(18, 2)), CAST(N'2018-03-26T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (19, 4, 2, CAST(1.00 AS Decimal(18, 2)), CAST(N'2018-02-25T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (22, 14, 1, CAST(2.00 AS Decimal(18, 2)), CAST(N'2018-02-26T16:38:49.173' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (1023, 4, 1, CAST(11.00 AS Decimal(18, 2)), CAST(N'2018-05-29T19:12:39.940' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (2023, 23, 17, CAST(0.33 AS Decimal(18, 2)), CAST(N'2018-06-17T21:29:30.703' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (2024, 4, 1, CAST(2.00 AS Decimal(18, 2)), CAST(N'2018-06-17T22:45:24.300' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (3023, 1024, 1, CAST(0.50 AS Decimal(18, 2)), CAST(N'2018-09-03T04:01:24.167' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (3024, 1024, 1, CAST(1.50 AS Decimal(18, 2)), CAST(N'2018-09-03T05:00:36.573' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (3025, 4, 1, CAST(0.50 AS Decimal(18, 2)), CAST(N'2018-10-13T17:03:55.657' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (8, 4, 1, CAST(0.50 AS Decimal(18, 2)), CAST(N'2018-02-23T02:41:08.393' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (9, 4, 1, CAST(0.25 AS Decimal(18, 2)), CAST(N'2018-02-23T02:42:26.130' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (17, 8, 1, CAST(2.00 AS Decimal(18, 2)), CAST(N'2018-02-25T02:12:04.797' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (20, 4, 1, CAST(0.00 AS Decimal(18, 2)), CAST(N'2018-02-25T02:26:42.220' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (21, 14, 1, CAST(4.00 AS Decimal(18, 2)), CAST(N'2018-02-25T15:04:51.867' AS DateTime))
GO
INSERT [dbo].[CustomerTimes] ([Id], [CustomerId], [UserId], [Time], [InsertionDate]) VALUES (23, 4, 1, CAST(2.00 AS Decimal(18, 2)), CAST(N'2018-03-10T13:44:34.540' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CustomerTimes] OFF
GO
SET IDENTITY_INSERT [dbo].[Firms] ON 
GO
INSERT [dbo].[Firms] ([FirmId], [FirmName]) VALUES (1, N'Firma broj 1')
GO
INSERT [dbo].[Firms] ([FirmId], [FirmName]) VALUES (2, N'Firma broj 2')
GO
INSERT [dbo].[Firms] ([FirmId], [FirmName]) VALUES (2002, N'Nikicina firma 2')
GO
SET IDENTITY_INSERT [dbo].[Firms] OFF
GO
SET IDENTITY_INSERT [dbo].[Offers] ON 
GO
INSERT [dbo].[Offers] ([OfferId], [ContactPerson], [PIB], [Mail], [PhoneNumber], [CreationDate], [ServiceId], [HeardFrom], [IsSuccesful], [Impression], [BackInfo], [Amount], [AmountCurrency], [IsOurCreation], [Note], [UserId], [Name], [MakeRent], [CompanyType], [CompanySubType]) VALUES (1004, N'Test', N'12312111', N'nikica.car@gmail.com', N'0616766464', CAST(N'2018-04-16T04:31:39.140' AS DateTime), N'2,4,5,6', N'WEB', 0, N'ok', N'-', 12750, N'RSD', 1, N'-', 1, N'Nikica Test', 1, N'DOO', NULL)
GO
INSERT [dbo].[Offers] ([OfferId], [ContactPerson], [PIB], [Mail], [PhoneNumber], [CreationDate], [ServiceId], [HeardFrom], [IsSuccesful], [Impression], [BackInfo], [Amount], [AmountCurrency], [IsOurCreation], [Note], [UserId], [Name], [MakeRent], [CompanyType], [CompanySubType]) VALUES (1005, N'Natasa', N'12312111', N'natasa@kolacici,com', N'0114545123', CAST(N'2018-06-17T23:09:31.000' AS DateTime), N'1,6', N'Facebook', 0, N'Treba ovo probati', N'Moze ovo lagano', 7500, N'RSD', 0, N'Uzmite cokoladnu', 1, N'Kolacici WTF', 1, N'DOO', N'Licna zarada')
GO
INSERT [dbo].[Offers] ([OfferId], [ContactPerson], [PIB], [Mail], [PhoneNumber], [CreationDate], [ServiceId], [HeardFrom], [IsSuccesful], [Impression], [BackInfo], [Amount], [AmountCurrency], [IsOurCreation], [Note], [UserId], [Name], [MakeRent], [CompanyType], [CompanySubType]) VALUES (1006, N'Pero', N'12312311', N'pero@bravarija.com', N'-', CAST(N'2018-06-17T23:12:03.077' AS DateTime), N'4,5', N'oglasi', 0, N'not bad', N'-', 3750, N'RSD', 0, N'onako', 1, N'Pero bravar', 0, N'Preduzetnik', N'Samooporezivanje')
GO
SET IDENTITY_INSERT [dbo].[Offers] OFF
GO
SET IDENTITY_INSERT [dbo].[PossibleCreations] ON 
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (1, N'1', CAST(N'2018-02-26T00:00:00.000' AS DateTime), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'nikolaos93@hotmail.com', N'0611707391', 1, CAST(N'2018-03-04T00:00:00.000' AS DateTime), 1, 1, 1, 1, N'Nepoznati', 1, 1, N'OK', 1, N'111111', 1234, N'Preduzetnik')
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (2, N'1', CAST(N'2018-03-04T00:00:00.000' AS DateTime), CAST(N'2018-03-05T00:00:00.000' AS DateTime), N'kliker.centar.web@gmail.com', N'062222222', 1, CAST(N'2018-03-15T00:00:00.000' AS DateTime), 1, 0, 1, 2, N'Kliker centar', 11, 1, N'-', 2, N'222333', 3322, N'K')
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (9, N'2', CAST(N'2018-02-27T04:29:09.940' AS DateTime), CAST(N'2018-02-27T04:31:02.710' AS DateTime), N'movement.house@aaa.rs', N'0611707788', 1, CAST(N'2018-02-27T04:31:55.387' AS DateTime), 1, 1, 1, 2, N'MovementHouse', 11, 2, N'-', 3, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (11, N'3', CAST(N'2018-02-27T04:43:10.067' AS DateTime), NULL, N'mara.it.car@aaa.rs', N'0611704152', 0, NULL, 0, 0, 1, 2, N'Mare it guru', 1, 3, N'NOT OK', 2, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (1003, N'10', CAST(N'2018-06-18T00:03:38.553' AS DateTime), NULL, N'ona.moja@moja.rs', N'064159951', 0, NULL, 0, 0, 0, 1, N'Ona moja', 1, 1, N'nema', 4, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (12, N'9', CAST(N'2018-03-10T13:59:10.743' AS DateTime), CAST(N'2018-03-10T14:01:01.810' AS DateTime), N'marko.car@car.car', N'123456', 1, CAST(N'2018-03-10T14:07:44.910' AS DateTime), 1, 1, 1, 1, N'Marko Preduzetnik', 1, 4, NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (1004, N'2,6,9,10', CAST(N'2018-06-18T00:52:44.670' AS DateTime), NULL, N'sss', N'ddd', 0, NULL, 0, 0, 0, 2, N'aaa', 1, 1, N'asd', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (1005, N'2,6,9,10', CAST(N'2018-06-18T00:52:53.947' AS DateTime), NULL, N'sss', N'ddd', 0, NULL, 0, 0, 0, 2, N'aaa', 1, 1, N'asd', 1, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (1006, N'5,6,9,10', CAST(N'2018-06-18T00:59:37.557' AS DateTime), NULL, N'final.test@nikica.rs', N'123111', 0, NULL, 0, 0, 0, 2, N'Nikica', 1, 1, N'1111', 3, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (1007, N'3,5,6', CAST(N'2018-06-18T01:00:06.360' AS DateTime), NULL, N'22', N'33', 0, NULL, 0, 0, 0, 2, N'Nikica', 1, 1, N'test test', 3, NULL, NULL, NULL)
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (1008, N'3,5,6', CAST(N'2018-06-18T01:45:09.580' AS DateTime), NULL, N'ovo je mail', N'telefon', 0, NULL, 0, 0, 0, 2, N'Mozes ti to :)', 1, 1, N'a', 3, N'pibic', 9550, N'Samooporezivanje')
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (2008, N'2,3,5,6,9,10', CAST(N'2018-09-02T23:25:10.450' AS DateTime), NULL, N'asd', N'asd', 0, NULL, 0, 0, 0, 1, N'asd', 1, 1, N'SD', 1, N'asd', 22673, N'Licna zarada')
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (2009, N'2,3,5,6,9,10', CAST(N'2018-09-04T00:31:10.540' AS DateTime), NULL, N'nikica.car@gmail.com', N'1234', 0, CAST(N'2018-09-04T00:36:55.337' AS DateTime), 1, 0, 0, 1, N'Test1', 1, 1, N'Uzmite cokoladnu', 2, N'1234', 22673, N'Licna zarada')
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (2010, N'2,3,5,6,9,10', CAST(N'2018-09-04T00:45:18.387' AS DateTime), NULL, N'd1', N'd1', 0, NULL, 0, 0, 0, 1, N'd1', 1, 1, N'd1', 1, N'd1', 22673, N'2V')
GO
INSERT [dbo].[PossibleCreations] ([CreationId], [JobType], [CreationDate], [FormularDate], [Mail], [PhoneNumber], [IsPaid], [EndDate], [IsDone], [IsMailSent], [IsAnswerSuccesful], [ClientType], [Name], [UserId], [Status], [Note], [PaymentMethod], [PIB], [Amount], [CompanySubType]) VALUES (2011, N'2,3,5,6,9,10', CAST(N'2018-09-04T00:46:50.270' AS DateTime), NULL, N'p1', N'p1', 0, NULL, 0, 0, 0, 1, N'p1', 11, 1, N'p1', 1, N'p1', 22673, N'3V')
GO
SET IDENTITY_INSERT [dbo].[PossibleCreations] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportTypes] ON 
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (1, N'PDV')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (2, N'Plate')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (3, N'PIO')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (4, N'Zakup')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (5, N'Porez na dobit')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (6, N'Sertifikat')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (7, N'EKPL')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (8, N'CR')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (9, N'PEP')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (10, N'PEPM4')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (11, N'Zdravstveno')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (12, N'Ugovori')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (13, N'Ugovori na odredjeno')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (14, N'Listing')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (15, N'Povracaj 65%')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (16, N'Porodiljsko')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (17, N'Trudnicko')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (18, N'Presek - Jun')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (19, N'Presek - Septembar')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (20, N'Presek - Oktobar')
GO
INSERT [dbo].[ReportTypes] ([ReportId], [ReportName]) VALUES (21, N'M4')
GO
SET IDENTITY_INSERT [dbo].[ReportTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (1, N'Kalkulacije', N'Izrada kalkulacija cena', 3000, 1)
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (2, N'Evidencije', N'Vođenje evidencije', 4500, 2)
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (3, N'Analiza', N'Analiza poslovanja i finansijskih pokazatelja', 2800, 2)
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (4, N'Arhiviranje ', N'Arhiviranje i čuvanje dokumentacije', 1500, 1)
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (5, N'Kurir', N'Kurirske poslove', 2250, 3)
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (6, N'Krofne', N'Krofne', 4500, 3)
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (9, N'Osnivnanje preduzetnika', N'ovom uslugom se osvinasdasd', 8500, 2)
GO
INSERT [dbo].[Services] ([ServiceId], [ServiceName], [ServiceDescription], [Price], [Type]) VALUES (10, N'Test 123', N'opis 123', 123, 2)
GO
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName], [TeamLeaderId]) VALUES (1, N'Arkanovi tigrovi', 1)
GO
INSERT [dbo].[Teams] ([TeamID], [TeamName], [TeamLeaderId]) VALUES (2, N'Male mace', 2)
GO
SET IDENTITY_INSERT [dbo].[Times] ON 
GO
INSERT [dbo].[Times] ([TimeId], [TimeDescription], [TimeName], [Value]) VALUES (1, N'Maksimalan broj sati za slanje ponude', N'MaxOfferTime', 12)
GO
INSERT [dbo].[Times] ([TimeId], [TimeDescription], [TimeName], [Value]) VALUES (2, N'Podsetnik za vreme', N'MaxTimeForDrink', 36)
GO
INSERT [dbo].[Times] ([TimeId], [TimeDescription], [TimeName], [Value]) VALUES (3, N'Vreme potrebno za ljubav prema klijenta', N'MaxLoveTime', 24)
GO
SET IDENTITY_INSERT [dbo].[Times] OFF
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.410' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.420' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.423' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.430' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.437' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.457' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.460' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:12:49.467' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:13:32.950' AS DateTime), N'dbo.Delete_Firm', 1, N'DataBaseCommunication.Mappers.Requests.Settings.DeleteFirmRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:13:32.957' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:14:08.480' AS DateTime), N'dbo.Insert_Firm', 1, N'DataBaseCommunication.Mappers.Requests.Settings.CreateFirmRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:14:08.480' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:14:55.693' AS DateTime), N'dbo.usp_Login', 17, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:14:55.707' AS DateTime), N'dbo.Get_Client_Reports', 17, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-18T04:14:55.710' AS DateTime), N'dbo.Get_All_Couriers', 17, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.813' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.820' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.827' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.830' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.833' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.853' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.857' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:16:24.863' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:17:58.697' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:17:59.193' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:21:31.910' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:28.967' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:28.977' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:28.990' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:28.997' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:29.000' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:21:59.043' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-06-22T19:22:11.833' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:29.020' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:29.027' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:33:29.033' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:34:20.453' AS DateTime), N'dbo.Insert_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.AddUserRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:34:25.697' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:14.387' AS DateTime), N'dbo.usp_Login', 1017, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:14.400' AS DateTime), N'dbo.Get_Client_Reports', 1017, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:14.403' AS DateTime), N'dbo.Get_All_Couriers', 1017, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:37.200' AS DateTime), N'dbo.Update_User_Data', 1017, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:37.210' AS DateTime), N'dbo.usp_Login', 1017, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:24:52.840' AS DateTime), N'dbo.Insert_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.NewClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:24:52.843' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:24:59.237' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:24:59.753' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:26:40.623' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:26:41.127' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:42:58.117' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:42:58.610' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:43:17.280' AS DateTime), N'dbo.Update_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:43:17.293' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:43:17.300' AS DateTime), N'dbo.Insert_Clients_Changes', 1, N'System.Collections.Generic.List`1[DailyJobStarterPack.DataBaseObjects.Change]', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:43:17.300' AS DateTime), N'dbo.Insert_Clients_Changes', 1, N'System.Collections.Generic.List`1[DailyJobStarterPack.DataBaseObjects.Change]', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:43:47.750' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:43:48.270' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.037' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.043' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.047' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.050' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.057' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:50.137' AS DateTime), N'dbo.usp_Login', 1017, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:50.150' AS DateTime), N'dbo.Get_Client_Reports', 1017, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:50.153' AS DateTime), N'dbo.Get_All_Couriers', 1017, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.477' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.480' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.483' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.487' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.490' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.490' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.490' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:35:55.497' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.817' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.827' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.847' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.853' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.857' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.873' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.880' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:27.890' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:42.453' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:42.957' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:10:44.930' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:11:20.773' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:11:35.617' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:12:35.453' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:13:30.560' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:16:50.610' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:18:53.880' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:23:33.967' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:23:52.950' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:23:53.460' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.920' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.927' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.930' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.937' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.940' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.960' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.970' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:42:59.980' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:43:12.623' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T20:43:13.140' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.077' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.153' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.180' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.260' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.300' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.440' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.447' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:30.457' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:37.600' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:38.100' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:21:45.413' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:22:17.483' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:23:56.600' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:23:58.763' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:24:22.867' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.630' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.640' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.643' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.650' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.653' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.100' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.107' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.110' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.113' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.117' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.130' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.137' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T21:21:21.143' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:04:04.517' AS DateTime), N'dbo.Update_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:04:04.520' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:06:06.363' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:06:06.870' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:06:40.510' AS DateTime), N'dbo.Update_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:06:40.510' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:10:26.067' AS DateTime), N'dbo.Insert_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.NewClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:10:26.070' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:30.803' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:31.303' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:19:12.300' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:19:12.817' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.670' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.677' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:28:46.683' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.450' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.457' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.460' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.460' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.463' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.470' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.473' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:41:30.477' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.067' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.070' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:00:36.080' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:02:03.420' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:02:03.920' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:02:13.187' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:02:13.690' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:09:26.370' AS DateTime), N'dbo.Insert_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.NewClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:09:26.370' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:09:52.183' AS DateTime), N'dbo.Insert_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.NewClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:09:52.187' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:13:53.790' AS DateTime), N'dbo.Insert_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.NewClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:13:53.800' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:18.750' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:18.760' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:18.763' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:18.767' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:18.770' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:18.773' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:20.917' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:16:20.917' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:19:39.817' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:19:40.317' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:20:01.857' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:20:02.360' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:21:50.123' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T22:21:50.627' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:24:43.250' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:25:10.453' AS DateTime), N'dbo.InsertCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.AddCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:25:10.457' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-02T23:25:12.510' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:14:20.683' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:15:01.133' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:16:24.563' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:16:41.233' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:20:53.450' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:20:53.953' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:21:16.760' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:21:41.040' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:22:37.280' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:12:38.880' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:12:39.373' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:13:08.667' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:13:09.160' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:35:13.893' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:35:14.393' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:36:18.010' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:36:18.523' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:37:02.640' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:37:03.140' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:42:51.953' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:42:52.450' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:43:22.260' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:43:22.763' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:43:44.307' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:43:44.803' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:44:22.097' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:44:22.600' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:44:39.710' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:44:40.213' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:44:55.990' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.403' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.410' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.413' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.417' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.420' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.423' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.430' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:49:35.430' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.537' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.540' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.543' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.547' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.550' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.557' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.560' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T00:51:47.560' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:31:52.727' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:31:53.220' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:32:31.707' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:32:32.207' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:37:39.007' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:37:39.510' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:19.327' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:19.827' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.260' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.267' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.273' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.280' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.283' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.300' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.310' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:38:59.317' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:39:11.323' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:39:11.827' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:40:10.380' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:40:10.880' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:41:38.967' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:41:39.467' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:44:56.497' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:45:47.470' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:45:47.967' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:46:04.117' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:46:04.633' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:46:22.693' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:46:23.193' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:46:45.557' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:46:46.060' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:47:57.140' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:47:57.650' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:48:50.053' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:48:50.557' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.907' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.910' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.917' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.920' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.923' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.940' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.943' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:18.950' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:28.910' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:49:29.413' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:50:07.260' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:50:07.757' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:50:46.537' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:50:47.037' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:51:57.347' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:51:57.860' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:53:07.143' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:53:07.640' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:54:53.053' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:54:53.553' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:55:08.390' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T01:55:08.893' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.173' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.200' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.203' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.210' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.213' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.227' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.230' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:05.240' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:12.973' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:08:57.970' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:09:50.090' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:12:12.053' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:12:51.450' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:12:56.260' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:12:56.767' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:13:11.653' AS DateTime), N'dbo.Update_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:13:11.657' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:13:11.660' AS DateTime), N'dbo.Insert_Clients_Changes', 1, N'System.Collections.Generic.List`1[DailyJobStarterPack.DataBaseObjects.Change]', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:13:20.727' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:13:21.130' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:13:21.630' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:13:50.570' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:15:30.427' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:15:30.930' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:15:48.150' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:15:52.790' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:15:53.290' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:25.727' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:30.513' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:31.017' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:46.970' AS DateTime), N'dbo.Update_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:46.970' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:46.970' AS DateTime), N'dbo.Insert_Clients_Changes', 1, N'System.Collections.Generic.List`1[DailyJobStarterPack.DataBaseObjects.Change]', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:57.530' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:57.890' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:16:58.390' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:17:33.140' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:18:24.270' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:18:24.770' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:18:49.973' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:18:54.437' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:18:54.937' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.527' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.530' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.533' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.537' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.540' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.547' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.550' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:19:58.553' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:20:06.337' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:20:21.310' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:21:27.207' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:22:06.913' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:22:11.227' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T02:22:11.730' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.697' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.703' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.710' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.710' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.717' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.733' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.740' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:10.747' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:18.850' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:23.497' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:24.010' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:40.703' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:55.037' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:08:55.540' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:09:17.923' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:09:27.347' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:09:27.850' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:09:48.580' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:13:47.027' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:13:51.270' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:13:51.770' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:10:51.727' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:10:52.230' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:11:06.000' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:11:10.383' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:11:10.883' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:11:56.190' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:12:00.493' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:12:00.997' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:13:24.630' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:13:28.903' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:13:29.403' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:57:55.323' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:57:55.327' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:57:55.330' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:57:55.333' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:57:55.337' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:59:01.983' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:59:01.990' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:59:01.993' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:59:01.997' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:59:02.000' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.000' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.023' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.027' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.027' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.027' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.053' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.057' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:00:54.060' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:04.977' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:14.133' AS DateTime), N'dbo.Update_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:14.147' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:14.150' AS DateTime), N'dbo.Insert_Clients_Changes', 1, N'System.Collections.Generic.List`1[DailyJobStarterPack.DataBaseObjects.Change]', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:25.850' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:26.027' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:26.530' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:44.127' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:44.267' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:14:44.773' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:15:04.273' AS DateTime), N'dbo.Update_Client_Data', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:15:04.283' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:15:04.290' AS DateTime), N'dbo.Insert_Clients_Changes', 1, N'System.Collections.Generic.List`1[DailyJobStarterPack.DataBaseObjects.Change]', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:15:04.293' AS DateTime), N'dbo.Insert_Clients_Changes', 1, N'System.Collections.Generic.List`1[DailyJobStarterPack.DataBaseObjects.Change]', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:15:09.017' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:15:09.170' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:15:09.670' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.437' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.443' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.450' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.453' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.460' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.477' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.480' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:21.490' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:31.687' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:32.033' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:32.537' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:53.230' AS DateTime), N'dbo.Insert_Clients_WorkerOrders', 1, N'DataBaseCommunication.Mappers.Requests.Clients.LogWorkersOrderRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T03:49:53.233' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.250' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.257' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:05.367' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:05.870' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:24.170' AS DateTime), N'dbo.Insert_Clients_Times', 1, N'DataBaseCommunication.Mappers.Requests.Clients.LogTimeRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:24.170' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:25.170' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:25.543' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:26.057' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:40.927' AS DateTime), N'dbo.Insert_Clients_WorkerOrders', 1, N'DataBaseCommunication.Mappers.Requests.Clients.LogWorkersOrderRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:40.930' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:49.120' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:49.460' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:01:49.960' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.260' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.263' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.267' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.273' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.277' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:10.280' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:20.023' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:20.353' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:20.860' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:36.313' AS DateTime), N'dbo.Insert_Clients_WorkerOrders', 1, N'DataBaseCommunication.Mappers.Requests.Clients.LogWorkersOrderRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:36.317' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:43.517' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:43.837' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:04:44.337' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.127' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.133' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.140' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.140' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:07:37.550' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:07:42.393' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:07:42.893' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:30:41.937' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:30:46.780' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:30:47.290' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:31:15.133' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:31:19.513' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:31:20.020' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:39:21.987' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:39:31.240' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:39:31.393' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:39:31.900' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:41:58.107' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:02.737' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:02.867' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:03.037' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:03.537' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:14.790' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:14.963' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:15.463' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:31.647' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:32.080' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:42:32.580' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.570' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.583' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.590' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.597' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.600' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.147' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.170' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.177' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:36.187' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:47.783' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:48.160' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:36:48.663' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.170' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.173' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.180' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.180' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.183' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.190' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.193' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:17.197' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:23.523' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:23.930' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:39:24.440' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.437' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.440' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.443' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.447' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.450' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.453' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.457' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:20.460' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:28.027' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:28.357' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:28.870' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:41:30.867' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:42:55.483' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:46:14.563' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:46:39.740' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:50:52.210' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.010' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.017' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.020' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.023' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.027' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.030' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.033' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:13.037' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:22.763' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:22.937' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:23.440' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:25.317' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:40.990' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:56:51.113' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:58:24.277' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:59:30.010' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:59:43.563' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:59:52.703' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:59:52.877' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T04:59:53.377' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:07.510' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:20.433' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:21.620' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:21.770' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:22.273' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:36.573' AS DateTime), N'dbo.Insert_Clients_Times', 1, N'DataBaseCommunication.Mappers.Requests.Clients.LogTimeRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:36.577' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:37.313' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:37.473' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:37.973' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:39.990' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:44.683' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:44.800' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:00:45.317' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.710' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.717' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.720' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.730' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.733' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.760' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.763' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:45.773' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:52.823' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:52.987' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:44:53.497' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:45:20.220' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:45:23.703' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:45:24.207' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:46:03.910' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:46:13.353' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:46:13.870' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:52:08.127' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:52:12.693' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:52:13.197' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:52:16.800' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.810' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.827' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.837' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.847' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.857' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.877' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.890' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:37.897' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:46.510' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:47.080' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:47.587' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:49.077' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:55.933' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:57.143' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:57.563' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:58.070' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:24:59.030' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllWorkerOrdersForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:07.910' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:09.183' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:09.623' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:10.127' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:17.863' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:18.303' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:18.807' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:20.477' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllWorkerOrdersForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:23.200' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:23.613' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:24.117' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:25.060' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:26.640' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:27.040' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:27.543' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:41.407' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:44.210' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:55.830' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:56.283' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:56.790' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:25:59.370' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:26:17.953' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:26:18.423' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:26:18.930' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:31:52.633' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:31:57.097' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:31:57.600' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:32:50.597' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:52:16.970' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:52:17.470' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:53:02.243' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:53:06.620' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:53:07.127' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:53:12.973' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:53:13.120' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T05:53:13.620' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.633' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.640' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:39.650' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:59.333' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:05:59.530' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:06:00.130' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:06:02.700' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:06:07.083' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:06:07.213' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:06:07.730' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.277' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.287' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.293' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.297' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.303' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.347' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.353' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:21.363' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:27.923' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:28.120' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:28.627' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:33.170' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientStatusRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:34:33.170' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.513' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.523' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.527' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.530' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.533' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.540' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.543' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:39.547' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:51.800' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:51.967' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:41:52.480' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:42:40.270' AS DateTime), N'dbo.usp_Login', 11, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:42:40.273' AS DateTime), N'dbo.GetAllClients', 11, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:42:40.277' AS DateTime), N'dbo.Get_All_Couriers', 11, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:42:40.277' AS DateTime), N'dbo.Get_All_Users', 11, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:43:05.643' AS DateTime), N'dbo.Get_All_Changes', 11, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:43:05.807' AS DateTime), N'dbo.Get_All_Changes', 11, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:43:06.320' AS DateTime), N'dbo.Get_Client_Reports', 11, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:40.483' AS DateTime), N'dbo.usp_Login', 11, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:40.507' AS DateTime), N'dbo.GetAllClients', 11, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:40.507' AS DateTime), N'dbo.Get_All_Couriers', 11, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:40.510' AS DateTime), N'dbo.Get_All_Users', 11, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.770' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.770' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.773' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.773' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.777' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.777' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.780' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:50.780' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:57.000' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:57.137' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:46:57.640' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:47:34.437' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:47:39.013' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:47:39.523' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:03.143' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientStatusRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:03.143' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:06.863' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:07.033' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:07.550' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:17.390' AS DateTime), N'dbo.usp_Login', 17, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:17.393' AS DateTime), N'dbo.GetAllClients', 17, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:48:17.397' AS DateTime), N'dbo.Get_All_Couriers', 17, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.030' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.033' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.037' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.037' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.040' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.040' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.040' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:49:49.040' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T22:54:03.203' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:21:35.973' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:22:57.813' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:24:06.610' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:37:17.313' AS DateTime), N'dbo.Update_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:37:17.317' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:42:13.153' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:42:21.933' AS DateTime), N'dbo.Update_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:42:21.933' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:43:51.483' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:56:52.823' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:56:52.827' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:56:52.827' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:56:52.830' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:56:59.697' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.847' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.847' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.850' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.850' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.850' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.853' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.287' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.293' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.293' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.300' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.300' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.307' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.310' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:08:58.313' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.227' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.230' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.233' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.237' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.240' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.247' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.250' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:18:02.253' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:25:16.860' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:25:52.317' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:26:18.670' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.827' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.833' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.837' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.840' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.843' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.870' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.877' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:31:15.880' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:37:36.360' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:44:01.250' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:44:14.307' AS DateTime), N'dbo.Update_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:44:14.310' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.707' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.717' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.720' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.723' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.727' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.733' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.737' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:02.740' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:49:07.240' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:50:40.190' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.367' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.370' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.373' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.377' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.380' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.387' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.390' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:53:20.390' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:55:37.180' AS DateTime), N'dbo.Update_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:55:41.463' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:55:44.140' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.853' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:57:44.853' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:58:27.547' AS DateTime), N'dbo.Update_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:58:27.547' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-03T23:58:29.150' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.907' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.910' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.917' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.920' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.923' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.930' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.933' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:02:25.937' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:03:18.663' AS DateTime), N'dbo.Update_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:03:18.670' AS DateTime), N'dbo.usp_Login', 1017, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:03:18.673' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:03:20.733' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:50:41.107' AS DateTime), N'dbo.UpdateCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.UpdateCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:50:41.110' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:50:42.433' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:12.533' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:04:01.930' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:04:02.307' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:04:02.813' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:04:17.623' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:04:24.347' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:04:38.300' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:04:44.773' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:10:21.380' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:10:36.713' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:01.977' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:01.980' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:01.987' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:01.990' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:01.993' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:02.020' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:02.027' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:02.033' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:05.483' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:10.580' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:43:13.417' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.510' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.517' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.523' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.527' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.533' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.543' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.547' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:16.550' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:49.790' AS DateTime), N'dbo.Update_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.ChangeDataRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:49.790' AS DateTime), N'dbo.usp_Login', 1017, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:49.793' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:08:51.720' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.373' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.380' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.383' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.387' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.390' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.397' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.400' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:47.403' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:57.813' AS DateTime), N'dbo.Delete_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.DeleteUserRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:13:57.817' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:14:06.170' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:16:14.080' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:16:24.087' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:23:54.853' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.703' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.710' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.710' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.713' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.717' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:11:49.307' AS DateTime), N'dbo.Delete_User_Data', 1, N'DataBaseCommunication.Mappers.Requests.Users.DeleteUserRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.723' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.727' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:19.733' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:28:22.543' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:30:37.570' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:31:10.543' AS DateTime), N'dbo.InsertCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.AddCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:31:10.543' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:31:12.253' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:31:24.817' AS DateTime), N'dbo.UpdateCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.UpdateCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:31:24.820' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:31:26.207' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:36:55.340' AS DateTime), N'dbo.UpdateDoneStatus', 1, N'DataBaseCommunication.Mappers.Requests.Creations.UpdateDoneStatusRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:36:55.343' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:36:56.160' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:45:18.390' AS DateTime), N'dbo.InsertCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.AddCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:45:18.397' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:45:19.663' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:46:32.690' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:46:50.270' AS DateTime), N'dbo.InsertCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.AddCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:46:50.270' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:46:51.577' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:54:03.287' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:55:54.607' AS DateTime), N'dbo.UpdateCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.UpdateCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:55:54.610' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:55:58.877' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:56:07.440' AS DateTime), N'dbo.UpdateCreation', 1, N'DataBaseCommunication.Mappers.Requests.Creations.UpdateCreationRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:56:07.443' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:56:08.940' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.677' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.683' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.687' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.690' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.693' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.720' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.723' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:52.733' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:58:59.600' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T00:59:03.843' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:05:31.543' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:05:37.293' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:08:11.873' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:24.580' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:25.033' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:25.537' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:29.863' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:36.393' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:36.793' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:37.307' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:40.377' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:44.970' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:45.350' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:45.850' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:47.120' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllWorkerOrdersForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:58.930' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:59.330' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T01:13:59.830' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.270' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.273' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.277' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.277' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.277' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.280' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.280' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:55.283' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T18:59:57.983' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:00:12.983' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:25:08.387' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:25:08.570' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:25:09.073' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.563' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.583' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.587' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.590' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.593' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.643' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.647' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:44:44.657' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.250' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.260' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.267' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.270' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.293' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.297' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.303' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.160' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.167' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.170' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.177' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.177' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:12:04.680' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:21:05.633' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:21:41.617' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:26:50.270' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientStatusRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-09-04T19:26:50.270' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:47:43.257' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.693' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.723' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.730' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.737' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.740' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.767' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.770' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:09.780' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:50.350' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:50.510' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:25:51.020' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:35:31.080' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.210' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.213' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:50:27.223' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.207' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.210' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.210' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.213' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.213' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.237' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.237' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:51:01.250' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:58:50.467' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:58:50.703' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:58:51.197' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T16:59:33.860' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:00:09.707' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:00:09.900' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:00:10.400' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:00:12.263' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllWorkerOrdersForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:00:14.677' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:00:14.817' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:00:15.317' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:02:00.383' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:02:00.530' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:02:01.033' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:03:55.660' AS DateTime), N'dbo.Insert_Clients_Times', 1, N'DataBaseCommunication.Mappers.Requests.Clients.LogTimeRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:03:55.683' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:03:58.113' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:03:58.483' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:03:58.990' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:04:07.633' AS DateTime), N'dbo.Get_All_ClientTimes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllTimesForClientRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:04:20.893' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:04:21.050' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:04:21.553' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:04:32.387' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:04:32.537' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:04:33.040' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:05:17.833' AS DateTime), N'dbo.Insert_Clients_WorkerOrders', 1, N'DataBaseCommunication.Mappers.Requests.Clients.LogWorkersOrderRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:05:17.860' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:05:43.990' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:01.600' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:09.990' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T18:35:31.570' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:20.600' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:21.100' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:43.610' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:52.007' AS DateTime), N'dbo.Update_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.UpdateClientServicesRequest', N'True')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:57.153' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:57.653' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:58.040' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:58.183' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:06:58.690' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:07:05.467' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:07:14.693' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:07:19.017' AS DateTime), N'dbo.Get_Client_Services', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:07:21.423' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:07:21.933' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:07:23.753' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:07:24.253' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:09:37.807' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:09:38.307' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:09:44.037' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:09:44.203' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:09:44.703' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:16:06.790' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:16:07.287' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:28:34.147' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:28:34.477' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:28:34.987' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:41:36.683' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:42:13.867' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:42:17.767' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:43:34.650' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:48:01.313' AS DateTime), N'dbo.Get_Offers', 1, N'DataBaseCommunication.Mappers.Requests.Offers.OffersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T17:48:06.080' AS DateTime), N'dbo.Get_Creations', 1, N'DataBaseCommunication.Mappers.Requests.Creations.CurrentCreationsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:02:10.350' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.510' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.517' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.520' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.527' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.527' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.550' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.553' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-13T18:10:26.563' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.737' AS DateTime), N'dbo.usp_Login', 1, N'DataBaseCommunication.Mappers.Requests.Users.UserRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.753' AS DateTime), N'dbo.Get_AdminSettings', 1, N'DataBaseCommunication.Mappers.Requests.Settings.AdminSettingsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.757' AS DateTime), N'dbo.Get_Services', 1, N'DataBaseCommunication.Mappers.Requests.Settings.ServicesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.760' AS DateTime), N'dbo.Get_Firms', 1, N'DataBaseCommunication.Mappers.Requests.Settings.FirmsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.763' AS DateTime), N'dbo.Get_Times', 1, N'DataBaseCommunication.Mappers.Requests.Settings.TimesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.787' AS DateTime), N'dbo.GetAllClients', 1, N'DataBaseCommunication.Mappers.Requests.Clients.AllClientsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.790' AS DateTime), N'dbo.Get_All_Couriers', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllCouriresRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:18.800' AS DateTime), N'dbo.Get_All_Users', 1, N'DataBaseCommunication.Mappers.Requests.Users.AllUsersRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:30.933' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:31.103' AS DateTime), N'dbo.Get_All_Changes', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ClientChangesRequest', N'System.Data.SqlClient.SqlDataReader')
GO
INSERT [dbo].[Trace] ([Timestamp], [RequestUrl], [UserId], [Request], [Response]) VALUES (CAST(N'2018-10-15T19:51:31.613' AS DateTime), N'dbo.Get_Client_Reports', 1, N'DataBaseCommunication.Mappers.Requests.Clients.ReportsRequest', N'System.Data.SqlClient.SqlDataReader')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [CreationDate], [Email], [FirstName], [LastName], [Address], [City], [PhoneNumber], [Gender], [TeamId], [BirthDate], [EmploymentDate], [Slava], [Role]) VALUES (1, N'nikica', N'Nikica', CAST(N'2018-01-08T00:00:00.000' AS DateTime), N'1nikica@gmail.com', N'Nikolica1', N'Blagojevic1', N'1Vladislava Bajcevica 71', N'1Beograd - Zvezdara', N'0605370245', N'M', 1, CAST(N'1993-12-03T00:00:00.000' AS DateTime), CAST(N'2012-12-04T00:00:00.000' AS DateTime), N'1Slavica123', 1)
GO
INSERT [dbo].[Users] ([Id], [Username], [Password], [CreationDate], [Email], [FirstName], [LastName], [Address], [City], [PhoneNumber], [Gender], [TeamId], [BirthDate], [EmploymentDate], [Slava], [Role]) VALUES (11, N'pera.car', N'1234', CAST(N'2018-02-19T19:53:41.680' AS DateTime), N'car@gmail.com', N'Pera', N'Car', N'Majke Jevrosime', N'Beograd', N'', N'M', 2, CAST(N'1993-12-04T00:00:00.000' AS DateTime), CAST(N'2016-04-18T00:00:00.000' AS DateTime), N'Slavica', 2)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_System_Users_Username]    Script Date: 17-Oct-18 01:38:16 ******/
CREATE NONCLUSTERED INDEX [IX_System_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__CreationD__37A5467C]  DEFAULT (getdate()) FOR [CreationDate]
GO
/****** Object:  StoredProcedure [dbo].[Delete_Firm]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Delete_Service]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Delete_User_Data]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_AdminSettings]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_All_Changes]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_All_Clients]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_All_ClientTimes]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_All_Couriers]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_All_Users]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_All_WorkerOrders]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Client_Reports]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Client_Services]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Creations]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Firms]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Offers]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Services]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Get_Times]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_Client_Data]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_Clients_Changes]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_Clients_Times]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_Clients_WorkerOrders]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_Firm]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_Service]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_Time]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Insert_User_Data]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertCreation]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertOffer]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[MakeDboLog]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[SendMail]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_Client_Data]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_Client_Services]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_Client_Status]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_Service]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_Settings]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_Time]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[Update_User_Data]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateCreation]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateCreationStatus]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateDoneStatus]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdatePaymentStatus]    Script Date: 17-Oct-18 01:38:16 ******/
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
/****** Object:  StoredProcedure [dbo].[usp_Login]    Script Date: 17-Oct-18 01:38:16 ******/
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
