CREATE TABLE [dbo].[TreasureChances] (
	[ObjectID] [smallint] NOT NULL ,
	[Chance] [tinyint] NOT NULL ,
	[TreasureSetID] [smallint] NOT NULL ,
	[TreasureCode] [tinyint] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TreasureChances] ADD 
	CONSTRAINT [FK_TreasureChance_Parts] FOREIGN KEY 
	(
		[ObjectID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[TreasureChances] ADD 	CONSTRAINT [FK_TreasureChance_TreasureSets] FOREIGN KEY 
	(
		[TreasureSetID]
	) REFERENCES [dbo].[TreasureSets] (
		[TreasureSetID]
	)
GO
ALTER TABLE [dbo].[TreasureChances] WITH NOCHECK ADD 	CONSTRAINT [DF_TreasureChances_Chance] DEFAULT (0) FOR [Chance]
GO
ALTER TABLE [dbo].[TreasureChances] ADD 	CONSTRAINT [DF_TreasureChances_TreasureCode] DEFAULT (1) FOR [TreasureCode]
GO
ALTER TABLE [dbo].[TreasureChances] ADD 	CONSTRAINT [PK_TreasureChances] PRIMARY KEY  NONCLUSTERED 
	(
		[TreasureSetID],
		[ObjectID]
	)  ON [PRIMARY]
GO
CREATE  INDEX [IX_TreasureChance_PartID] ON [dbo].[TreasureChances]([ObjectID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_TreasureChance_SetID] ON [dbo].[TreasureChances]([TreasureSetID]) ON [PRIMARY]