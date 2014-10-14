CREATE TABLE [dbo].[Missiles] (
	[ExpendableID] [smallint] NOT NULL,
	[Acceleration] [real] NOT NULL ,
	[TurnRate] [real] NOT NULL ,
	[InitialSpeed] [real] NOT NULL ,
	[ArmTime] [real] NOT NULL ,
	[LockTime] [real] NOT NULL ,
	[ReadyTime] [real] NOT NULL ,
	[Dispersion] [real] NOT NULL ,
	[LockAngle] [real] NOT NULL ,
	[Power] [real] NOT NULL ,
	[DamageType] [tinyint] NOT NULL ,
	[BlastPower] [real] NOT NULL ,
	[BlastRadius] [real] NOT NULL ,
	[IsDirectional] [bit] NOT NULL ,
	[WidthOverHeight] [real] NOT NULL ,
	[MaxLock] [real] NOT NULL ,
	[ChaffResistance] [real] NOT NULL ,
	[LaunchSound] smallint NOT NULL ,
	[FlightSound] smallint NOT NULL 
) 
GO
ALTER TABLE [dbo].[Missiles] ADD 
	CONSTRAINT [FK_Missiles_Expendable] FOREIGN KEY 
	(
		[ExpendableID]
	) REFERENCES [dbo].[Expendables] (
		[ExpendableID]
	)
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Missiles_BlastPower] DEFAULT (0) FOR [BlastPower]
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Missiles_BlastRadius] DEFAULT (0) FOR [BlastRadius]
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Missiles_WidthOverHeight] DEFAULT (1) FOR [WidthOverHeight]
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Missiles_MaxLock] DEFAULT (1) FOR [MaxLock]
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Missiles_ChaffResistance] DEFAULT (1) FOR [ChaffResistance]
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Missiles_LaunchSound] DEFAULT (500) FOR [LaunchSound]
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [DF_Missiles_FlightSound] DEFAULT (540) FOR [FlightSound]
GO
ALTER TABLE [dbo].[Missiles] WITH NOCHECK ADD 	CONSTRAINT [PK_Missiles] PRIMARY KEY CLUSTERED 
	(
		[ExpendableID]
	)  