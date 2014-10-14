CREATE TABLE [dbo].[CharacterInfo] (
	[CharacterID] [int] NOT NULL ,
	[CharacterName] char (24) NOT NULL ,
	[Description] char (200) NOT NULL ,
	[CreationDate] [datetime] NOT NULL ,
	[CanCheat] [bit] NOT NULL ,
	[ICQID] [int] NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CharacterInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_CharacterInfo_Description] DEFAULT ('') FOR [Description]
GO
ALTER TABLE [dbo].[CharacterInfo] WITH NOCHECK ADD 	CONSTRAINT [DF__character__creat__0F8D3381] DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CharacterInfo] WITH NOCHECK ADD 	CONSTRAINT [DF_CharacterInfo_CanCheat] DEFAULT (0) FOR [CanCheat]
GO
ALTER TABLE [dbo].[CharacterInfo] WITH NOCHECK ADD 	CONSTRAINT [PK_CharacterInfo] PRIMARY KEY  NONCLUSTERED 
	(
		[CharacterID]
	)  ON [PRIMARY]
GO
CREATE  UNIQUE  INDEX [IX_CharacterName] ON [dbo].[CharacterInfo]([CharacterName]) ON [PRIMARY]