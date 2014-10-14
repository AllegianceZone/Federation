CREATE TABLE [dbo].[TreasureInstances] (
	[MapID] [smallint] NOT NULL ,
	[Lifespan] [real] NOT NULL ,
	[TreasureID] [smallint] NOT NULL ,
	[LocationX] [real] NOT NULL ,
	[LocationY] [real] NOT NULL ,
	[LocationZ] [real] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[Amount] [smallint] NOT NULL ,
	[TreasureCode] [smallint] NOT NULL 
) ON [PRIMARY]