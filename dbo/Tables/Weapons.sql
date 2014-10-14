CREATE TABLE [dbo].[Weapons] (
	[PartID] [smallint] NOT NULL ,
	[dTimeBurstShots] [smallint] NOT NULL ,
	[dTimeReady] [smallint] NOT NULL ,
	[EnergyPerShot] [real] NOT NULL ,
	[ProjectileID1] smallint NOT NULL ,
	[cBulletsPerShot] [smallint] NOT NULL ,
	[ActivateSound] smallint NOT NULL ,
	[SingleShotSound] smallint NOT NULL ,
	[BurstShotSound] smallint NOT NULL ,
	[Dispersion] [real] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Weapons] ADD 
	CONSTRAINT [FK_Weapons_Parts] FOREIGN KEY 
	(
		[PartID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Weapons] ADD 	CONSTRAINT [FK_Weapons_Projectiles] FOREIGN KEY 
	(
		[ProjectileID1]
	) REFERENCES [dbo].[Projectiles] (
		[ProjectileID]
	)
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [DF_WeaponTypes_RateOfFire] DEFAULT (0) FOR [dTimeBurstShots]
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [DF_Weapons_TimeBetween] DEFAULT (0) FOR [EnergyPerShot]
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [DF_WeaponTypes_ProjectileID1] DEFAULT (0) FOR [ProjectileID1]
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [DF_Weapons_ActivateSound] DEFAULT (80) FOR [ActivateSound]
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [DF_Weapons_BurstShotSound] DEFAULT ((-1)) FOR [BurstShotSound]
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [DF_Weapons_Dispersion] DEFAULT (0.005) FOR [Dispersion]
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [PK_WeaponTypes] PRIMARY KEY  NONCLUSTERED 
	(
		[PartID]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[Weapons] WITH NOCHECK ADD 	CONSTRAINT [CK_Weapons] CHECK ([dTimeBurstShots] > 0 and [dTimeReady] > 0 and [EnergyPerShot] >= 0 and [cBulletsPerShot] >= 0 and [Dispersion] >= 0 and [Dispersion] <= 0.15)