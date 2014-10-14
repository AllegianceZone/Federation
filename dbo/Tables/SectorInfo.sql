CREATE TABLE [dbo].[SectorInfo] (
	[MapID] [smallint] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[SectorName] char (24) NOT NULL ,
	[LightX] [real] NOT NULL ,
	[LightY] [real] NOT NULL ,
	[LightZ] [real] NOT NULL ,
	[LightColor] [int] NOT NULL ,
	[StarsCount] [smallint] NOT NULL ,
	[DebrisCount] [smallint] NOT NULL ,
	[starSeed] [int] NOT NULL ,
	[ScreenX] [real] NOT NULL ,
	[ScreenY] [real] NOT NULL ,
	[PosterFile] char (12) NULL ,
	[PlanetFile] char (12) NULL ,
	[PlanetSinLatitude] tinyint NULL ,
	[PlanetLongitude] tinyint NULL ,
	[PlanetRadius] [tinyint] NULL ,
	[IsHomeSector] [bit] NOT NULL 
) 
GO
ALTER TABLE [dbo].[SectorInfo] ADD 
	CONSTRAINT [FK_SectorInfo_Maps] FOREIGN KEY 
	(
		[MapID]
	) REFERENCES [dbo].[Maps] (
		[MapID]
	)
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_SectorInfo_LightX] DEFAULT (1) FOR [LightX]
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_SectorInfo_LightY] DEFAULT (1) FOR [LightY]
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_SectorInfo_LightZ] DEFAULT (1) FOR [LightZ]
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_SectorInfo_LightColor] DEFAULT (10000000) FOR [LightColor]
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_SectorInfo_StarsCount] DEFAULT (500) FOR [StarsCount]
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_SectorInfo_DebrisCount] DEFAULT (500) FOR [DebrisCount]
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_SectorInfo_starSeed] DEFAULT (1) FOR [starSeed]
GO
ALTER TABLE [dbo].[SectorInfo] WITH NOCHECK ADD 	CONSTRAINT [PK_SectorInfo] PRIMARY KEY  CLUSTERED 
	(
		[MapID],
		[SectorID]
	)  