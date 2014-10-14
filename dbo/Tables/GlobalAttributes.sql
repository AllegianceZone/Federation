CREATE TABLE [dbo].[GlobalAttributes] (
	[GlobalAttributeID] [smallint] NOT NULL ,
	[MaxSpeed] [smallint] NOT NULL ,
	[Thrust] [smallint] NOT NULL ,
	[TurnRate] [smallint] NOT NULL ,
	[TurnTorque] [smallint] NOT NULL ,
	[MaxArmorStation] [smallint] NOT NULL ,
	[ArmorRegenerationStation] [smallint] NOT NULL ,
	[MaxShieldStation] [smallint] NOT NULL ,
	[ShieldRegenerationStation] [smallint] NOT NULL ,
	[MaxArmorShip] [smallint] NOT NULL ,
	[MaxShieldShip] [smallint] NOT NULL ,
	[ShieldRegenerationShip] [smallint] NOT NULL ,
	[ScanRange] [smallint] NOT NULL ,
	[Signature] [smallint] NOT NULL ,
	[MaxEnergy] [smallint] NOT NULL ,
	[SpeedAmmo] [smallint] NOT NULL ,
	[LifespanEnergy] [smallint] NOT NULL ,
	[TurnRateMissile] [smallint] NOT NULL ,
	[MiningRate] [smallint] NOT NULL ,
	[MiningYield] [smallint] NOT NULL ,
	[RipcordTime] [smallint] NOT NULL ,
	[DamageGuns] [smallint] NOT NULL ,
	[DamageMissiles] [smallint] NOT NULL ,
	[DevelopmentCost] [smallint] NOT NULL ,
	[DevelopmentTime] [smallint] NOT NULL ,
	[MiningCapacity] [smallint] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MaxSpeed] DEFAULT (0) FOR [MaxSpeed]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_Thrust] DEFAULT (0) FOR [Thrust]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_TurnRate] DEFAULT (0) FOR [TurnRate]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_TurnTorque] DEFAULT (0) FOR [TurnTorque]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MaxArmorStation] DEFAULT (0) FOR [MaxArmorStation]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_ArmorRegenerationStation] DEFAULT (0) FOR [ArmorRegenerationStation]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MaxShieldStation] DEFAULT (0) FOR [MaxShieldStation]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_ShieldRegenerationStation] DEFAULT (0) FOR [ShieldRegenerationStation]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MaxArmorShip] DEFAULT (0) FOR [MaxArmorShip]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MaxShieldShip] DEFAULT (0) FOR [MaxShieldShip]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_ShieldRegenerationShip] DEFAULT (0) FOR [ShieldRegenerationShip]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_ScanRange] DEFAULT (0) FOR [ScanRange]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_Signature] DEFAULT (0) FOR [Signature]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MaxEnergy] DEFAULT (0) FOR [MaxEnergy]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_SpeedAmmo] DEFAULT (0) FOR [SpeedAmmo]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_LifespanEnergy] DEFAULT (0) FOR [LifespanEnergy]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_TurnRateMissile] DEFAULT (0) FOR [TurnRateMissile]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MiningRate] DEFAULT (0) FOR [MiningRate]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MiningYield] DEFAULT (0) FOR [MiningYield]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_RipcordTime] DEFAULT (0) FOR [RipcordTime]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_DamageGuns] DEFAULT (0) FOR [DamageGuns]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_DamageMissiles] DEFAULT (0) FOR [DamageMissiles]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_DevelopmentCost] DEFAULT (0) FOR [DevelopmentCost]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_DevelopmentTime] DEFAULT (0) FOR [DevelopmentTime]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [DF_GlobalAttributes_MiningCapacity] DEFAULT (0) FOR [MiningCapacity]
GO
ALTER TABLE [dbo].[GlobalAttributes] WITH NOCHECK ADD 	CONSTRAINT [PK_GlobalAttributes] PRIMARY KEY  NONCLUSTERED 
	(
		[GlobalAttributeID]
	)  ON [PRIMARY]
GO