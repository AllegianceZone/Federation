CREATE TABLE [dbo].[StationInstances] (
	[MapID] [smallint] NOT NULL ,
	[StationID] [smallint] NOT NULL ,
	[Name] char (24) NOT NULL ,
	[SideID] [tinyint] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[LocationX] [real] NOT NULL ,
	[LocationY] [real] NOT NULL ,
	[LocationZ] [real] NOT NULL ,
	[RotationAx] [real] NOT NULL ,
	[RotationAy] [real] NOT NULL ,
	[RotationAz] [real] NOT NULL ,
	[RotationR] [real] NOT NULL ,
	[ForwardX] [real] NOT NULL ,
	[ForwardY] [real] NOT NULL ,
	[ForwardZ] [real] NOT NULL ,
	[UpX] [real] NOT NULL ,
	[UpY] [real] NOT NULL ,
	[UpZ] [real] NOT NULL ,
	[StationTypeID] [smallint] NOT NULL 
) 
GO
ALTER TABLE [dbo].[StationInstances] ADD 
	CONSTRAINT [FK_StationInstances_SectorInfo] FOREIGN KEY 
	(
		[MapID],
		[SectorID]
	) REFERENCES [dbo].[SectorInfo] (
		[MapID],
		[SectorID]
	)
GO
ALTER TABLE [dbo].[StationInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_StationInstances_RotationAx] DEFAULT (0) FOR [RotationAx]
GO
ALTER TABLE [dbo].[StationInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_StationInstances_RotationAy] DEFAULT (1) FOR [RotationAy]
GO
ALTER TABLE [dbo].[StationInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_StationInstances_RotationAz] DEFAULT (0) FOR [RotationAz]
GO
ALTER TABLE [dbo].[StationInstances] WITH NOCHECK ADD 	CONSTRAINT [DF_StationInstances_RotationR] DEFAULT (0) FOR [RotationR]
GO
ALTER TABLE [dbo].[StationInstances] WITH NOCHECK ADD 	CONSTRAINT [PK_StationInstances] PRIMARY KEY  CLUSTERED 
	(
		[MapID],
		[StationID]
	)  
GO
CREATE  INDEX [IX_StationInstances] ON [dbo].[StationInstances]([SectorID]) 
GO
Create Trigger StationInstances_Trigger_InsUpd
On dbo.StationInstances
For Insert, Update
As
        DECLARE @zerocount integer, @coincidentcount integer
        SELECT @zerocount=count(*) FROM Inserted WHERE
                        (UpX=0 AND UpY=0 AND UpZ=0) OR
                        (ForwardX=0 AND ForwardY=0 AND ForwardZ=0)
        SELECT @coincidentcount=count(*) FROM Inserted WHERE
                        (UpX=ForwardX) AND
                        (UpY=ForwardY) AND
                        (UpZ=ForwardZ)
        IF @zerocount > 0
        BEGIN
                RaisError('Cannot have zero length orientation vectors', 16, -1)
                ROLLBACK TRANSACTION
        END
        IF @coincidentcount > 0
        BEGIN
                RaisError('Cannot have coincident Forward and Up orientation vectors', 16, -1)
                ROLLBACK TRANSACTION
        END