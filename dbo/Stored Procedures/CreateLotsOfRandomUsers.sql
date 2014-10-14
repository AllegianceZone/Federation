CREATE Procedure CreateLotsOfRandomUsers
	(
		@startingnumber int,
		@numusers int,
		@civid1 smallint,
		@civid2 smallint = NULL,
		@civid3 smallint = NULL
	)
As
set nocount on

declare @i int

select @i=0
while (@i < @numusers)
begin
	declare @charname char(12)
	declare @charid int
	
	select @charname='Random' + convert(char(6), @i + @startingnumber)
	insert into characterinfo (CharacterID, CharacterName) values (@i + @startingnumber, @charname)
	select @charid=characterid from characterinfo where charactername=@charname
	
	--exec SetRandomStats @charID, @CivID1	
	
	if @civID2 is not null
		exec SetRandomStats @charID, @CivID2

	if @civID3 is not null
		exec SetRandomStats @charID, @CivID3
	
	select @i=@i+1
end

return