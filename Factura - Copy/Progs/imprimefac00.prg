keyF10 = .T.
KEYBOARD '{ENTER}'
RETURN 

DECLARE INTEGER GetSystemTime IN win32api STRING @
cBuff=SPACE(40)
=GetSystemTime(@cBuff)

*---------------------------------------------------------------------
* GetSystemTime returns a structure of WORD (16-bit unsigned integer)
* values.  These values are stored in a character variable in Visual
* FoxPro and need to be converted back to 16-bit values from the 8-bit
* characters.
*----------------------------------------------------------------------

#DEFINE YEAR_LOC "Año: "
#DEFINE MONTH_LOC "Mes: "
#DEFINE DOW_LOC "Día de la semana: "
#DEFINE DAY_LOC "Día: "
#DEFINE HOUR_LOC "Hora (hora UTC): "
#DEFINE MINUTE_LOC "Minuto: "
#DEFINE SECOND_LOC "Segundo: "
#DEFINE MILLI_LOC "Milisegundo: "

THIS.Parent.lblYear.Caption = YEAR_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,2)) * 256 + ASC(SUBSTR(cBuff,1))))
THIS.Parent.lblMonth.Caption = MONTH_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,4)) * 256 + ASC(SUBSTR(cBuff,3))))
THIS.Parent.lblDOW.Caption = DOW_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,6)) * 256 + ASC(SUBSTR(cBuff,5))))
THIS.Parent.lblDay.Caption = DAY_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,8)) * 256 + ASC(SUBSTR(cBuff,7))))
THIS.Parent.lblHour.Caption = HOUR_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,10)) * 256 + ASC(SUBSTR(cBuff,9))))
THIS.Parent.lblMinute.Caption = MINUTE_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,12)) * 256 + ASC(SUBSTR(cBuff,11))))
THIS.Parent.lblSecond.Caption = SECOND_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,14)) * 256 + ASC(SUBSTR(cBuff,13))))
THIS.Parent.lblMillisecond.Caption = MILLI_LOC + ALLTRIM(STR(ASC(SUBSTR(cBuff,16)) * 256 + ASC(SUBSTR(cBuff,15))))

CLEAR DLLS
