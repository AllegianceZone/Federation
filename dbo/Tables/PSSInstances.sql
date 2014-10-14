CREATE TABLE [dbo].[PSSInstances] (
	[AccessCode] char(32) NOT NULL ,
	[TrackingID] [char] (20) NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PSSInstances] WITH NOCHECK ADD 
	CONSTRAINT [PK_PSSInstances] PRIMARY KEY  NONCLUSTERED 
	(
		[AccessCode],
		[TrackingID]
	)  ON [PRIMARY]
GO
CREATE  INDEX [IX_PSSInstances_AccessCode] ON [dbo].[PSSInstances]([AccessCode]) ON [PRIMARY]
GO
CREATE  INDEX [IX_PSSInstances_TrackingID] ON [dbo].[PSSInstances]([TrackingID]) ON [PRIMARY]