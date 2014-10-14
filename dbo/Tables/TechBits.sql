﻿CREATE TABLE [dbo].[TechBits] (
	[BitID] [int] NOT NULL ,
	[BitShortName] [char] (35) NOT NULL ,
	[BitLongName] [char] (48) NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TechBits] WITH NOCHECK ADD 	CONSTRAINT [PK_TechBits] PRIMARY KEY  NONCLUSTERED 
	(
		[BitShortName]
	)  ON [PRIMARY] 
GO
ALTER TABLE [dbo].[TechBits] WITH NOCHECK ADD 	CONSTRAINT [IX_TechBits_ID] UNIQUE  NONCLUSTERED 
	(
		[BitID]
	)  ON [PRIMARY]