CREATE Procedure SquadDetails

	(
		@SquadID int
	)

As

set nocount on

-- todo include rank and civid

create table #temp
(
	vc_team_id			 varchar(30),
	vc_member_id		 varchar(30),
	vc_description		 varchar(510),
	vc_favorite_game1	 varchar(4), 
	vc_favorite_game2	 varchar(4),  
	vc_favorite_game3	 varchar(4),  
	vc_favorite_game4	 varchar(4),  
	vc_favorite_game5	 varchar(4),  
	vc_favorite_link	 varchar(255),
	b_closed			 bit,
	b_award				 bit,
	i_team_id			 int,  
	vc_edit_restrictions varchar(8),
	dt_created		     datetime
)

insert #temp
  -- Imaog 10/14 exec profile.profile.dbo.p_get_team_profile_aleg @SquadID

select #temp.*, s.civid/*, s.rank*/ from #temp, Squads s where s.SquadID = @SquadID 

declare @c_rows as int
select @c_rows = count(*) from #temp
if @c_rows = 0 delete from squads where squadid = @squadID

return