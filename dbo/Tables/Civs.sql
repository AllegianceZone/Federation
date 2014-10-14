CREATE TABLE [dbo].[Civs] (
	[CivID] [smallint] NOT NULL ,
	[Name] char (24) NOT NULL ,
	[Description] char (200) NOT NULL ,
	[EscapePodShipTypeID] smallint NOT NULL ,
	[TechBitsCiv] [char] (800) NOT NULL ,
	[StartingGlobalAttributeID] [smallint] NULL ,
	[InitialStationTypeID] [smallint] NOT NULL ,
	[IconName] char (12) NOT NULL ,
	[StationHUD] char (12) NOT NULL ,
	[PreferredPartID15] [smallint] NULL ,
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
	[TechBitsCivNoDev] [char] (800) NOT NULL ,
	[BonusMoney] [real] NOT NULL ,
	[IncomeMoney] [real] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Civs] ADD 
	CONSTRAINT [FK_Civs_Parts] FOREIGN KEY 
	(
		[PreferredPartID1]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts1] FOREIGN KEY 
	(
		[PreferredPartID2]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts10] FOREIGN KEY 
	(
		[PreferredPartID11]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts11] FOREIGN KEY 
	(
		[PreferredPartID12]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts12] FOREIGN KEY 
	(
		[PreferredPartID13]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts13] FOREIGN KEY 
	(
		[PreferredPartID14]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts14] FOREIGN KEY 
	(
		[PreferredPartID15]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts2] FOREIGN KEY 
	(
		[PreferredPartID3]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts3] FOREIGN KEY 
	(
		[PreferredPartID4]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts4] FOREIGN KEY 
	(
		[PreferredPartID5]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts5] FOREIGN KEY 
	(
		[PreferredPartID6]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts6] FOREIGN KEY 
	(
		[PreferredPartID7]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts7] FOREIGN KEY 
	(
		[PreferredPartID8]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts8] FOREIGN KEY 
	(
		[PreferredPartID9]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] ADD 	CONSTRAINT [FK_Civs_Parts9] FOREIGN KEY 
	(
		[PreferredPartID10]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Civs] WITH NOCHECK ADD 	CONSTRAINT [DF_Civs_TechBitsCiv] DEFAULT (0) FOR [TechBitsCiv]
GO
ALTER TABLE [dbo].[Civs] WITH NOCHECK ADD 	CONSTRAINT [DF_Civs_StationHUD] DEFAULT ('dialog') FOR [StationHUD]
GO
ALTER TABLE [dbo].[Civs] WITH NOCHECK ADD 	CONSTRAINT [DF_Civs_TechBitsCivNoDev] DEFAULT (0) FOR [TechBitsCivNoDev]
GO
ALTER TABLE [dbo].[Civs] WITH NOCHECK ADD 	CONSTRAINT [DF_Civs_BonusMoney] DEFAULT (0.0) FOR [BonusMoney]
GO
ALTER TABLE [dbo].[Civs] WITH NOCHECK ADD 	CONSTRAINT [DF_Civs_IncomeMoney] DEFAULT (0.0) FOR [IncomeMoney]
GO
ALTER TABLE [dbo].[Civs] WITH NOCHECK ADD 	CONSTRAINT [PK_Civs] PRIMARY KEY  NONCLUSTERED 
	(
		[CivID]
	)  ON [PRIMARY]
GO
CREATE Trigger Civs_Trigger_InsUpd
On dbo.Civs
For Insert, Update
As
If Update (TechBitsCiv)
Begin
    declare @ok bit
    declare @techbits char(800)
    select @ok = 0
    /* need to see if ANY modified row has bogus techbits */
    Declare curIns Cursor Local For
    	Select TechBitsCiv From Inserted
    Open curIns

    Fetch Next From curIns Into @techbits
    
    While @@FETCH_STATUS = 0
    Begin
    	Execute IsValidTechBits @techbits, @ok Output
    	If @ok=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsCiv', 18, 1) WITH NOWAIT
    	End
        Fetch Next From curIns Into @techbits
    End

    Close curIns
End
If Update (TechBitsCivNoDev)
Begin
    declare @okNoDev bit
    declare @techbitsNoDev char(800)
    select @okNoDev = 0
    /* need to see if ANY modified row has bogus techbits */
    Declare curIns Cursor Local For
    	Select TechBitsCivNoDev From Inserted
    Open curIns

    Fetch Next From curIns Into @techbitsNoDev
    
    While @@FETCH_STATUS = 0
    Begin
    	Execute IsValidTechBits @techbitsNoDev, @okNoDev Output
    	If @okNoDev=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsCivNoDev', 18, 1) WITH NOWAIT
    	End
        Fetch Next From curIns Into @techbitsNoDev
    End

    Close curIns
End