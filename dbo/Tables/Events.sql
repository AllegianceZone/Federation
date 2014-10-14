CREATE TABLE [dbo].[Events] (
	[EventID] [int] IDENTITY (1, 1) NOT NULL PRIMARY KEY CLUSTERED,
	[Event] [int] NOT NULL ,
	[DateTime] [datetime] NULL ,
	[ComputerName] [varchar] (15) NOT NULL ,
	[Subject] [int] NOT NULL ,
	[SubjectName] [varchar] (32) NOT NULL ,
	[Context] [varchar] (24) NOT NULL ,
	[ObjectRef] [varchar] (4000) NOT NULL 
) 
GO
ALTER TABLE [dbo].[Events] WITH NOCHECK ADD 
	CONSTRAINT [DF_Events_DateTime] DEFAULT (getdate()) FOR [DateTime]