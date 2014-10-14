CREATE TABLE [dbo].[TeamResults] (
	ID int identity not null primary key clustered,
	[GameID] [char] (17) NOT NULL ,
	[TeamID] [smallint] NOT NULL ,
	[Name] char (24) NOT NULL ,
	[CivID] [smallint] NOT NULL ,
	[Techs] [char] (100) NOT NULL ,
	[PlayerKills] [smallint] NOT NULL ,
	[BaseKills] [smallint] NOT NULL ,
	[BaseCaptures] [smallint] NOT NULL ,
	[Deaths] [smallint] NOT NULL ,
	[Ejections] [smallint] NOT NULL ,
	[Flags] [smallint] NOT NULL ,
	[Artifacts] [smallint] NOT NULL ,
	[ConquestPercent] [smallint] NOT NULL ,
	[ProsperityPercentBought] [smallint] NOT NULL ,
	[ProsperityPercentComplete] [smallint] NOT NULL ,
	[TimeEndured] [int] NOT NULL 
) 
GO
CREATE  INDEX [IX_TeamResults_GameID] ON [dbo].[TeamResults]([GameID]) 