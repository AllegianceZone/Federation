Create Procedure SyncZoneSquads
As
set nocount on
Declare cur Cursor Local For
    Select characterID From CharacterInfo
Open cur

create table #playerTeams
(
	vc_team_name varchar(30),
	i_status int,
	i_team_id int,
	i_secondary_status int
)	

Declare curTeam Cursor Local For
    select i_team_id, vc_team_name from #playerTeams

declare @characterID int
declare @vc_team_name varchar(30)
declare @i_status int
declare @i_team_id int
declare @i_secondary_status int

Fetch Next From cur Into @characterID

While @@FETCH_STATUS = 0
Begin

	-- insert into #playerTeams
		-- Imago 10/14 exec profile.profile.dbo.p_get_player_teams_aleg @characterID
	
	Open curTeam

	declare @teamID int
	declare @squadName varchar(30)
	Fetch Next From curTeam Into @i_team_id, @vc_team_name
	
	While @@FETCH_STATUS = 0
	Begin
		if not exists (select * from Squads where SquadID=@i_team_id)
				insert into squads (squadid, squadname) 
					values (@i_team_id, @vc_team_name) 
			Fetch Next From curTeam Into @i_team_id, @vc_team_name
	End
	
	Close curTeam
	delete from #playerTeams
	Fetch Next From cur Into @characterID
End

Close cur
return