CREATE TABLE [dbo].[Squads] (
	[SquadID] [int] NOT NULL ,
	[SquadName] char (24) NOT NULL ,
	[Score] [smallint] NOT NULL ,
	[Wins] [smallint] NOT NULL ,
	[Losses] [smallint] NOT NULL ,
	[OwnershipLog] [varchar] (500) NOT NULL ,
	[CivID] [smallint] NULL ,
	[GamesPlayed] [smallint] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Squads] WITH NOCHECK ADD 	CONSTRAINT [DF_Squads_Score] DEFAULT (0) FOR [Score]
GO
ALTER TABLE [dbo].[Squads] WITH NOCHECK ADD 	CONSTRAINT [DF_Squads_Wins] DEFAULT (0) FOR [Wins]
GO
ALTER TABLE [dbo].[Squads] WITH NOCHECK ADD 	CONSTRAINT [DF_Squads_Losses] DEFAULT (0) FOR [Losses]
GO
ALTER TABLE [dbo].[Squads] WITH NOCHECK ADD 	CONSTRAINT [DF_Squads_OwnershipLog] DEFAULT ('') FOR [OwnershipLog]
GO
ALTER TABLE [dbo].[Squads] WITH NOCHECK ADD 	CONSTRAINT [DF_Squads_GamesPlayed] DEFAULT (0) FOR [GamesPlayed]
GO
ALTER TABLE [dbo].[Squads] WITH NOCHECK ADD 	CONSTRAINT [PK_Squads] PRIMARY KEY  NONCLUSTERED 
	(
		[SquadID]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[Squads] WITH NOCHECK ADD 	CONSTRAINT [IX_Squads_Name] UNIQUE  NONCLUSTERED 
	(
		[SquadName]
	)  ON [PRIMARY]
GO
CREATE  INDEX [IX_Squads_Score] ON [dbo].[Squads]([Score]) ON [PRIMARY]
GO
CREATE  INDEX [IX_Squads_Wins] ON [dbo].[Squads]([Wins]) ON [PRIMARY]
GO
CREATE  INDEX [IX_Squads_Losses] ON [dbo].[Squads]([Losses]) ON [PRIMARY]