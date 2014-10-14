CREATE TABLE [dbo].[Expendables] (
	[ExpendableID] [smallint] NOT NULL ,
	[Price] [int] NOT NULL ,
	[FileModel] char (12) NOT NULL ,
	[Name] char (24) NOT NULL ,
	[Description] char (200) NOT NULL ,
	[TechBitsRequired] char (256) NOT NULL ,
	[TechBitsEffect] char (256) NOT NULL ,
	[SignatureShip] [real] NOT NULL ,
	[Mass] [real] NOT NULL ,
	[LoadTime] [real] NOT NULL ,
	[LifeSpan] [real] NOT NULL ,
	[SignatureInstance] [real] NOT NULL ,
	[HitPoints] smallint NOT NULL ,
	[FileModelInstance] char (12) NOT NULL ,
	[FileTextureInstance] char (12) NOT NULL ,
	[Radius] [real] NOT NULL ,
	[RateRotation] [real] NOT NULL ,
	[percentRed] tinyint NOT NULL ,
	[percentGreen] tinyint NOT NULL ,
	[percentBlue] tinyint NOT NULL ,
	[percentAlpha] tinyint NOT NULL ,
	[PRIcon] char (12) NULL ,
	[PRIconInstance] char (12) NULL ,
	[PartMask] [smallint] NOT NULL ,
	[DefenseType] [tinyint] NOT NULL ,
	[SecondsToBuild] [smallint] NOT NULL ,
	[GroupID] tinyint NULL ,
	[ExpendableSize] [smallint] NOT NULL ,
	[Capabilities] [smallint] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD CONSTRAINT [DF_Expendables_TechBitsRequired] DEFAULT ('') FOR [TechBitsRequired]
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD 	CONSTRAINT [DF_Expendables_TechBitsEffect] DEFAULT ('') FOR [TechBitsEffect]
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD 	CONSTRAINT [DF_Expendable_ShipSignatureMod] DEFAULT (1) FOR [SignatureShip]
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD 	CONSTRAINT [DF_Expendables_PartSize] DEFAULT (0) FOR [PartMask]
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD 	CONSTRAINT [DF_Expendables_SecondsToBuild] DEFAULT (0) FOR [SecondsToBuild]
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD 	CONSTRAINT [DF_Expendables_GroupID] DEFAULT (0) FOR [GroupID]
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD 	CONSTRAINT [PK_Expendable] PRIMARY KEY  NONCLUSTERED 
	(
		[ExpendableID]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[Expendables] WITH NOCHECK ADD 	CONSTRAINT [CK_Expendables] CHECK ([Price] >= 0 and [Mass] > 0 and [Radius] > 0 and [LoadTime] >= 0 and [LifeSpan] >= 0 and [HitPoints] > 0)
GO
CREATE Trigger Expendables_Trigger_InsUpd
On dbo.Expendables
For Insert, Update
As
If Update (TechBitsRequired) or  Update (TechBitsEffect)
Begin
    declare @ok bit
    declare @techbitsR TechBits, @techbitsE TechBits
    select @ok = 0
    /* need to see if ANY modified row has bogus techbits */
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