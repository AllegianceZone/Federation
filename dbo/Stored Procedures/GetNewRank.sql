CREATE Procedure GetNewRank
(
	@CivID smallint,
	@Score int,
	@Rank smallint output /* IN: old rank, OUT: new rank */
)
As
set nocount on
declare @requiredScore int

/* Advance rank if 
	a) there is another rank to advance to, and 
	b) reached the requirement for it */
select @requiredScore=Requirement from Ranks 
	where (civid=@civid or (@civID is null and civid is null)) and Rank=@Rank+1

if (@requiredScore is not null) and @Score>=@requiredScore
	select @Rank=@Rank+1
	
return