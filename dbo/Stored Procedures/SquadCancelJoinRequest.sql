CREATE Procedure SquadCancelJoinRequest

	(
		@MemberID int,
		@SquadID int
	)

As
set nocount on 

declare @ErrorMsg as varchar(128)
declare @ErrorCode as int
declare @status as int
declare @newowner as varchar(30)

-- Imago 10/14 exec profile.profile.dbo.p_withdraw_team_aleg @SquadID, @MemberID, @status output, @newowner output, @ErrorCode output, @ErrorMsg output

-- this shouldn't ever happen, but let's be safe
if @status = -1 delete from squads where squadid = @squadid
else if @newowner is not null exec SquadAddNewLeaderToLog @SquadID, @newowner

if @ErrorCode is null select 0
else select @ErrorCode

return