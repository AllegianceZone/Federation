CREATE Procedure GetNearNames
(
	@characterID int,   -- If they specify characterID=-1, then they want the top
	@civID smallint,    -- If they specify -1, then they meant NULL
	@CharacterName char (24) = '' -- (only) if they specify a name, we need to look up the characterID (ignoring what was passed in)
)
As
set nocount on 

/*
	All the GetNear* functions are exactly the same, except for the sort column, and the type of the sort column.
	
	Any changes made to one needs to be made to all the others. I typically just modify one, then cut & paste
	the whole thing to all others, then use search & replace on the single 
*/

declare @firstordinal int

-- Map -1 to NULL since passing NULL from ODBC is a pain
if @civID = -1
	select @civID = NULL

-- If they specify a name, then we need to look up the characterID
if @CharacterName<>''
begin
	select @characterid=NULL
	select top 1 @characterid=characterid from characterinfo 
		where charactername like RTRIM(@CharacterName) + '%' order by charactername
	if @characterid is null
	begin
		-- Make sure we still create a result set of the expectant type
		select cs.* 
			from charstats cs --inner join characterinfo ci on ci.characterid=cs.characterid
			where (0=1)
		return
	end
end

-- If they specify characterID=-1, then they want the top
if @characterID=-1
begin
	select @firstordinal=1
	select top 56 @firstordinal as 'FirstOrdinal', cs.*
		from charstats cs --inner join characterinfo ci on ci.characterid=cs.characterid
		where civid=@civID or (@civID is null and civid is null)
		order by civid desc, CharacterName desc, cs.characterid desc
end
else
begin
	if @CharacterName = ''
		select @CharacterName=CharacterName from charstats 
			where CharacterID=@characterid And (civid=@civid or (@civID is null and civid is null))

	-- it's not quite the first ordinal yet, just count for now. Will patch up to be ordinal down below
	select @firstordinal=1
/*	don't need to spend this cost, since ordinals for names don't mean much
	select @firstordinal=count(*) from charstats 
		where (CharacterName<=@CharacterName) 
			and (civid=@civID or (@civID is null and civid is null)) 
*/

	select top 42 cs.* into #higher 
		from charstats cs --inner join characterinfo ci on ci.characterid=cs.characterid
		where (CharacterName<=@CharacterName) 
			and (civid=@civID or (@civID is null and civid is null))
		order by civid desc, CharacterName desc, cs.characterid desc

--	select @firstordinal=@firstordinal - count(*) + 1 from #higher

	select top 42 cs.* into #lower 
		from charstats cs --inner join characterinfo ci on ci.characterid=cs.characterid
		where (CharacterName>@CharacterName) 
			and (civid=@civID or (@civID is null and civid is null)) 
		order by civid, cs.CharacterName, cs.characterid

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