CREATE TABLE [dbo].[Cloaks] (
	[PartID] [smallint] NOT NULL ,
	[EnergyConsumption] [real] NOT NULL ,
	[MaxCloaking] [real] NOT NULL ,
	[OnRate] [real] NOT NULL ,
	[OffRate] [real] NOT NULL ,
	[EngageSound] smallint NOT NULL ,
	[DisengageSound] smallint NOT NULL 
) 
GO
ALTER TABLE [dbo].[Cloaks] ADD 
	CONSTRAINT [FK_Cloaks_Parts] FOREIGN KEY 
	(
		[PartID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Cloaks] WITH NOCHECK ADD 	CONSTRAINT [DF_Cloaks_EngageSound] DEFAULT (640) FOR [EngageSound]
GO
ALTER TABLE [dbo].[Cloaks] WITH NOCHECK ADD 	CONSTRAINT [DF_Cloaks_DisengageSound] DEFAULT (660) FOR [DisengageSound]
GO
ALTER TABLE [dbo].[Cloaks] WITH NOCHECK ADD 	CONSTRAINT [PK_Cloaks] PRIMARY KEY  CLUSTERED 
	(
		[PartID]
	)  
GO