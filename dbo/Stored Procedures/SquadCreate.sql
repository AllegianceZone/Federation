CREATE Procedure SquadCreate

	(
		@SquadName			varchar(30),
		@Description		varchar(510),
		@URL				varchar(255),
		@OwnerID			int,
		@civID				smallint
--		@SquadID			int		     OUTPUT,
--		@ErrorCode			int		 	 OUTPUT,
--		@ErrorMsg			varchar(128) OUTPUT
	)

As

set nocount on

-- trim these down so we don't waste space
select @squadname = rtrim(@squadname)
select @Description = rtrim(@Description)
select @URL = rtrim(@URL) 

declare	@SquadID	int		     
declare	@ErrorCode	int		 	 
declare	@ErrorMsg	varchar(128)

-- Imago 10/14 exec profile.profile.dbo.p_create_team_profile_aleg @SquadName, @Description, @URL, @OwnerID, @SquadID output, @ErrorCode output, @ErrorMsg output
/*
-- This is a workaround until the p_create_team_profile_aleg returns a squadid properly
create table #temp2
(
  vc_team_name varchar(30),
  i_status int,
  i_team_id int,
  i_status2 int
)

insert #temp2
  -- Imago 10/14exec profile.profile.dbo.p_get_player_teams_aleg @OwnerID

select @squadID = i_team_id from #temp2 where vc_team_name = @SquadName
*/
	if @ErrorCode = 0
	begin
		delete from squads where SquadID = @SquadID or squadname = @squadname -- remove existing, if any
		insert Squads 
		-- TODO make more robust using pairing of Columns and Values 
		-- select @SquadID, @SquadName, 0, 0, 0, (select CharacterName from CharacterInfo where CharacterID = @OwnerID), @civID
		select @SquadID, @SquadName, 0, 0, 0, '', @civID, 0
		
		-- add new leader to ownership log 
    	declare @charname name
		select @charname = charactername from characterinfo where characterid = @ownerid
		if @charname is not null exec SquadAddNewLeaderToLog @SquadID, @charname
	end

select @SquadID, @ErrorCode, @ErrorMsg