CREATE TABLE [dbo].[Drones] (
	[DroneID] [smallint] NOT NULL ,
	[Name] [char] (16) NOT NULL ,
	[Description] char (200) NOT NULL ,
	[Price] [int] NOT NULL ,
	[ShipTypeID] smallint NOT NULL ,
	[TechBitsRequired] char (256) NOT NULL ,
	[TechBitsEffect] char (256) NOT NULL ,
	[SecondsToBuild] [smallint] NOT NULL ,
	[DroneType] [int] NOT NULL ,
	[GroupID] tinyint NULL ,
	[SortOrder] int NULL ,
	[ExpendableID] [smallint] NULL 
) 
GO
ALTER TABLE [dbo].[Drones] WITH NOCHECK ADD 	CONSTRAINT [DF_Drones_TechBitsRequired] DEFAULT (0) FOR [TechBitsRequired]
GO
ALTER TABLE [dbo].[Drones] WITH NOCHECK ADD 	CONSTRAINT [DF_Drones_TechBitsEffect] DEFAULT (0) FOR [TechBitsEffect]
GO
ALTER TABLE [dbo].[Drones] WITH NOCHECK ADD 	CONSTRAINT [DF_Drones_SecondsToBuild] DEFAULT (30) FOR [SecondsToBuild]
GO
ALTER TABLE [dbo].[Drones] WITH NOCHECK ADD 	CONSTRAINT [DF_Drones_GroupID] DEFAULT (0) FOR [GroupID]
GO
ALTER TABLE [dbo].[Drones] WITH NOCHECK ADD 	CONSTRAINT [PK_Drones] PRIMARY KEY  CLUSTERED 
	(
		[DroneID]
	)   
GO
ALTER TABLE [dbo].[Drones] WITH NOCHECK ADD 	CONSTRAINT [CK_Drones] CHECK ([Price] > 0 or [DroneType] = 6)
GO
Create Trigger Drones_Trigger_InsUpd
On dbo.Drones
For Insert, Update
As
If Update (TechBitsRequired) or  Update (TechBitsEffect)
Begin
    declare @okR bit, @okE bit
    declare @techbitsR char (256), @techbitsE char (256)
    select @okR = 0
    select @okE = 0
    /* need to see if ANY modified row has bogus techbits */
    Declare curIns Cursor Local For
    	Select TechBitsRequired, TechBitsEffect From Inserted
    Open curIns

    Fetch Next From curIns Into @techbitsR, @techbitsE
    
    While @@FETCH_STATUS = 0
    Begin
    	Execute IsValidTechBits @techbitsR, @okR Output
    	If @okR=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsRequired', 18, 1) WITH NOWAIT
    	End
    	Execute IsValidTechBits @techbitsE, @okE Output
    	If @okE = 0 
    	Begin
    	Rollback Transaction
    		RaisError ('Invalid tech in TechBitsEffect', 18, 1) WITH NOWAIT
    	End
        Fetch Next From curIns Into @techbitsR, @techbitsE
    End

    Close curIns
End