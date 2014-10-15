CREATE Procedure SetCharacterStats
(
--	The caller will be sending the values for ONE GAME ONLY, except combat rating, which is overall
	@bScoresCount   bit,
	@CharacterId	int,
	@CivId			smallint,
	@Rating			smallint, -- Combat rating (overall)

-- Stuff that affects Score (values from only one game):
    @WarpsSpotted	real,
    @AsteroidsSpotted real,
    @TechsRecovered real,
    @MinerKills		real,
    @BuilderKills	real,
    @LayerKills		real,
    @PlayerKills	real,
    @BaseKills		real,
    @BaseCaptures	real,
    @Deaths			smallint,
    @PilotBaseKills smallint,
    @PilotBaseCaptures smallint,
	@MinutesPlayed	int,
	@bWin			bit,
	@bLose			bit,
	@bWinCmd		bit,
	@bLoseCmd		bit,
	@RankOld		smallint,
	@Score			real		 -- score that they got FOR THIS GAME
)
As
set nocount on
declare @Kills smallint -- how do all the types of kills get mapped to THE kills stat?
declare @TotalScore real
declare @RankNew smallint

/* We could do this, but let's not due to perf
if @civid not in (select civID from Civs)
Begin
	RaisError ('SetCharStats: You must specify a valid civ to update', 18, 1) WITH NOWAIT
	return
End
*/

if @bScoresCount=1
begin
	if @Score < 0
		select @Score = 0

	Select @Kills=@PlayerKills

	--Check for Civ rank advancement
	select @TotalScore=Score from CharStats where CharacterId=@characterid and civid=@civid
	if @TotalScore is null
		select @TotalScore=0
	select @TotalScore=@TotalScore + @Score

	select @RankNew = max(r.rank) from ranks r 
			where (r.civid=@CivId or (r.civid is null and @CivId is null)) and r.requirement <= @TotalScore
end

declare @charname char (24)
-- not doing begin tran because it's just too slow!
-- Update the civ-specific stats
if exists (select * from CharStats where CharacterId=@characterid and civid=@civid)
	if @bScoresCount=1
		update CharStats set 
				Rank=@RankNew, Score=@TotalScore, MinutesPlayed=MinutesPlayed+@MinutesPlayed, 
				BaseKills=BaseKills+@BaseKills, BaseCaptures=BaseCaptures+@BaseCaptures, 
				Kills=Kills+@Kills, Rating=@Rating, GamesPlayed=GamesPlayed+1, 
				Deaths=Deaths+@Deaths, Wins=Wins+@bWin, Losses=Losses+@bLose, 
				WinsCmd=WinsCmd+@bWinCmd, LossesCmd=LossesCmd+@bLoseCmd, LastPlayed=GetDate()
			where characterid=@characterid and civid=@civid 
	else
		update CharStats set 
				MinutesPlayed=MinutesPlayed+@MinutesPlayed, 
				GamesPlayed=GamesPlayed+1, LastPlayed=GetDate()
			where characterid=@characterid and civid=@civid 
else
begin
	select @charname=CharacterName from CharacterInfo Where CharacterId=@CharacterID
	if @bScoresCount=1
		insert into CharStats (
				CharacterId, CharacterName, CivID, Rank, Score, MinutesPlayed, BaseKills, 
				BaseCaptures, Kills, Rating, GamesPlayed, Deaths, Wins, Losses, WinsCmd, LossesCmd, LastPlayed) 
			Values(@CharacterId, @charname, @CivID, @RankNew, @TotalScore, @MinutesPlayed, @BaseKills, 
				@BaseCaptures, @Kills, @Rating, 1, @Deaths, @bWin, @bLose, @bWinCmd, @bLoseCmd, GetDate()) 
	else
		insert into CharStats (
				CharacterId, CharacterName, CivID, MinutesPlayed, GamesPlayed, LastPlayed) 
			Values(@CharacterId, @charname, @CivID, @MinutesPlayed, 1, GetDate()) 
end

-- Update overall stats (ignore scores count, because we're just aggregating the per civ stuff
declare	@GamesPlayed smallint, @Wins smallint, @Losses smallint, @WinsCmd smallint, @LossesCmd smallint, 
		@OverallScore real, @OverallRank smallint
-- First calculate them. We know we have at least one civ at this point, since we just added/updated it
select	@OverallScore=Sum(Score), @MinutesPlayed=Sum(MinutesPlayed), 
		@BaseKills=Sum(BaseKills), @BaseCaptures=Sum(BaseCaptures), @Kills=Sum(Kills), 
		@Rating=Max(Rating), 
		@GamesPlayed=Sum(GamesPlayed), @Deaths=Sum(Deaths), @Wins=Sum(Wins), @Losses=Sum(Losses),
		@WinsCmd=Sum(WinsCmd), @LossesCmd=Sum(LossesCmd)
	from charstats 
	where characterid=@characterid and not (civid is NULL)

-- Now update them (getting the new rank for overall)
select @OverallRank = max(r.rank) from ranks r where r.civid is null and r.requirement <= @OverallScore

if exists (select * from CharStats where CharacterId=@characterid and civid is null)
	update CharStats set 
			Rank=@OverallRank, Score=@OverallScore, MinutesPlayed=@MinutesPlayed, 
			BaseKills=@BaseKills, BaseCaptures=@BaseCaptures, Kills=@Kills, Rating=@Rating, 
			GamesPlayed=@GamesPlayed, Deaths=@Deaths, Wins=@Wins, Losses=@Losses, 
			WinsCmd=@WinsCmd, LossesCmd=@LossesCmd, LastPlayed=GetDate()
		where characterid=@characterid and civid is null
else
begin
	if @charname is null	
		select @charname=CharacterName from CharacterInfo Where CharacterId=@CharacterID
	insert into CharStats (
			CharacterId, CharacterName, CivID, Rank, Score, MinutesPlayed, BaseKills, 
			BaseCaptures, Kills, Rating, GamesPlayed, Deaths, Wins, Losses, WinsCmd, LossesCmd, LastPlayed) 
		values(@CharacterId, @charname, null, @OverallRank, @Score, @MinutesPlayed, @BaseKills, 
			@BaseCaptures, @Kills, @Rating, @GamesPlayed, @Deaths, @Wins, @Losses, @WinsCmd, @LossesCmd, GetDate()) 
end	
-- commit tran

return