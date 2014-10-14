CREATE TABLE [dbo].[Asteroids] (
	[MapID] [smallint] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[AsteroidID] [smallint] NOT NULL ,
	[Ore] [real] NOT NULL ,
	[AbilitiesMask] [smallint] NOT NULL ,
	[HitPoints] smallint NOT NULL ,
	[Radius] [smallint] NOT NULL ,
	[FileModel] char (12) NOT NULL ,
	[FileTexture] char (12) NULL ,
	[FileIcon] char (12) NOT NULL ,
	[Mass] [real] NOT NULL ,
	[Signature] [real] NOT NULL ,
	[LocationX] [real] NOT NULL ,
	[LocationY] [real] NOT NULL ,
	[LocationZ] [real] NOT NULL ,
	[UpX] [real] NULL ,
	[UpY] [real] NULL ,
	[UpZ] [real] NULL ,
	[ForwardX] [real] NULL ,
	[ForwardY] [real] NULL ,
	[ForwardZ] [real] NULL ,
	[RotationAx] [real] NULL ,
	[RotationAy] [real] NULL ,
	[RotationAz] [real] NULL ,
	[RotationR] [real] NULL ,
	[Name] char (24) NOT NULL 
) 
GO
ALTER TABLE [dbo].[Asteroids] ADD 
	CONSTRAINT [FK_Asteroids_SectorInfo] FOREIGN KEY 
	(
		[MapID],
		[SectorID]
	) REFERENCES [dbo].[SectorInfo] (
		[MapID],
		[SectorID]
	)
GO
ALTER TABLE [dbo].[Asteroids] WITH NOCHECK ADD 	CONSTRAINT [DF_Asteroids_FileModel] DEFAULT ('bgrnd03') FOR [FileModel]
GO
ALTER TABLE [dbo].[Asteroids] WITH NOCHECK ADD 	CONSTRAINT [DF_Asteroids_FileIcon] DEFAULT ('meteoricon') FOR [FileIcon]
GO
ALTER TABLE [dbo].[Asteroids] WITH NOCHECK ADD 	CONSTRAINT [PK_Asteroids] PRIMARY KEY  CLUSTERED 
	(
		[MapID],
		[AsteroidID]
	)  
GO
CREATE  INDEX [IX_Asteroids] ON [dbo].[Asteroids]([SectorID]) 