CREATE TABLE [dbo].[Medals] (
	[MedalID] [int] NOT NULL ,
	[MedalName] [char] (48) NOT NULL ,
	[MedalDescription] char (200) NOT NULL ,
	[MedalSortOrder] [int] NOT NULL ,
	[MedalBitmap] [char] (12) NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medals] WITH NOCHECK ADD 	CONSTRAINT [DF_Medals_MedalRanking] DEFAULT (100000) FOR [MedalSortOrder]
GO
ALTER TABLE [dbo].[Medals] WITH NOCHECK ADD 	CONSTRAINT [PK_Medals] PRIMARY KEY  NONCLUSTERED 
	(
		[MedalID]
	)  ON [PRIMARY]
GO