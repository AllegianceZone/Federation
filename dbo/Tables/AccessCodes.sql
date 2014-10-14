CREATE TABLE [dbo].[AccessCodes] (
	[AccessCode] char(32) NOT NULL ,
	[Status] [smallint] NOT NULL ,
	[CodeReassignedFrom] char(32) NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessCodes] WITH NOCHECK ADD 	CONSTRAINT [DF_AccessCodes_Status] DEFAULT (0) FOR [Status]
GO
ALTER TABLE [dbo].[AccessCodes] WITH NOCHECK ADD 		CONSTRAINT [PK_AccessCodes] PRIMARY KEY  NONCLUSTERED 
	(
		[AccessCode]
	)  ON [PRIMARY]
GO
CREATE  INDEX [IX_AccessCodes_ReassignedFrom] ON [dbo].[AccessCodes]([CodeReassignedFrom]) ON [PRIMARY]
GO