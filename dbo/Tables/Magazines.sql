CREATE TABLE [dbo].[Magazines] (
	[PartID] [smallint] NOT NULL ,
	[Amount] [smallint] NOT NULL ,
	[ExpendableID] [smallint] NOT NULL ,
	[SuccessorPartID] [smallint] NULL ,
	[LaunchCount] [smallint] NULL 
) 
GO
ALTER TABLE [dbo].[Magazines] ADD 
	CONSTRAINT [FK_Magazines_Expendable] FOREIGN KEY 
	(
		[ExpendableID]
	) REFERENCES [dbo].[Expendables] (
		[ExpendableID]
	)
GO
ALTER TABLE [dbo].[Magazines] ADD 	CONSTRAINT [FK_Magazines_Magazines] FOREIGN KEY 
	(
		[SuccessorPartID]
	) REFERENCES [dbo].[Magazines] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Magazines] ADD 	CONSTRAINT [FK_Magazines_Parts] FOREIGN KEY 
	(
		[PartID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Magazines] WITH NOCHECK ADD 
	CONSTRAINT [PK_Magazines] PRIMARY KEY  CLUSTERED 
	(
		[PartID]
	)  