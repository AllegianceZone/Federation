Create Procedure CreateLotsOfRandomSquads
	(
		@startingnumber int,
		@numsquads int
	)
As
set nocount on

declare @i int

select @i=0
while (@i < @numsquads)
begin
	declare @squadname char(12)
	declare @squadid int
	declare @score smallint
	declare @wins smallint
	declare @losses smallint
	select @wins=convert(smallint, 1000 * rand())
	select @losses=convert(smallint, 1000 * rand())
	select @score=1000 * @wins / (@wins + @losses)
	
	select @squadname='Random' + convert(char(6), @i + @startingnumber)
	insert into squads (SquadID, SquadName, Score, Wins, Losses) 
		values (@i, @squadname, @score, @wins, @losses)
	
	select @i=@i+1
end

return