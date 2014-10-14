CREATE Procedure GetLobbyLogonInfo
(
	@characterName char (24),
	@characterID int,
	@accesscode char(32),
	@fValidCode bit output,
	@fCanCheat bit output
)
As
set nocount on 

select @fValidCode=0
select @fCanCheat=0

-- We're gonna assume if they got this far they're kosher, so add 'em if they're not there already
exec LogonUser @characterName, @characterID, @fCanCheat output

declare @status smallint

/* Status Codes
0: code never been used. There must NOT be any rows in AccessCodeUsage for this code
1: code in use (normal case). 
2: code has been reassigned. Invalid code now
3: code has been disabled for whatever random reason. Invalid code now
4: code is reserved for future use. Invalid code at this time
*/

select @status=status from AccessCodes where accesscode=@accesscode

if @@rowcount=1 and @status <= 1 --valid access code
begin	
	if @status = 0 -- code never been used
		update AccessCodes set status = 1 where accesscode=@accesscode

	-- Assume that more often than not, the code will be used by a name that's used it before
	update AccessCodeUsage set LastUsage=getdate() where AccessCode=@accesscode and ZoneName=@characterName

	if @@rowcount=0 --new zone name used with this key
		insert into AccessCodeUsage (AccessCode, ZoneName) values (@accesscode, @characterName)
	
	select @fValidCode=1
end

-- We need to tell them which squads they're in. This generates a rowset
-- I can't really skip this if the access code is invalid because 
--		a) the lobby might not be enforcing access codes, and 
--		b) the lobby will require a properly formed rowset anyway
exec GetCharSquads @characterID