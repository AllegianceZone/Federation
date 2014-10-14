CREATE Procedure IsTechBitsSuperset
(
    @tb1 char (256), /* Is THIS techbits fully superceded by ...*/
    @tb2 char (256), /* ...THIS techbits? */
    @ok  bit Output
)
As
set nocount on

select @ok = 1 /* ok until we find a char that's not */

return