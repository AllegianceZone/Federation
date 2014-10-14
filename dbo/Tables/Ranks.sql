CREATE TABLE [dbo].[Ranks] (
	[Rank] [smallint] NOT NULL ,
	[CivID] [smallint] NULL ,
	[Requirement] [int] NOT NULL ,
	[Name] char (24) NOT NULL 
) 
GO
ALTER TABLE [dbo].[Ranks] WITH NOCHECK ADD 	CONSTRAINT [DF_Ranks_Requirement] DEFAULT (0) FOR [Requirement]
GO
ALTER TABLE [dbo].[Ranks] WITH NOCHECK ADD 	CONSTRAINT [DF_Ranks_Name] DEFAULT ('') FOR [Name]
GO
ALTER TABLE [dbo].[Ranks] WITH NOCHECK ADD 	CONSTRAINT [IX_Ranks] UNIQUE  CLUSTERED 
	(
		[CivID],
		[Rank]
	)  
GO
CREATE  INDEX [IX_Ranks_Requirement] ON [dbo].[Ranks]([CivID], [Requirement]) 
GO