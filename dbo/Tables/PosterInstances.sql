CREATE TABLE [dbo].[PosterInstances] (
	[PosterID] [int] NOT NULL ,
	[PosterName] char (24) NOT NULL ,
	[Texture] char (12) NOT NULL ,
	[MapID] [smallint] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[Radius] [int] NOT NULL ,
	[LocationX] [int] NOT NULL ,
	[LocationY] [int] NOT NULL ,
	[LocationZ] [int] NOT NULL ,
	[Color] [int] NOT NULL ,
	[Longitude] [smallint] NOT NULL ,
	[Latitude] [smallint] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PosterInstances] ADD 
	CONSTRAINT [FK_PosterInstances_SectorInfo] FOREIGN KEY 
	(
		[MapID],
		[SectorID]
	) REFERENCES [dbo].[SectorInfo] (
		[MapID],
		[SectorID]
	)
GO
ALTER TABLE [dbo].[PosterInstances] WITH NOCHECK ADD 
	CONSTRAINT [PK_PosterInstances] PRIMARY KEY  NONCLUSTERED 
	(
		[PosterID],
		[MapID]
	)  ON [PRIMARY]