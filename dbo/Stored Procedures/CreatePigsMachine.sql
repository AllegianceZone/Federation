CREATE Procedure CreatePigsMachine (@szComputerName char (24))
As
declare @szTemp Name
declare @szNumber char(10)
declare @i int
select @i = 0
while @i < 30
BEGIN
    select @szNumber = convert(varchar, @i)
    if (@i < 10)
    	select @szNumber = '0' + convert(varchar, @szNumber)
    if (@i < 100)
    	select @szNumber = '0' + convert(varchar, @szNumber)
    select @szTemp = (rtrim(convert(varchar, @szComputerName)) + '-' + convert(varchar, @szNumber))
    insert into characterinfo (CharacterName) values(@szTemp)
    select @i = @i + 1
END