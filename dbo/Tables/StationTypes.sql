CREATE TABLE [dbo].[StationTypes] (
	[StationTypeID] [smallint] NOT NULL ,
	[Name] char (24) NOT NULL ,
	[Model] char (12) NOT NULL ,
	[Description] char (200) NULL ,
	[Radius] [real] NOT NULL ,
	[HitPointsArmor] smallint NOT NULL ,
	[HitPointsShield] smallint NOT NULL ,
	[RateRegenShield] [real] NOT NULL ,
	[RateRegenArmor] [real] NOT NULL ,
	[Price] [int] NOT NULL ,
	[Signature] [smallint] NOT NULL ,
	[SecondsToBuild] [smallint] NOT NULL ,
	[TechBitsLocal] char (256) NOT NULL ,
	[TechBitsRequired] char (256) NOT NULL ,
	[TechBitsEffect] char (256) NOT NULL ,
	[UpgradeStationTypeID] [smallint] NULL ,
	[Capabilities] [smallint] NOT NULL ,
	[ScanRange] [real] NOT NULL ,
	[AsteroidDiscountMask] [smallint] NOT NULL ,
	[Income] [int] NOT NULL ,
	[PRIcon] char (12) NULL ,
	[BuildLocationSound] smallint NOT NULL ,
	[ConstructorAttackedSound] smallint NOT NULL ,
	[ConstructorDestroyedSound] smallint NOT NULL ,
	[CompletedSound] smallint NOT NULL ,
	[ExteriorSound] smallint NOT NULL ,
	[InteriorSound] smallint NOT NULL ,
	[InteriorAlertSound] smallint NOT NULL ,
	[UnderAttackSound] smallint NOT NULL ,
	[CriticalSound] smallint NOT NULL ,
	[DestroyedSound] smallint NOT NULL ,
	[CapturedSound] smallint NOT NULL ,
	[EnemyDestroyedSound] smallint NOT NULL ,
	[EnemyCapturedSound] smallint NOT NULL ,
	[GroupID] tinyint NOT NULL ,
	[ClassID] tinyint NOT NULL ,
	[SecondsToBuy] [smallint] NOT NULL ,
	[DefenseTypeArmor] [tinyint] NOT NULL ,
	[DefenseTypeShield] [tinyint] NOT NULL ,
	[BuilderName] char (24) NULL ,
	[ConstructionDroneTypeID] [smallint] NOT NULL
) 
GO
ALTER TABLE [dbo].[StationTypes] ADD 
	CONSTRAINT [FK_StationTypes_Drones] FOREIGN KEY 
	(
		[ConstructionDroneTypeID]
	) REFERENCES [dbo].[Drones] (
		[DroneID]
	)
GO
ALTER TABLE [dbo].[StationTypes] ADD 	CONSTRAINT [FK_StationTypes_StationTypes] FOREIGN KEY 
	(
		[UpgradeStationTypeID]
	) REFERENCES [dbo].[StationTypes] (
		[StationTypeID]
	)
GO
ALTER TABLE [dbo].[StationTypes] WITH NOCHECK ADD 

	CONSTRAINT [PK_StationTypes] PRIMARY KEY CLUSTERED 
	(
		[StationTypeID]
	)   
GO
ALTER TABLE [dbo].[StationTypes] WITH NOCHECK ADD 	CONSTRAINT [CK_StationTypes] CHECK ([Radius] > 0 and [HitPointsArmor] > 0 and [HitPointsShield] >= 0 and [RateRegenArmor] >= 0 and [RateRegenShield] >= 0 and [Price] > 0 and [Signature] >= 0 and [SecondsToBuild] > 0 and [ScanRange] >= 0 and [UpgradeStationTypeID] < [StationTypeID])
GO
CREATE Trigger StationTypes_Trigger_InsUpd
On dbo.StationTypes
For Insert, Update
As

declare @ok bit

