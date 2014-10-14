CREATE TABLE [dbo].[Effects] (
	[EffectID] smallint NOT NULL ,
	[Description] char (200) NOT NULL ,
	[FileSound] char (12) NOT NULL ,
	[IsLooping] [bit] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Effects] WITH NOCHECK ADD 
	CONSTRAINT [PK_Effects] PRIMARY KEY  NONCLUSTERED 
	(
		[EffectID]
	)  ON [PRIMARY]