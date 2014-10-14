CREATE TABLE [dbo].[AccessCodeUsage] (
	[AccessCode] char(32) NOT NULL ,
	[ZoneName] char (24) NOT NULL ,
	[FirstUsage] [smalldatetime] NOT NULL ,
	[LastUsage] [smalldatetime] NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessCodeUsage] WITH NOCHECK ADD 	CONSTRAINT [DF_AccessCodeUsage_FirstUsage] DEFAULT (getdate()) FOR [FirstUsage]
GO
ALTER TABLE [dbo].[AccessCodeUsage] WITH NOCHECK ADD 	CONSTRAINT [DF_AccessCodeUsage_LastUsage] DEFAULT (getdate()) FOR [LastUsage]
GO
ALTER TABLE [dbo].[AccessCodeUsage] WITH NOCHECK ADD 	CONSTRAINT [PK_AccessCodeUsage] PRIMARY KEY  NONCLUSTERED 
	(
		[AccessCode],
		[ZoneName]
	)  ON [PRIMARY]
GO
CREATE  INDEX [IX_AccessCodeUsage_ZoneName] ON [dbo].[AccessCodeUsage]([ZoneName]) ON [PRIMARY]
GO