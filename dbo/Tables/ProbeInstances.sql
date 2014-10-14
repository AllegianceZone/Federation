CREATE TABLE [dbo].[ProbeInstances] (
	[MapID] [smallint] NOT NULL ,
	[ProbeID] [smallint] NOT NULL ,
	[ProbeTypeID] [smallint] NOT NULL ,
	[SideID] [tinyint] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[LocationX] [real] NOT NULL ,
	[LocationY] [real] NOT NULL ,
	[LocationZ] [real] NOT NULL 
) ON [PRIMARY]