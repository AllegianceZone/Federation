CREATE TABLE [dbo].[Constants] (
	[PointsWin] [float] NOT NULL ,
	[PointsWarpsSpotted] [float] NOT NULL ,
	[PointsAsteroidsSpotted] [float] NOT NULL ,
	[PointsMinerKills] [float] NOT NULL ,
	[PointsBuilderKills] [float] NOT NULL ,
	[PointsLayerKills] [float] NOT NULL ,
	[PointsBaseKills] [float] NOT NULL ,
	[PointsBaseCaptures] [float] NOT NULL ,
	[PointsTechsRecovered] [float] NOT NULL ,
	[PointsPlayerKills] [float] NOT NULL ,
	[PointsDeaths] [float] NOT NULL ,
	[PointsPilotBaseKills] [float] NOT NULL ,
	[PointsPilotBaseCaptures] [float] NOT NULL ,
	[PointsFlagCapture] [float] NOT NULL ,
	[PointsArtifactCapture] [float] NOT NULL 
) ON [PRIMARY]
GO
Create Trigger Constants_Insert
On dbo.Constants
For Insert
As
	If (Select count(*) from Constants) > 1 
   	Begin
   		Rollback Transaction
   		RaisError ('Only one row is allowed in the Constants table', 18, 1) WITH NOWAIT
   	End