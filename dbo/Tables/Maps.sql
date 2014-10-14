CREATE TABLE [dbo].[Maps] (
	[MapID] [smallint] NOT NULL ,
	[MapName] char (24) NULL ,
	[FileName] char (12) NOT NULL ,
	[Description] char (200) NULL ,
	[IsTrainingOnly] [bit] NOT NULL ,
	[IsUserOption] [bit] NOT NULL ,
	[NumTeams] [tinyint] NOT NULL 
) 
GO
ALTER TABLE [dbo].[Maps] WITH NOCHECK ADD 	CONSTRAINT [DF_Maps_IsUserMap] DEFAULT (0) FOR [IsUserOption]
GO
ALTER TABLE [dbo].[Maps] WITH NOCHECK ADD 	CONSTRAINT [DF_Maps_NumTeams] DEFAULT (2) FOR [NumTeams]
GO
ALTER TABLE [dbo].[Maps] WITH NOCHECK ADD 	CONSTRAINT [PK_Maps] PRIMARY KEY  CLUSTERED 
	(
		[MapID]
	)  