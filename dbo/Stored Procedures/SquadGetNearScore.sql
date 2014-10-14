Create Procedure SquadGetNearScore
(
	@squadID int,   -- If they specify squadID=-1, then they want the top
	@squadname char(30) = '' -- (only) if they specify a name, we need to look up the squadID (ignoring what was passed in)
)
As
set nocount on 

/*
	All the GetNear* functions are exactly the same, except for the sort column, and the type of the sort column.
	
	Any changes made to one needs to be made to all the others. I typically just modify one, then cut & paste
	the whole thing to all others, then use search & replace on the single 
*/

declare @Score real
declare @firstordinal int

-- If they specify a name, then we need to look up the squadID
if @squadname<>''
begin
	select @squadid=NULL
	select @squadid=squadid from squads where squadname=@squadname
	if @squadid is null
	begin
		-- Make sure we still create a result set of the expectant type
		select * 
			from squads
			where (0=1)
		return
	end
end

-- If they specify squadID=-1, then they want the top
if @squadID=-1
begin
	select @firstordinal=1
	select top 35 @firstordinal as 'FirstOrdinal', *
		from squads
		order by Score desc, squadid desc
end
else
begin
	select @Score=Score from squads 
		where squadID=@squadid 

	-- it's not quite the first ordinal yet, just count for now. Will patch up to be ordinal down below
	select @firstordinal=count(*) from squads 
		where (Score>@Score or (Score=@Score and squadid>=@squadID or @Score is null)) 

	select top 35 * into #higher 
		from squads
		where (Score>@Score or (Score=@Score and squadid>=@squadID) or @Score is null) 
		order by Score, squadid 

	select @firstordinal=@firstordinal - count(*) + 1 from #higher

	select top 34 * into #lower 
		from squads
		where (Score<@Score or (Score=@Score and squadid<@squadID)) 
		order by Score desc, squadid desc

	select @firstordinal as 'FirstOrdinal', o.* from 
	(
		select * from #higher
		union all
		select* from #lower
	) AS o 
	order by Score desc, squadid desc

	drop table #higher
	drop table #lower
end