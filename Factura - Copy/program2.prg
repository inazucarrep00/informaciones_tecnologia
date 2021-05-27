SET DEVICE TO PRINT
   SET PRINTER TO
*   ??? " "
   _ASCIIROWS = 63

   @ PROW( ), PCOL( ) + 12 SAY 'Contact person'
   @ PROW( ), $+12 SAY 'Contact person'
   @ 1,0 SAY 'NORMAL TEXT'
   @ 2,0 SAY CHR(15) && Control code to turn compressed mode on
   @ 2,0 SAY 'CONDENSED text?'
   @ 3,0 SAY CHR(18) && Control code to turn compressed mode off
   @ 3,0 SAY 'NORMAL again'
   SET DEVICE TO SCREEN
   SET PRINTER TO