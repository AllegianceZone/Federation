CREATE Procedure GetLogonStats
(
	@characterName char (24),
	@characterID int,
	@fCanCheat bit output
)
As
set nocount on 

-- We're gonna assume if they got this far they're kosher, so add 'em if they're not there already
exec LogonUser @characterName, @characterID, @fCanCheat output

Select ISNULL(CivID, -1), Rank, Score, MinutesPlayed, BaseKills, BaseCaptures, 
		Kills, Rating, GamesPlayed, Deaths, Wins, Losses 
	From CharStats Where CharacterId=@characterID