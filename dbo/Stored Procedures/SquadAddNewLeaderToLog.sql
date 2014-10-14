CREATE Procedure SquadAddNewLeaderToLog

	(
		@squadid int,
		@leadername char (24)
	)

As
set nocount on

update squads 
  set ownershiplog=convert(char(8), GetDate(), 1) + ';' + rtrim(@leadername) + ';' + cast(ownershiplog as varchar(465)) where squadid = @squadid
	
return