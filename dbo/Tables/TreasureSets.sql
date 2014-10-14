CREATE TABLE [dbo].[TreasureSets] (
	[TreasureSetName] [char] (40) NOT NULL ,
	[TreasureSetID] [smallint] NOT NULL ,
	[IsZoneOnly] [bit] NOT NULL 
) 
GO
ALTER TABLE [dbo].[TreasureSets] WITH NOCHECK ADD 	CONSTRAINT [DF_TreasureSets_IsZoneOnly] DEFAULT (0) FOR [IsZoneOnly]
GO
ALTER TABLE [dbo].[TreasureSets] WITH NOCHECK ADD 	CONSTRAINT [PK_TreasureSets] PRIMARY KEY  CLUSTERED 
	(
		[TreasureSetID]
	)  