CREATE Procedure SquadGetDudeXSquads
(
	@characterID int
)
As
set nocount on

create table #playerTeamsX
(
	vc_team_name varchar(30),
	i_status int,
	i_team_id int,
	i_secondary_status int
)

insert #playerTeamsX
	-- Imago 10/14 exec profile.profile.dbo.p_get_player_teams_aleg @characterID

select s.* from Squads s, #playerTeamsX p where s.squadID=p.i_team_ID

return