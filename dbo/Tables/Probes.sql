CREATE TABLE [dbo].[Probes] (
	[ExpendableID] [smallint] NOT NULL ,
	[ScanRange] [real] NOT NULL ,
	[ProjectileID] smallint NULL ,
	[dtimeBurst] [smallint] NOT NULL ,
	[accuracy] tinyint NOT NULL ,
	[dispersion] [float] NOT NULL ,
	[AmbientSound] smallint NOT NULL ,
	[Ammo] [smallint] NOT NULL ,
	[dtRipcord] [tinyint] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Probes] ADD 
	CONSTRAINT [FK_Probes_Expendable] FOREIGN KEY 
	(
		[ExpendableID]
	) REFERENCES [dbo].[Expendables] (
		[ExpendableID]
	)
GO
ALTER TABLE [dbo].[Probes] ADD 	CONSTRAINT [FK_Probes_Projectiles] FOREIGN KEY 
	(
		[ProjectileID]
	) REFERENCES [dbo].[Projectiles] (
		[ProjectileID]
	)
GO
ALTER TABLE [dbo].[Probes] WITH NOCHECK ADD 	CONSTRAINT [DF_Probes_dtimeBurst] DEFAULT (200) FOR [dtimeBurst]
GO
ALTER TABLE [dbo].[Probes] WITH NOCHECK ADD 	CONSTRAINT [DF_Probes_accuracy] DEFAULT (50) FOR [accuracy]
GO
ALTER TABLE [dbo].[Probes] WITH NOCHECK ADD 	CONSTRAINT [DF_Probes_dispersion] DEFAULT (0.01) FOR [dispersion]
GO
ALTER TABLE [dbo].[Probes] WITH NOCHECK ADD 	CONSTRAINT [DF_Probes_AmbientSound] DEFAULT (720) FOR [AmbientSound]
GO
ALTER TABLE [dbo].[Probes] WITH NOCHECK ADD 	CONSTRAINT [DF_Probes_Ammo] DEFAULT (0) FOR [Ammo]
GO
ALTER TABLE [dbo].[Probes] WITH NOCHECK ADD 	CONSTRAINT [DF_Probes_dtRipcord] DEFAULT (255) FOR [dtRipcord]
GO
ALTER TABLE [dbo].[Probes] WITH NOCHECK ADD 	CONSTRAINT [PK_Probes] PRIMARY KEY  NONCLUSTERED 
	(
		[ExpendableID]
	)  ON [PRIMARY]