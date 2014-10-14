CREATE Procedure SquadDetailsPlayers

	(
		@SquadID int
	)

As

set nocount on

CREATE TABLE #members (
	[i_account_id] [int] NOT NULL ,
	[vc_member_id] [varchar] (30) NOT NULL ,
	[i_status] [int] NOT NULL ,
	[i_secondary_status] [int] NULL ,
	[dt_granted] [datetime] NOT NULL 
)

insert into #members
	-- Imago 10/14 exec profile.profile.dbo.p_get_team_members_aleg @SquadID

select m.i_account_id, m.vc_member_id, m.i_status, m.i_secondary_status, m.dt_granted, c.rank
	from #members m, charstats c 
	where c.characterid=m.i_account_id and c.civid is null

drop table #members
return