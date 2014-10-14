CREATE TABLE [dbo].[ShipClasses] (
	[ShipClassID] [smallint] NOT NULL ,
	[ShipClassName] char (24) NOT NULL ,
	[ShipClassDescription] char (200) NULL 
) 
GO
ALTER TABLE [dbo].[ShipClasses] WITH NOCHECK ADD 
	CONSTRAINT [PK_ShipClasses] PRIMARY KEY  CLUSTERED 
	(
		[ShipClassID]
	)  