CREATE TABLE [dbo].[Chaff] (
	[ExpendableID] [smallint] NOT NULL ,
	[Strength] [real] NOT NULL 
) 
GO
ALTER TABLE [dbo].[Chaff] WITH NOCHECK ADD 	CONSTRAINT [DF_Chaff_Strength] DEFAULT (1) FOR [Strength]
GO
ALTER TABLE [dbo].[Chaff] WITH NOCHECK ADD 	CONSTRAINT [PK_Chaff] PRIMARY KEY  CLUSTERED 
	(
		[ExpendableID]
	)  
GO