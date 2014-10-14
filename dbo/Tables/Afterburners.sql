CREATE TABLE [dbo].[Afterburners] (
	[PartID] [smallint] NOT NULL ,
	[BurnRate] [real] NOT NULL ,
	[MaxThrust] [real] NOT NULL ,
	[HullThrustMultiplier] [real] NOT NULL ,
	[rateOn] [real] NOT NULL ,
	[rateOff] [real] NOT NULL ,
	[InteriorSound] smallint NOT NULL ,
	[ExteriorSound] smallint NOT NULL 
) 
GO
ALTER TABLE [dbo].[Afterburners] ADD 
	CONSTRAINT [FK_Afterburners_Parts] FOREIGN KEY 
	(
		[PartID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Afterburners] WITH NOCHECK ADD 	CONSTRAINT [DF_Afterburners_InteriorSound] DEFAULT (680) FOR [InteriorSound]
GO
ALTER TABLE [dbo].[Afterburners] WITH NOCHECK ADD 	CONSTRAINT [DF_Afterburners_ExteriorSound] DEFAULT (700) FOR [ExteriorSound]
GO
ALTER TABLE [dbo].[Afterburners] WITH NOCHECK ADD 	CONSTRAINT [PK_Afterburners] PRIMARY KEY  CLUSTERED 
	(
		[PartID]
	)  