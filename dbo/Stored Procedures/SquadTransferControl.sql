CREATE Procedure SquadTransferControl

	(
		@NewOwnerID int,
		@SquadID int
	)

As
set nocount on 

declare @ErrorMsg as varchar(128)
declare @ErrorCode as int

-- Imago 10/14 exec profile.profile.dbo.p_change_team_ownership_aleg @SquadID, @NewOwnerID, @ErrorCode output, @ErrorMsg output

-- add new leader to ownership log 
if @errorcode = 0
begin
	declare @charname char (24)
	select @charname = charactername from characterinfo where characterid = @newownerid
	if @charname is not null exec SquadAddNewLeaderToLog @SquadID, @charname
end 

select @ErrorCode 

return