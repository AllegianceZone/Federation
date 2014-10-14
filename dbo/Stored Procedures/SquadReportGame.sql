CREATE Procedure SquadReportGame
(
        @squadIDWon     int,
        @squadIDLost1   int,
        @squadIDLost2   int = -1,
        @squadIDLost3   int = -1,
        @squadIDLost4   int = -1,
        @squadIDLost5   int = -1
)
As
set nocount on

declare @scoreWinner smallint
declare @scoreLoser smallint
declare @k real

select @scoreWinner = Score from Squads where SquadID=@squadIDWon
select @scoreLoser  = Score from Squads where SquadID=@squadIDLost1
select @scoreWinner
select @scoreLoser

select @k = (1.25 + (@scoreLoser - @scoreWinner) / 1000.0) / 50.0;
select @k

update Squads set GamesPlayed = GamesPlayed + 1, 
				  Wins   = Wins+1,     
                  Score = @scoreWinner * (1 - @k) + @k * 1000
	Where SquadID = @squadIDWon

update Squads set GamesPlayed = GamesPlayed + 1, 
				  Losses = Losses + 1, 
				  Score = @scoreLoser  * (1 - @k)             
	Where SquadID = @squadIDLost1

return