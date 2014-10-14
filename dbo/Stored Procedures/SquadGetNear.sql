CREATE Procedure SquadGetNear

	(
		@SortColumn     int = 1,  -- 1 is score, 2 is name, etc. defined Squad.h
		@SquadID        int = -1, -- used for positioning; -1 means top
		@CharacterID    int = -1  -- used for DudeX; -1 means any/all characters
	)

As

set nocount on 

 --  TODO convert ifs into switch/case if SQL has such a thing
 if @SortColumn = 1 exec SquadGetNearNames @SquadID 
 else if @SortColumn = 2 exec SquadGetNearScore @SquadID
 else if @SortColumn = 3 exec SquadGetNearWins @SquadID
 else if @SortColumn = 4 exec SquadGetNearLosses @SquadID
-- TODO else if @SortColumn = 5 exec SquadGetNearHours @SquadID