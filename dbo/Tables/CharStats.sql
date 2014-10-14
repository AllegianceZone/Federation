CREATE TABLE [dbo].[CharStats] (
	[CharacterID] [int] NOT NULL ,
	[CharacterName] char (24) NOT NULL ,
	[CivID] [smallint] NULL ,
	[Rank] [smallint] NOT NULL ,
	[Score] [real] NOT NULL ,
	[MinutesPlayed] [int] NOT NULL ,
	[BaseKills] [smallint] NOT NULL ,
	[BaseCaptures] [smallint] NOT NULL ,
	[Kills] [smallint] NOT NULL ,
	[Rating] [smallint] NOT NULL ,
	[GamesPlayed] [smallint] NOT NULL ,
	[Deaths] [smallint] NOT NULL ,
	[Wins] [smallint] NOT NULL ,
	[Losses] [smallint] NOT NULL ,
	[WinsCmd] [smallint] NOT NULL ,
	[LossesCmd] [smallint] NOT NULL ,
	[LastPlayed] [smalldatetime] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CharStats] ADD 
	CONSTRAINT [FK_CharStats_CharacterInfo] FOREIGN KEY 
	(
		[CharacterID]
	) REFERENCES [dbo].[CharacterInfo] (
		[CharacterID]
	)
GO
ALTER TABLE [dbo].[CharStats] ADD 	CONSTRAINT [FK_CharStats_Civs] FOREIGN KEY 
	(
		[CivID]
	) REFERENCES [dbo].[Civs] (
		[CivID]
	)
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_Rank] DEFAULT (1) FOR [Rank]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_Overall Rating] DEFAULT (0) FOR [Score]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_MinutesPlayed] DEFAULT (0) FOR [MinutesPlayed]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_BaseKills] DEFAULT (0) FOR [BaseKills]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_BaseCaptures] DEFAULT (0) FOR [BaseCaptures]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_Kills] DEFAULT (0) FOR [Kills]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_Combat Rating] DEFAULT (1000) FOR [Rating]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_GamesPlayed] DEFAULT (0) FOR [GamesPlayed]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_Deaths] DEFAULT (0) FOR [Deaths]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_Wins] DEFAULT (0) FOR [Wins]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_Losses] DEFAULT (0) FOR [Losses]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_WinsCmd] DEFAULT (0) FOR [WinsCmd]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [DF_CharStats_LossesCmd] DEFAULT (0) FOR [LossesCmd]
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [IX_CharStats] UNIQUE  NONCLUSTERED 
	(
		[CharacterID],
		[CivID]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[CharStats] WITH NOCHECK ADD 	CONSTRAINT [CK_CharStats] CHECK ([CivID] > 0)
GO
CREATE  INDEX [IX_CharStats_GamesPlayed] ON [dbo].[CharStats]([CivID], [GamesPlayed], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_Deaths] ON [dbo].[CharStats]([CivID], [Deaths], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_Wins] ON [dbo].[CharStats]([CivID], [Wins], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_Losses] ON [dbo].[CharStats]([CivID], [Losses], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_WinsCmd] ON [dbo].[CharStats]([CivID], [WinsCmd], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_LossesCmd] ON [dbo].[CharStats]([CivID], [LossesCmd], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_Score] ON [dbo].[CharStats]([CivID], [Score], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_MinutesPlayed] ON [dbo].[CharStats]([CivID], [MinutesPlayed], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_BaseKills] ON [dbo].[CharStats]([CivID], [BaseKills], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_BaseCaptures] ON [dbo].[CharStats]([CivID], [BaseCaptures], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_Kills] ON [dbo].[CharStats]([CivID], [Kills], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_Rating] ON [dbo].[CharStats]([CivID], [Rating], [CharacterID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_CharStats_Name] ON [dbo].[CharStats]([CivID], [CharacterName], [CharacterID]) ON [PRIMARY]