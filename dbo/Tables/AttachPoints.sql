CREATE TABLE [dbo].[AttachPoints] (
	[ShipTypeID] smallint NOT NULL ,
	[AttachPointID] [smallint] NOT NULL ,
	[FrameName] char (12) NOT NULL ,
	[PartTypeID] [tinyint] NOT NULL ,
	[FieldOfFire] [smallint] NOT NULL ,
	[PartMask] [smallint] NOT NULL ,
	[GunnerHUD] char (12) NOT NULL ,
	[InteriorSound] smallint NOT NULL ,
	[TurnSound] smallint NOT NULL ,
	[LocationAbreviation] [char] (8) NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttachPoints] ADD 
	CONSTRAINT [FK_AttachPoints_ShipTypes] FOREIGN KEY 
	(
		[ShipTypeID]
	) REFERENCES [dbo].[ShipTypes] (
		[ShipTypeID]
	)
GO
ALTER TABLE [dbo].[AttachPoints] WITH NOCHECK ADD 	CONSTRAINT [DF_AttachPoints_FieldOfFire] DEFAULT (120) FOR [FieldOfFire]
GO
ALTER TABLE [dbo].[AttachPoints] WITH NOCHECK ADD 	CONSTRAINT [DF_AttachPoints_PartSize] DEFAULT (0) FOR [PartMask]
GO
ALTER TABLE [dbo].[AttachPoints] WITH NOCHECK ADD 	CONSTRAINT [DF_AttachPoints_GunnerHUD] DEFAULT ('dialog') FOR [GunnerHUD]
GO
ALTER TABLE [dbo].[AttachPoints] WITH NOCHECK ADD 	CONSTRAINT [DF_AttachPoints_InteriorSound] DEFAULT (140) FOR [InteriorSound]
GO
ALTER TABLE [dbo].[AttachPoints] WITH NOCHECK ADD 	CONSTRAINT [DF_AttachPoints_TurnSound] DEFAULT (121) FOR [TurnSound]
GO
ALTER TABLE [dbo].[AttachPoints] WITH NOCHECK ADD 	CONSTRAINT [DF_AttachPoints_LocationAbreviation] DEFAULT (' ') FOR [LocationAbreviation]
GO
ALTER TABLE [dbo].[AttachPoints] WITH NOCHECK ADD 	CONSTRAINT [PK_AttachPoints] PRIMARY KEY  NONCLUSTERED 
	(
		[ShipTypeID],
		[AttachPointID]
	)  ON [PRIMARY]
GO
CREATE Trigger AttachPoints_Trigger_InsUpd
On dbo.AttachPoints
For Insert, Update
As
If Update (ShipTypeID)
Begin
    /* Let's just be lazy and create a cursor over the Inserted table, and 
    	rather just check the whole regular table, since it won't be that big.
    	Only trick will be that if bad data DOES get in, then ANY change 
    	(involving a shiptypeid) will cause the transaction to be rejected.s
    */
    If exists (Select * from attachpoints group by shiptypeid, parttypeid having COUNT(*) > 4)
    Begin
    	Rollback Transaction
    	RaisError ('Each ship can have no more than 4 attach points per part type', 18, 1) WITH NOWAIT
    End
End