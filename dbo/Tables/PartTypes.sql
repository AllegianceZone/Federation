CREATE TABLE [dbo].[PartTypes] (
	[PartTypeID] [tinyint] NOT NULL ,
	[PartTypeName] [char] (16) NOT NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PartTypes] WITH NOCHECK ADD 
	CONSTRAINT [PK_PartTypes] PRIMARY KEY  NONCLUSTERED 
	(
		[PartTypeID]
	)  ON [PRIMARY]