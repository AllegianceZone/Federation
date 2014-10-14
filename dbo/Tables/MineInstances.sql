﻿CREATE TABLE [dbo].[MineInstances] (
	[MapID] [smallint] NOT NULL ,
	[MineID] [smallint] NOT NULL ,
	[MineTypeID] [smallint] NOT NULL ,
	[SideID] [tinyint] NOT NULL ,
	[SectorID] smallint NOT NULL ,
	[LocationX] [real] NOT NULL ,
	[LocationY] [real] NOT NULL ,
	[LocationZ] [real] NOT NULL 
) ON [PRIMARY]