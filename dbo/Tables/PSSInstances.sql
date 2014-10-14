CREATE TABLE [dbo].[PSSInstances] (
	[AccessCode] char(32) NOT NULL ,
	[TrackingID] [char] (20) NOT NULL 
) 
GO
ALTER TABLE [dbo].[PSSInstances] WITH NOCHECK ADD 
	CONSTRAINT [PK_PSSInstances] PRIMARY KEY  CLUSTERED 
	(
		[AccessCode],
		[TrackingID]
	)  
GO
CREATE  INDEX [IX_PSSInstances_AccessCode] ON [dbo].[PSSInstances]([AccessCode]) 
GO
CREATE  INDEX [IX_PSSInstances_TrackingID] ON [dbo].[PSSInstances]([TrackingID]) 