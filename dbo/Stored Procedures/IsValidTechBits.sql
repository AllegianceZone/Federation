CREATE Procedure IsValidTechBits
(
    @TechBitsStr char(800),
    @fok         bit OUTPUT
)
As
/* Determine whether every techbit specified is a valid techbit */
/* Assumption: The list of tech bits are space delimited, with only one space between each tech bit */
set nocount on

select @fok = 0 /* assume failure until all tech bits have been verified */

declare @itb int
declare @lenBits int
declare @ispace int
declare @tech char(40) /* sync up with size of short name in TechBits */

Select @itb=1
Select @lenbits=LEN(@TechBitsStr) + 1 /* zero-based */

while (@itb < @lenbits)
begin
    select @ispace=charindex(' ', @TechBitsStr, @itb) /* find the next space */
    if (@ispace=0) /* no space found, last token */
    	select @ispace=@lenbits+1
    select @tech=SubString(@TechBitsStr, @itb, @ispace-@itb)
    if (Exists(Select * From TechBits Where BitShortName=@tech))
        select @itb=@ispace+1
    else
        return /* failure */
end
Select @fok=1

return