CREATE Procedure SquadDemoteToMember

	(
		@MemberID int,
		@SquadID int
	)

As
set nocount on 

declare @ErrorMsg as varchar(128)
declare @ErrorCode as int

-- Imago 10/14 exec profile.profile.dbo.p_edit_team_member_status2_aleg @SquadID, @MemberID, 0, @ErrorCode output, @ErrorMsg output

select @ErrorCode

return