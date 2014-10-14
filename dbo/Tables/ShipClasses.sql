CREATE TABLE [dbo].[ShipClasses] (
	[ShipClassID] [smallint] NOT NULL ,
	[ShipClassName] char (24) NOT NULL ,
	[ShipClassDescription] char (200) NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShipClasses] WITH NOCHECK ADD 
	CONSTRAINT [PK_ShipClasses] PRIMARY KEY  NONCLUSTERED 
	(
		[ShipClassID]
	)  ON [PRIMARY]