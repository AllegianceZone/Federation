CREATE TABLE [dbo].[Ammo] (
	[PartID] [smallint] NOT NULL ,
	[Qty] [smallint] NOT NULL ,
	[AmmoType] [tinyint] NOT NULL 
) 
GO
ALTER TABLE [dbo].[Ammo] ADD 
	CONSTRAINT [FK_Ammo_Parts] FOREIGN KEY 
	(
		[PartID]
	) REFERENCES [dbo].[Parts] (
		[PartID]
	)
GO
ALTER TABLE [dbo].[Ammo] WITH NOCHECK ADD 	CONSTRAINT [DF_Ammo_AmmoType] DEFAULT (0) FOR [AmmoType]
GO
ALTER TABLE [dbo].[Ammo] WITH NOCHECK ADD 	CONSTRAINT [PK_Ammo] PRIMARY KEY  CLUSTERED 
	(
		[PartID]
	)  