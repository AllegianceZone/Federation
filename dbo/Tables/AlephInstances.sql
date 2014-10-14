CREATE TABLE [dbo].[AlephInstances] (
	[AlephID] [int] NOT NULL ,
	[MapID] [smallint] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[LocationX] [real] NOT NULL ,
	[LocationY] [real] NOT NULL ,
	[LocationZ] [real] NOT NULL ,
	[TargetAlephID] [int] NOT NULL ,
	[RotationR] [real] NOT NULL ,
	[ForwardX] [real] NOT NULL ,
	[ForwardY] [real] NULL ,
	[ForwardZ] [real] NULL ,
	[Radius] [smallint] NOT NULL ,
	[Signature] [real] NOT NULL ,
	[Texture] char (12) NOT NULL ,
	[PRIcon] char (12) NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlephInstances] ADD 
	CONSTRAINT [FK_AlephInstances_SectorInfo] FOREIGN KEY 
	(
		[MapID],
		[SectorID]
	) REFERENCES [dbo].[SectorInfo] (
		[MapID],
		[SectorID]
	)
GO
ALTER TABLE [dbo].[AlephInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_AlephInstances_RotationR] DEFAULT (1) FOR [RotationR]
GO
ALTER TABLE [dbo].[AlephInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_AlephInstances_Radius] DEFAULT (90) FOR [Radius]
GO
ALTER TABLE [dbo].[AlephInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_AlephInstances_Signature] DEFAULT (1.0) FOR [Signature]
GO
ALTER TABLE [dbo].[AlephInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_AlephInstances_Texture] DEFAULT ('plnt42') FOR [Texture]
GO
ALTER TABLE [dbo].[AlephInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_AlephInstances_PRIcon] DEFAULT ('aleph') FOR [PRIcon]
GO
ALTER TABLE [dbo].[AlephInstances] WITH NOCHECK ADD 	CONSTRAINT [PK_AlephInstances] PRIMARY KEY  NONCLUSTERED 
	(
		[AlephID],
		[MapID]
	)  ON [PRIMARY]
GO
CREATE  INDEX [IX_AlephInstances_SectorID] ON [dbo].[AlephInstances]([SectorID]) ON [PRIMARY]
GO
CREATE Trigger Aleph_InsUpd
On dbo.AlephInstances
For Insert, Update
As
    DECLARE @dupes integer

    SELECT @dupes=count(*) FROM Inserted WHERE
    		AlephID=TargetAlephID
    IF @dupes > 0
    BEGIN
    	RaisError('Do you really want an aleph to lead to itself? No? I didn''t think you would, so fix it.', 16, -1)
    	ROLLBACK TRANSACTION
    END