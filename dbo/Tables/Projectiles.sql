CREATE TABLE [dbo].[Projectiles] (
	[ProjectileID] smallint NOT NULL ,
	[TimeDuration] [smallint] NOT NULL ,
	[HitPointsInflict] [real] NOT NULL ,
	[DamageType] [tinyint] NOT NULL ,
	[FileModel] char (12) NOT NULL ,
	[FileTexture] char (12) NOT NULL ,
	[SpeedMax] [smallint] NOT NULL ,
	[Acceleration] [smallint] NOT NULL ,
	[Size_cm] [smallint] NOT NULL ,
	[RadiusBlast_m] [tinyint] NOT NULL ,
	[percentPenetration] tinyint NOT NULL ,
	[RateRotation] [real] NOT NULL ,
	[IsAbsoluteSpeed] [bit] NOT NULL ,
	[IsDirectional] [bit] NOT NULL ,
	[IsExplodeOnExpire] [bit] NOT NULL ,
	[IsProximityFuse] [bit] NOT NULL ,
	[percentRed] tinyint NOT NULL ,
	[percentGreen] tinyint NOT NULL ,
	[percentBlue] tinyint NOT NULL ,
	[percentAlpha] tinyint NOT NULL ,
	[BlastPower] [real] NOT NULL ,
	[BlastRadius] [real] NOT NULL ,
	[WidthOverHeight] [real] NOT NULL ,
	[PRIcon] char (12) NULL ,
	[AmbientSound] smallint NOT NULL 
) 
GO
ALTER TABLE [dbo].[Projectiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Projectiles_DamageType] DEFAULT (0) FOR [DamageType]
GO
ALTER TABLE [dbo].[Projectiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Projectiles_BlastPower] DEFAULT (0) FOR [BlastPower]
GO
ALTER TABLE [dbo].[Projectiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Projectiles_BlastRadius] DEFAULT (0) FOR [BlastRadius]
GO
ALTER TABLE [dbo].[Projectiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Projectiles_WidthOverHeight] DEFAULT (1) FOR [WidthOverHeight]
GO
ALTER TABLE [dbo].[Projectiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Projectiles_AmbientSound] DEFAULT ((-1)) FOR [AmbientSound]
GO
ALTER TABLE [dbo].[Projectiles] WITH NOCHECK ADD 	CONSTRAINT [PK_Projectiles] PRIMARY KEY  CLUSTERED 
	(
		[ProjectileID]
	)   
GO
ALTER TABLE [dbo].[Projectiles] WITH NOCHECK ADD 	CONSTRAINT [CK_Projectiles] CHECK ([Size_cm] > 0 and [TimeDuration] >= 200 and [SpeedMax] <= 5000 and [SpeedMax] > 50)