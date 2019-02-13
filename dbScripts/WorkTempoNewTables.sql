USE [DailyJob]
GO

/****** Object:  Table [dbo].[EmployeeWorkTempo]    Script Date: 06/02/2019 23:40:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeWorkTempo](
	[EmployeeID] [int] NULL,
	[Date] [date] NULL,
	[StatusID] [int] NULL,
 CONSTRAINT [UK_ID] UNIQUE NONCLUSTERED 
(
	[EmployeeID] ASC,
	[Date] ASC,
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[EmployeeWorkTempo]  WITH CHECK ADD FOREIGN KEY([StatusID])
REFERENCES [dbo].[WorkTempoStatus] ([ID])
GO






USE [DailyJob]
GO

/****** Object:  Table [dbo].[WorkTempoStatus]    Script Date: 06/02/2019 23:40:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[WorkTempoStatus](
	[ID] [int] NOT NULL,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_WorkTempoStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO