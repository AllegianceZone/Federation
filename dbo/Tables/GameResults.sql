CREATE TABLE [dbo].[GameResults] (
	[GameID] [char] (17) NOT NULL ,
	[Name] [char] (64) NOT NULL ,
	[WinningTeam] char (24) NOT NULL ,
	[WinningTeamID] [smallint] NOT NULL ,
	[IsGoalConquest] [bit] NOT NULL ,
	[IsGoalCountdown] [bit] NOT NULL ,
	[IsGoalTeamKills] [bit] NOT NULL ,
	[IsGoalProsperity] [bit] NOT NULL ,
	[IsGoalArtifacts] [bit] NOT NULL ,
	[IsGoalFlags] [bit] NOT NULL ,
	[GoalConquest] [smallint] NOT NULL ,
	[GoalCountdown] [int] NOT NULL ,
	[GoalTeamKills] [smallint] NOT NULL ,
	[GoalProsperity] [real] NOT NULL ,
	[GoalArtifacts] [smallint] NOT NULL ,
	[GoalFlags] [smallint] NOT NULL ,
	[Duration] [int] NOT NULL ,
	[StartTime] AS (dateadd(second,(((-[Duration]))),[EndTime])) ,
	[EndTime] [datetime] NULL 
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GameResults] WITH NOCHECK ADD 
	CONSTRAINT [DF__GameResul__EndTi__36B12243] DEFAULT (getdate()) FOR [EndTime]
GO
CREATE  INDEX [IX_GameResults_GameID] ON [dbo].[GameResults]([GameID]) ON [PRIMARY]
GO
CREATE  INDEX [IX_GameResults_EndTime] ON [dbo].[GameResults]([EndTime]) ON [PRIMARY]