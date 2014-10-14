Create Procedure GetNearNamesOld
(
	@characterID int,   -- If they specify characterID=-1, then they want the top
	@civID smallint,    -- If they specify -1, then they meant NULL
	@charname char (24) = '' -- (only) if they specify a name, we need to look up the characterID (ignoring what was passed in)
)
As
set nocount on 

/*               +-----+
	This proc is | NOT | exactly the same as the other GetNear* procs, due to the fact 
	             +-----+
	that we're not sorting on a charstats columns. There are some subtle differences.
	
	We also supprt partial name matching here, which we do not in the others.
*/

declare @firstordinal int

-- Map -1 to NULL since passing NULL from ODBC is a pain
if @civID = -1
	select @civID = NULL

-- If they specify a name, then we need to look up the characterID
if @charname<>''
begin
	select @characterid=NULL
	-- find a close match
	select top 1 @characterid=characterid 
		from characterinfo 
		where charactername like RTRIM(@charname) + '%'
		order by CharacterName
	if @characterid is null
	begin
		begin
			-- Make sure we still create a result set of the expectant type
			select cs.* 
				from charstats cs inner join characterinfo ci on ci.characterid=cs.characterid
				where (0=1)
			return
		end
	end
end

-- If they specify characterID=-1, then they want the top
if @characterID=-1
begin
	select @firstordinal=1
	select top 56 @firstordinal as 'FirstOrdinal', ci.CharacterName, ci.CharacterID, cs.CivID, 
			cs.Rank, cs.Score, cs.MinutesPlayed, 
			cs.BaseKills, cs.BaseCaptures, cs.Kills, cs.Rating, cs.GamesPlayed, cs.Deaths, 
			cs.Wins, cs.Losses, cs.LastPlayed 
		from charstats cs right outer join characterinfo ci on cs.characterid=ci.characterid
			and (cs.civid=@civID or (@civID is null and cs.civid is null))
		order by ci.CharacterName
end
else
begin
	-- Map the id to a name if they didn't pass in a name
	if @charname=''
		select @charname=CharacterName from CharacterInfo where CharacterId=@characterID

	-- it's not quite the first ordinal yet, just count for now. Will patch up to be ordinal down below
	select @firstordinal=count(*) from CharacterInfo 
		where (CharacterName <= @charname) 

	select top 42 ci.CharacterName, ci.CharacterID, cs.CivID, cs.Rank, cs.Score, cs.MinutesPlayed, 
			cs.BaseKills, cs.BaseCaptures, cs.Kills, cs.Rating, cs.GamesPlayed, cs.Deaths, 
			cs.Wins, cs.Losses, cs.LastPlayed 
		into #higher 
		from charstats cs right outer join characterinfo ci on cs.characterid=ci.characterid
			and (cs.civid=@civID or (@civID is null and cs.civid is null))
		where (ci.CharacterName <= @charname) 
		order by ci.CharacterName desc
	
	select @firstordinal=@firstordinal - count(*) + 1 from #higher
	
	select top 42 ci.CharacterName, ci.CharacterID, cs.CivID, cs.Rank, cs.Score, cs.MinutesPlayed, 
			cs.BaseKills, cs.BaseCaptures, cs.Kills, cs.Rating, cs.GamesPlayed, cs.Deaths, 
			cs.Wins, cs.Losses, cs.LastPlayed 
		into #lower
		from charstats cs right outer join characterinfo ci on cs.characterid=ci.characterid
			and (cs.civid=@civID or (@civID is null and cs.civid is null))
		where (ci.CharacterName > @charname) 
		order by ci.CharacterName

	select @firstordinal as 'FirstOrdinal', o.* from 
	(
		select * from #higher
		union all
		select* from #lower
	) AS o 
	order by CharacterName

	drop table #higher
	drop table #lower
end