CREATE TABLE [dbo].[ShipTypes] (
	[Name] [char] (20) NOT NULL ,
	[ShipTypeID] smallint NOT NULL ,
	[Model] char (12) NOT NULL ,
	[Length] [real] NOT NULL ,
	[Weight] [real] NOT NULL ,
	[Price] [int] NOT NULL ,
	[BaseMaxSpeed] [int] NOT NULL ,
	[BaseHitPoints] smallint NOT NULL ,
	[BaseScannerRange] [int] NOT NULL ,
	[Description] char (200) NOT NULL ,
	[MaxRollRate] [real] NOT NULL ,
	[MaxPitchRate] [real] NOT NULL ,
	[MaxYawRate] [real] NOT NULL ,
	[DriftRoll] [real] NOT NULL ,
	[DriftPitch] [real] NOT NULL ,
	[DriftYaw] [real] NOT NULL ,
	[Acceleration] [real] NOT NULL ,
	[AccelSideMultiplier] [real] NOT NULL ,
	[AccelBackMultiplier] [real] NOT NULL ,
	[BaseSignature] [smallint] NOT NULL ,
	[EnergyMax] [real] NOT NULL ,
	[RateRechargeEnergy] [real] NOT NULL ,
	[TechBitsRequired] char (256) NOT NULL ,
	[TechBitsEffect] char (256) NOT NULL ,
	[Capabilities] [smallint] NOT NULL ,
	[MaxAmmo] [smallint] NOT NULL ,
	[MaxFuel] [smallint] NOT NULL ,
	[PRIcon] char (12) NOT NULL ,
	[ShieldPartMask] [smallint] NOT NULL ,
	[AfterburnerPartMask] [smallint] NOT NULL ,
	[CloakPartMask] [smallint] NOT NULL ,
	[MagazinePartMask] [smallint] NOT NULL ,
	[DispenserPartMask] [smallint] NOT NULL ,
	[ChaffPartMask] [smallint] NOT NULL ,
	[MagazineCapacity] [smallint] NOT NULL ,
	[DispenserCapacity] [smallint] NOT NULL ,
	[ChaffCapacity] [smallint] NOT NULL ,
	[SuccessorHullID] smallint NULL ,
	[PilotHUD] char (12) NOT NULL ,
	[ObserverHUD] char (12) NOT NULL ,
	[InteriorSound] smallint NOT NULL ,
	[ExteriorSound] smallint NOT NULL ,
	[ThrustInteriorSound] smallint NOT NULL ,
	[ThrustExteriorSound] smallint NOT NULL ,
	[TurnInteriorSound] smallint NOT NULL ,
	[TurnExteriorSound] smallint NOT NULL ,
	[SortOrder] int NULL ,
	[PreferredPartID14] [smallint] NULL ,
	[PreferredPartID13] [smallint] NULL ,
	[PreferredPartID12] [smallint] NULL ,
	[PreferredPartID11] [smallint] NULL ,
	[PreferredPartID10] [smallint] NULL ,
	[PreferredPartID9] [smallint] NULL ,
	[PreferredPartID8] [smallint] NULL ,
	[PreferredPartID7] [smallint] NULL ,
	[PreferredPartID6] [smallint] NULL ,
	[PreferredPartID5] [smallint] NULL ,
	[PreferredPartID4] [smallint] NULL ,
	[PreferredPartID3] [smallint] NULL ,
	[PreferredPartID2] [smallint] NULL ,
	[PreferredPartID1] [smallint] NULL ,
	[DefenseType] [tinyint] NOT NULL ,
	[SecondsToBuild] [smallint] NOT NULL ,
	[GroupID] tinyint NULL ,
	[RipcordSpeed] [real] NOT NULL ,
	[ECM] [real] NOT NULL ,
	[RipcordCost] [real] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShipTypes] ADD 
	CONSTRAINT [FK_ShipTypes_Parts] FOREIGN KEY 
	(
		[PreferredPartID1]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts1] FOREIGN KEY 
	(
		[PreferredPartID2]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts10] FOREIGN KEY 
	(
		[PreferredPartID11]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts11] FOREIGN KEY 
	(
		[PreferredPartID12]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts12] FOREIGN KEY 
	(
		[PreferredPartID13]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts13] FOREIGN KEY 
	(
		[PreferredPartID14]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts2] FOREIGN KEY 
	(
		[PreferredPartID3]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts3] FOREIGN KEY 
	(
		[PreferredPartID4]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts4] FOREIGN KEY 
	(
		[PreferredPartID5]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts5] FOREIGN KEY 
	(
		[PreferredPartID6]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts6] FOREIGN KEY 
	(
		[PreferredPartID7]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts7] FOREIGN KEY 
	(
		[PreferredPartID8]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts8] FOREIGN KEY 
	(
		[PreferredPartID9]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_Parts9] FOREIGN KEY 
	(
		[PreferredPartID10]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] ADD 	CONSTRAINT [FK_ShipTypes_ShipTypes] FOREIGN KEY 
	(
		[SuccessorHullID]
	) REFERENCES [dbo].[ShipTypes] (
		[ShipTypeID]
	)
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_MaxRollRate] DEFAULT (50) FOR [MaxRollRate]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_MaxPitchRate] DEFAULT (50) FOR [MaxPitchRate]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_MaxYawRate] DEFAULT (50) FOR [MaxYawRate]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_DriftRoll] DEFAULT (50) FOR [DriftRoll]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_DriftPitch] DEFAULT (50) FOR [DriftPitch]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_DriftYaw] DEFAULT (50) FOR [DriftYaw]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_AccelSideMultiplier] DEFAULT (1) FOR [AccelSideMultiplier]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_AccelBackMultiplier] DEFAULT (1) FOR [AccelBackMultiplier]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_EnergyMax] DEFAULT (10) FOR [EnergyMax]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_RateRecharg] DEFAULT (1) FOR [RateRechargeEnergy]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_TechBitsRequired] DEFAULT (0) FOR [TechBitsRequired]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_TechBitsEffect] DEFAULT (0) FOR [TechBitsEffect]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_ShieldPartSize] DEFAULT (0) FOR [ShieldPartMask]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_AfterburnerPartSize] DEFAULT ((-1)) FOR [AfterburnerPartMask]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_CloakPartSize] DEFAULT (0) FOR [CloakPartMask]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_MagazinePartSize] DEFAULT (0) FOR [MagazinePartMask]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_DispenserPartSize] DEFAULT (0) FOR [DispenserPartMask]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_ChaffPartSize] DEFAULT (0) FOR [ChaffPartMask]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_MagazineCapacity] DEFAULT (0) FOR [MagazineCapacity]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_DispenserCapacity] DEFAULT (0) FOR [DispenserCapacity]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_ChaffCapacity] DEFAULT (0) FOR [ChaffCapacity]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_PilotHUD] DEFAULT ('dialog') FOR [PilotHUD]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_ObserverHUD] DEFAULT ('dialog') FOR [ObserverHUD]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_InteriorSound] DEFAULT (140) FOR [InteriorSound]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_ExteriorSound] DEFAULT (180) FOR [ExteriorSound]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_ThrustInteriorSound] DEFAULT (220) FOR [ThrustInteriorSound]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_ThrustExteriorSound] DEFAULT (260) FOR [ThrustExteriorSound]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_TurnInteriorSound] DEFAULT (300) FOR [TurnInteriorSound]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_TurnExteriorSound] DEFAULT (340) FOR [TurnExteriorSound]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_SecondsToBuild] DEFAULT (0) FOR [SecondsToBuild]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [DF_ShipTypes_GroupID] DEFAULT (0) FOR [GroupID]
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [PK_ShipStats] PRIMARY KEY  NONCLUSTERED 
	(
		[ShipTypeID]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[ShipTypes] WITH NOCHECK ADD 	CONSTRAINT [CK_ShipTypes] CHECK ([Length] > 0 and [Weight] > 0 and [Price] >= 0 and [BaseMaxSpeed] > 0 and [BaseHitPoints] > 0 and [BaseScannerRange] > 0 and [MaxRollRate] >= 0 and [MaxPitchRate] >= 0 and [DriftRoll] > 0 and [DriftPitch] > 0 and [DriftYaw] > 0 and [Acceleration] > 0 and [BaseSignature] >= 10 and [EnergyMax] >= 0 and [RateRechargeEnergy] >= 0 and [MaxAmmo] >= 0 and [MaxFuel] >= 0)
GO
CREATE Trigger ShipTypes_Trigger_InsUpd
On dbo.ShipTypes
For Insert, Update
As

If Update (TechBitsRequired) or Update (TechBitsEffect)
Begin
    declare @ok bit
    declare @techbitsR TechBits, @techbitsE TechBits
    select @ok = 0
    Declare curIns Cursor Local For
    	Select TechBitsRequired, TechBitsEffect From Inserted
    Open curIns

    Fetch Next From curIns Into @techbitsR, @techbitsE
    
    While @@FETCH_STATUS = 0
    Begin
    	Execute IsValidTechBits @techbitsR, @ok Output
    	If @ok=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsRequired', 18, 1) WITH NOWAIT
    	End
    	
    	Execute IsValidTechBits @techbitsE, @ok Output
    	If @ok=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsEffect', 18, 1) WITH NOWAIT
    	End
        Fetch Next From curIns Into @techbitsR, @techbitsE
    End

    Close curIns
End