CREATE TABLE [dbo].[StationClasses] (
	[StationClassID] [smallint] NOT NULL ,
	[StationClassName] char (24) NOT NULL ,
	[StationClassDescription] char (200) NULL 
) 
GO
ALTER TABLE [dbo].[StationClasses] WITH NOCHECK ADD 
	CONSTRAINT [PK_StationClasses] PRIMARY KEY  CLUSTERED 
	(
		[StationClassID]
	)  