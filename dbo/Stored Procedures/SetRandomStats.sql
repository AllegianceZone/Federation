CREATE Procedure SetRandomStats
(
	@charID int,
	@civID smallint
)
As
	declare @Rank	smallint
	declare @Score			real
	declare @MinutesPlayed	smallint
	declare @Kills			smallint
	declare @Deaths			smallint
	declare @Wins			smallint
	declare @Losses			smallint
	declare @Rating			smallint
	declare @Warps			real
	declare @Asteroids		real
	declare @Techs			real
	declare @MinerKills		real
	declare @BuilderKills	real
	declare @LayerKills		real
	declare @PlayerKills	real
	declare @BaseKills		real
	declare @BaseCaptures	real
	declare @PilotBaseKills smallint
	declare @PilotBaseCaptures smallint
	declare @bWin			bit
	
	select @MinutesPlayed=convert(smallint, 300 * rand())
	select @kills=convert(smallint, 100 * rand())
	select @Deaths=convert(smallint, 10 * rand())
	select @Wins=convert(smallint, 1000 * rand())
	select @Losses=convert(smallint, 1000 * rand())
	select @Rating=convert(smallint, 1000 * rand())
	select @Warps=convert(real, 10 * rand())
	select @Asteroids=convert(real, 10 * rand())
	select @Techs=convert(real, 5 * rand())
	select @MinerKills=convert(real, 3 * rand())
	select @BuilderKills=convert(real, 1 * rand())
	select @LayerKills=convert(real, 1 * rand())
	select @PlayerKills=convert(real, 10 * rand())
	select @BaseKills=convert(real, 1 * rand())
	select @BaseCaptures=convert(real, 2 * rand())
	select @PilotBaseKills=convert(smallint, 3 * rand())
	select @PilotBaseCaptures=convert(smallint, 2 * rand())
	select @bWin=convert(smallint, 2 * rand())
	select @Rank=1
	
	exec SetCharacterStats
		@CharID,
		@CivId,
		@Rating,
		@Warps,
		@Asteroids,
		@Techs,
		@MinerKills,
		@BuilderKills,
		@LayerKills,
		@PlayerKills,
		@BaseKills		,
		@BaseCaptures	,
		@Deaths			,
		@PilotBaseKills,
		@PilotBaseCaptures,
		@MinutesPlayed	,
		@bWin,
		@Rank output,
		@Score output
	return