If Update (TechBitsRequired) or  Update (TechBitsEffect) or Update(TechBitsLocal)
Begin
    declare @techbitsR TechBits, @techbitsE TechBits, @techbitsL TechBits
    select @ok = 0
    /* need to see if ANY modified row has bogus techbits */
    Declare curIns Cursor Local For
    	Select TechBitsRequired, TechBitsEffect, TechBitsLocal From Inserted
    Open curIns

    Fetch Next From curIns Into @techbitsR, @techbitsE, @techbitsL
    
    While @@FETCH_STATUS = 0
    Begin
    	Execute IsValidTechBits @techbitsR, @ok Output
    	If @ok=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsRequired', 18, 1) WITH NOWAIT
    	End
    	Execute IsValidTechBits @techbitsE, @ok Output
    	If @ok=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsEffect', 18, 1) WITH NOWAIT
    	End
    	Execute IsValidTechBits @techbitsL, @ok Output
    	If @ok=0
    	Begin
    		Rollback Transaction
    		RaisError ('Invalid tech in TechBitsLocal', 18, 1) WITH NOWAIT
    	End
        Fetch Next From curIns Into @techbitsR, @techbitsE, @techbitsL
    End

    Close curIns
End

/* why the freal won't nested comments work??? */
/* why can't I use false in logical expressions??? */
If (0=1 and (Update (TechBitsLocal) or Update(TechBitsEffect)))
Begin
    declare     @iIndex				int
    declare     @siStationType      smallint
    declare     @siUpgradeType      smallint
    declare     @szStationEffect    TechBits
    declare     @szUpgradeEffect    TechBits
    declare     @iStationEffect     int
    declare     @iUpgradeEffect     int
    declare     @szStationLocal     TechBits
    declare     @szUpgradeLocal     TechBits
    declare     @iStationLocal      int
    declare     @iUpgradeLocal      int
    declare     @szProblemBits      char(20)

    declare     curStations cursor local for
    	                select st1.stationtypeid, st2.stationtypeid,
    	                st1.techbitseffect, st2.techbitseffect,
    	                st1.techbitslocal, st2.techbitslocal
    	                from inserted st1, stationtypes st2 
    	                where (st1.upgradestationtypeid = st2.stationtypeid) or
    						  (st1.stationtypeid = st2.upgradestationtypeid)
    	                order by st1.stationtypeid

    open        curStations                 

    fetch next from curStations into 
    				@siStationType, 
    	            @siUpgradeType,
    	            @szStationEffect,
    	            @szUpgradeEffect,
    	            @szStationLocal,
    	            @szUpgradeLocal
    while (@@fetch_status <> -1)
    begin
    	if (@@fetch_status <> -2)
    	begin
    		/* the inserted table could have either the base OR upgraded station */
    		If (@siStationType < @siUpgradeType)
    		Begin
    			/* need to rearrange the stations */
    			declare @siT smallint
    			Select @siT = @siStationType
    			Select @siStationType = @siUpgradeType
    			Select @siUpgradeType = @siT
    			declare @tbT TechBits
    			Select @tbT = @szStationEffect
    			Select @szStationEffect = @szUpgradeEffect
    			Select @szUpgradeEffect = @tbT
    			Select @tbT = @szStationLocal
    			Select @szStationLocal = @szUpgradeLocal
    			Select @szUpgradeLocal = @tbT
    		End

    		Execute IsTechBitsSuperset @szStationEffect, @szUpgradeEffect, @ok Output
    		if @ok=0
    			select @szProblemBits = '(Effect bits)'
    		else
    		Begin
    			Execute IsTechBitsSuperset @szStationLocal, @szUpgradeLocal, @ok Output
    			if @ok=0
    				select @szProblemBits = '(Local bits)'
    		End
    		
    		if @ok=0
    		Begin
    			Rollback Transaction
    			declare @msg varchar(100)
    			select @msg = 'Warning: Illegal upgrade from station (' +
    	   Convert(char(3), @siStationType) + ') to station (' +
    	                Convert(char(3), @siUpgradeType) + ') ' + @szProblemBits
    			RaisError (@msg, 18, 1) WITH NOWAIT
    		End
   end
    	fetch next from curStations into @siStationType,
    	                @siUpgradeType,
    	                @szStationEffect,
    	                @szUpgradeEffect,
    	                @szStationLocal,
    	                @szUpgradeLocal
    end

    close       curStations
    deallocate  curStations

End