CREATE TABLE [dbo].[Parts] (
	[PartID] [smallint] NOT NULL ,
	[Price] [int] NOT NULL ,
	[FileModel] char (12) NOT NULL ,
	[FileTexture] char (12) NOT NULL ,
	[Description] char (200) NOT NULL ,
	[Name] char (24) NOT NULL ,
	[PartTypeID] [tinyint] NOT NULL ,
	[LastUpdated] [smalldatetime] NULL ,
	[Mass] [smallint] NOT NULL ,
	[dSignatureMounted] [smallint] NOT NULL ,
	[dSignatureActive] [smallint] NOT NULL ,
	[TechBitsRequired] char (256) NOT NULL ,
	[TechBitsEffect] char (256) NOT NULL ,
	[ChanceTreasure] tinyint NOT NULL ,
	[PRIcon] char (12) NULL ,
	[PartMask] [smallint] NOT NULL ,
	[SuccessorPartID] [smallint] NULL ,
	[InventoryLineMDL] char (12) NOT NULL ,
	[SortOrder] int NULL ,
	[SecondsToBuild] [smallint] NOT NULL ,
	[GroupID] tinyint NULL 
) 
GO
ALTER TABLE [dbo].[Parts] ADD 
	CONSTRAINT [FK_Parts_Parts] FOREIGN KEY 
	(
		[SuccessorPartID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Parts] ADD 	CONSTRAINT [FK_Parts_PartTypes] FOREIGN KEY 
	(
		[PartTypeID]
	) REFERENCES [dbo].[PartTypes] (
		[PartTypeID]
	)
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_dSignatureMounted] DEFAULT (0) FOR [dSignatureMounted]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_dSignatureActive] DEFAULT (0) FOR [dSignatureActive]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_TechBitsRequired] DEFAULT (0) FOR [TechBitsRequired]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_TechBitsEffect] DEFAULT (0) FOR [TechBitsEffect]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_ChangeTreasure] DEFAULT (5) FOR [ChanceTreasure]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_PartSize] DEFAULT (0) FOR [PartMask]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_InventoryLineMDL] DEFAULT ('invdefault') FOR [InventoryLineMDL]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_SecondsToBuild] DEFAULT (0) FOR [SecondsToBuild]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [DF_Parts_GroupID] DEFAULT (0) FOR [GroupID]
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [PK_Parts] PRIMARY KEY  CLUSTERED 
	(
		[PartID]
	)   
GO
ALTER TABLE [dbo].[Parts] WITH NOCHECK ADD 	CONSTRAINT [CK_Parts] CHECK ([Price] >= 0 and [Mass] > 0)
GO
CREATE Trigger PartsLastUpdated
On dbo.Parts
For Insert, Update
As
    UPDATE Parts Set LastUpdated=GetDate()
    WHERE Parts.PartID IN (SELECT PartID FROM inserted)
GO
CREATE Trigger Parts_Trigger_InsUpd
On dbo.Parts
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