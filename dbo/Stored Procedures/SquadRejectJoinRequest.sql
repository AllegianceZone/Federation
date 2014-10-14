CREATE Procedure SquadRejectJoinRequest

	(
		@MemberID int,
		@SquadID int
	)

As
set nocount on 

declare @ErrorMsg as varchar(128)
declare @ErrorCode as int


-- Imago 10/14 exec profile.profile.dbo.p_deny_petitions_aleg @SquadID, @MemberID, @ErrorCode output, @ErrorMsg output

if @ErrorCode is null select 0
else select @ErrorCode

return