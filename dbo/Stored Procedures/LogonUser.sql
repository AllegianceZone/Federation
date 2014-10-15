CREATE Procedure LogonUser
	@characterName char (24),
	@characterID int,
	@fCanCheat bit output
As
set nocount on

-- Called anytime we want to validate a username/id

declare @charID1 int
declare @name1 char (24)

Select @name1 = characterName, @fCanCheat = CanCheat, @charID1 = characterID
	from CharacterInfo 
	Where characterID=@characterID or charactername=@characterName

if @@rowcount <> 1 or @name1 <> @characterName or @charID1 <> @characterID --everything's fine
begin
	delete from CharStats		where characterID=@characterID or charactername=@charactername
	delete from CharMedals		where characterID=@characterID or characterid=@charID1
	delete from CharacterInfo	where characterID=@characterID or charactername=@charactername
	Insert Into CharacterInfo (CharacterName, CharacterID) Values(@characterName, @characterID)
	select @fCanCheat=0
end

return