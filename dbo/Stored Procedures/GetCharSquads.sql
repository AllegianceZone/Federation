CREATE Procedure GetCharSquads
(
	@characterID int
)
As
set nocount on 

create table #playerTeams
(
	vc_team_name varchar(30),
	i_status int,
	i_team_id int,
	i_secondary_status int
)	

insert into #playerTeams
	-- Imago 10/14 exec profile.profile.dbo.p_get_player_teams_aleg @characterID

select rtrim(s.SquadName), i_status, i_team_id, i_secondary_status 
	from #playerTeams p, Squads s where s.squadID = p.i_team_id