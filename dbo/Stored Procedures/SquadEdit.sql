CREATE Procedure SquadEdit


	(
		@SquadID			int,
		@Description		varchar(510),
		@URL				varchar(255),
		@civID				smallint
	)

As

set nocount on

select @Description = rtrim(@Description)
select @URL = rtrim(@URL) 

declare	@ErrorCode	int		 	 
declare	@ErrorMsg	varchar(128)

-- Imago 10/14 exec profile.profile.dbo.p_edit_team_profile_aleg @SquadID, @Description, @URL, @ErrorCode output, @ErrorMsg output

	if @ErrorCode = 0
	begin
		-- now update federation database
		update squads
			set civid = @civid 
			where squadid = @squadid
	end

select @ErrorCode, @ErrorMsg