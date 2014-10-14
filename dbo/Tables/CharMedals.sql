CREATE TABLE [dbo].[CharMedals] (
	[CharacterID] [int] NOT NULL ,
	[MedalID] [int] NOT NULL ,
	[CivID] [smallint] NULL ,
	[SpecificInfo] [char] (48) NULL 
)
GO
ALTER TABLE [dbo].[CharMedals] ADD 
	CONSTRAINT [FK_CharMedals_CharacterInfo] FOREIGN KEY 
	(
		[CharacterID]
	) REFERENCES [dbo].[CharacterInfo] (
		[CharacterID]
	)
GO
ALTER TABLE [dbo].[CharMedals] ADD 	CONSTRAINT [FK_CharMedals_Civs] FOREIGN KEY 
	(
		[CivID]
	) REFERENCES [dbo].[Civs] (
		[CivID]
	)
GO
ALTER TABLE [dbo].[CharMedals] ADD 	CONSTRAINT [FK_CharMedals_Medals] FOREIGN KEY 
	(
		[MedalID]
	) REFERENCES [dbo].[Medals] (
		[MedalID]
	)
GO
CREATE  CLUSTERED  INDEX [IX_CharMedals] ON [dbo].[CharMedals]([CharacterID], [CivID]) ON [PRIMARY]