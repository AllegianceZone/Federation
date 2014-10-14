CREATE TABLE [dbo].[InvitationLists] (
	[ListID] [int] NOT NULL primary key clustered,
	[TeamIndex] [tinyint] NOT NULL ,
	[SubjectName] char (24) NOT NULL 
) 