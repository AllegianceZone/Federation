CREATE Procedure SquadGetNearNames
(
	@SquadID int,   -- If they specify squadID=-1, then they want the top
	@SquadName char (24) = '' -- (only) if they specify a name, we need to look up the squadID (ignoring what was passed in)
)
As
set nocount on 

/*
	All the SquadGetNear* functions are exactly the same, except for the sort column, and the type of the sort column.
	
	Any changes made to one needs to be made to all the others. I typically just modify one, then cut & paste
	the whole thing to all others, then use search & replace on the single 
*/

declare @firstordinal int

-- If they specify a name, then we need to look up the squadID
if @SquadName<>''
begin
	select @squadid=NULL
	select top 1 @squadid=squadid from squads
		where squadname >= @SquadName order by Squadname
	if @SquadId is null
	begin
		-- Make sure we still create a result set of the expectant type
		select * 
			from squads s
			where (0=1)
		return
	end
end

-- If they specify SquadID=-1, then they want the top
if @SquadID=-1
begin
	select @firstordinal=1
	select top 35 @firstordinal as 'FirstOrdinal', *
		from squads
		order by SquadName
end
else
begin
	if @SquadName = ''
		select @SquadName=SquadName from squads where SquadID=@Squadid

	-- it's not quite the first ordinal yet, just count for now. Will patch up to be ordinal down below
	select @firstordinal=1
	--	don't need to spend this cost, since ordinals for names don't mean much, but Currie wants it :-)
	select @firstordinal=count(*) from Squads
		where (SquadName<=@SquadName) 

	select top 35 * into #higher
		from squads
		where SquadName<=@SquadName
		order by SquadName desc

	select @firstordinal=@firstordinal - count(*) + 1 from #higher
	
	select top 34 * into #lower 
		from squads
		where SquadName>@SquadName
		order by SquadName

	select @firstordinal as 'FirstOrdinal', o.* from 
	(
		select * from #higher
		union all
		select* from #lower
	) AS o 
	order by SquadName

	drop table #higher
	drop table #lower
end