CREATE TABLE [dbo].[Developments] (
	[Price] [int] NOT NULL ,
	[LoadoutBitmap] char (12) NOT NULL ,
	[Name] char (24) NOT NULL ,
	[Description] char (200) NOT NULL ,
	[TechBitsRequired] char (256) NOT NULL ,
	[TechBitsEffect] char (256) NOT NULL ,
	[DevelopmentID] [smallint] NOT NULL ,
	[SecondsToBuild] [smallint] NOT NULL ,
	[GlobalAttributeID] [smallint] NULL ,
	[PRIcon] [char] (12) NULL ,
	[GroupID] tinyint NULL ,
	[SortOrder] int NULL ,
	[CompletedSound] smallint NOT NULL 
) 
GO
ALTER TABLE [dbo].[Developments] ADD 
	CONSTRAINT [FK_Developments_GlobalAttributes] FOREIGN KEY 
	(
		[GlobalAttributeID]
	) REFERENCES [dbo].[GlobalAttributes] (
		[GlobalAttributeID]
	)
GO
ALTER TABLE [dbo].[Developments] WITH NOCHECK ADD 	CONSTRAINT [DF_Developments_Price] DEFAULT (1000) FOR [Price]
GO
ALTER TABLE [dbo].[Developments] WITH NOCHECK ADD 	CONSTRAINT [DF_Development_TechBitsReq] DEFAULT (0) FOR [TechBitsRequired]
GO
ALTER TABLE [dbo].[Developments] WITH NOCHECK ADD 	CONSTRAINT [DF_Developments_TechBitsEffect] DEFAULT (0) FOR [TechBitsEffect]
GO
ALTER TABLE [dbo].[Developments] WITH NOCHECK ADD 	CONSTRAINT [DF_Developments_SecondsToBuild] DEFAULT (30) FOR [SecondsToBuild]
GO
ALTER TABLE [dbo].[Developments] WITH NOCHECK ADD 	CONSTRAINT [DF_Developments_GroupID] DEFAULT (1) FOR [GroupID]
GO
ALTER TABLE [dbo].[Developments] WITH NOCHECK ADD 	CONSTRAINT [PK_Developments] PRIMARY KEY  CLUSTERED 
	(
		[DevelopmentID]
	)   
GO
ALTER TABLE [dbo].[Developments] WITH NOCHECK ADD	CONSTRAINT [CK_Developments] CHECK ([Price] > 0)
GO
Create Trigger Developments_Trigger_InsUpd
On dbo.Developments
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
    	If @okE=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsEffect', 18, 1) WITH NOWAIT
    	End
        Fetch Next From curIns Into @techbitsR, @techbitsE
    End

    Close curIns
End