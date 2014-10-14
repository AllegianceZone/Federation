CREATE TABLE [dbo].[Mines] (
	[ExpendableID] [smallint] NOT NULL ,
	[PlacementRadius] [real] NOT NULL ,
	[MunitionCount] [tinyint] NOT NULL ,
	[Power] [real] NOT NULL ,
	[DamageType] [tinyint] NOT NULL ,
	[FileTextureMunition] char (12) NOT NULL ,
	[percentRedMunition] tinyint NOT NULL ,
	[percentGreenMunition] tinyint NOT NULL ,
	[percentBlueMunition] tinyint NOT NULL ,
	[percentAlphaMunition] tinyint NOT NULL ,
	[PRIconMunition] char (12) NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Mines] ADD 
	CONSTRAINT [FK_Mines_Expendable] FOREIGN KEY 
	(
		[ExpendableID]
	) REFERENCES [dbo].[Expendables] (
		[ExpendableID]
	)
GO
ALTER TABLE [dbo].[Mines] WITH NOCHECK ADD 	CONSTRAINT [DF_Mines_DamageType] DEFAULT (0) FOR [DamageType]
GO
ALTER TABLE [dbo].[Mines] WITH NOCHECK ADD 	CONSTRAINT [PK_Mines] PRIMARY KEY  NONCLUSTERED 
	(
		[ExpendableID]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[Mines] WITH NOCHECK ADD 	CONSTRAINT [CK_Mines] CHECK ([MunitionCount] <= 50)