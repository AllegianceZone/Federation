CREATE TABLE [dbo].[Shields] (
	[PartID] [smallint] NOT NULL ,
	[RegenRate] [real] NOT NULL ,
	[HitPoints] smallint NOT NULL ,
	[ActivateSound] smallint NOT NULL ,
	[DeactivateSound] smallint NOT NULL ,
	[DefenseType] [tinyint] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Shields] ADD 
	CONSTRAINT [FK_Shields_Parts] FOREIGN KEY 
	(
		[PartID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Shields] WITH NOCHECK ADD 	CONSTRAINT [DF_Shields_ActivateSound] DEFAULT (580) FOR [ActivateSound]
GO
ALTER TABLE [dbo].[Shields] WITH NOCHECK ADD 	CONSTRAINT [DF_Shields_DeactivateSound] DEFAULT (620) FOR [DeactivateSound]
GO
ALTER TABLE [dbo].[Shields] WITH NOCHECK ADD 	CONSTRAINT [PK_Shields] PRIMARY KEY  NONCLUSTERED 
	(
		[PartID]
	)  ON [PRIMARY]
GO