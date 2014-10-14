CREATE TABLE [dbo].[PlayerResults] (
	ID int identity not null primary key clustered,
	[GameID] [char] (17) NOT NULL ,
	[TeamID] [smallint] NOT NULL ,
	[Name] char (24) NOT NULL ,
	[PlayerKills] [smallint] NOT NULL ,
	[BuilderKills] [smallint] NOT NULL ,
	[LayerKills] [smallint] NOT NULL ,
	[MinerKills] [smallint] NOT NULL ,
	[BaseKills] [smallint] NOT NULL ,
	[BaseCaptures] [smallint] NOT NULL ,
	[PilotBaseKills] [smallint] NOT NULL ,
	[PilotBaseCaptures] [smallint] NOT NULL ,
	[Deaths] [smallint] NOT NULL ,
	[Ejections] [smallint] NOT NULL ,
	[Rescues] [smallint] NOT NULL ,
	[Flags] [smallint] NOT NULL ,
	[Artifacts] [smallint] NOT NULL ,
	[TechsRecovered] [smallint] NOT NULL ,
	[AlephsSpotted] [smallint] NOT NULL ,
	[AsteroidsSpotted] [smallint] NOT NULL ,
	[CombatRating] [real] NOT NULL ,
	[Score] [real] NOT NULL ,
	[TimePlayed] [int] NOT NULL 
) 
GO
CREATE  INDEX [IX_PlayerResults_GameID] ON [dbo].[PlayerResults]([GameID]) 
GO
CREATE  INDEX [IX_PlayerResults_Name] ON [dbo].[PlayerResults]([Name]) 