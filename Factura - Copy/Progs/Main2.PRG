*-- (c) Microsoft Corporation 1995

#INCLUDE "INCLUDE\TASTRADE.H"

*-- DECLARE DLL statements for reading/writing to private INI files
DECLARE INTEGER GetPrivateProfileString IN Win32API  AS GetPrivStr ;
  String cSection, String cKey, String cDefault, String @cBuffer, ;
  Integer nBufferSize, String cINIFile

DECLARE INTEGER WritePrivateProfileString IN Win32API AS WritePrivStr ;
  String cSection, String cKey, String cValue, String cINIFile

*-- DECLARE DLL statements for reading/writing to system registry
DECLARE Integer RegOpenKeyEx IN Win32API ;
  Integer nKey, String @cSubKey, Integer nReserved,;
  Integer nAccessMask, Integer @nResult

DECLARE Integer RegQueryValueEx IN Win32API ;
  Integer nKey, String cValueName, Integer nReserved,;
  Integer @nType, String @cBuffer, Integer @nBufferSize

DECLARE Integer RegCloseKey IN Win32API ;
  Integer nKey

*-- DECLARE DLL statement for Windows 3.1 API function GetProfileString
DECLARE INTEGER GetProfileString IN Win32API AS GetProStr ;
  String cSection, String cKey, String cDefault, ;
  String @cBuffer, Integer nBufferSize

PUBLIC fDesde, fHasta, _nFac
fDesde = {}
fHasta = {}
_nFac = ""
cGroup = ""
_dato = null
datacombo = "" 
tipodoc = 'F'
indice = 1
lnDias = 0
*IF !USED("Employee")
*    USE SYS(2003)+"\DATA\Employee" IN 0
*ENDIF
IF !USED("cod_seq")
   USE SYS(2003)+"\DATA\cod_seq" IN 0
ENDIF

*=SEEK(DefaultEmployee(),"Employee","Employee_i")
*cGroup = Employee.group_id
*USE IN Employee

*IF !USED("PERMISOS")
*    USE SYS(2003)+"\DATA\permisos" IN 0
*ENDIF
*SELECT PERMISOS
*SCAN &&FOR group_id=cGroup
*  var = "Var"+opMenu+"=NULL"
*  &Var
*ENDSCAN
***USE IN permisos

PUBLIC ARRAY achkpagos(30,1), arrAlias(4), Arrtablas(75),ArrPorc(100)
achkpagos = null
Arrtablas=""
ArrPorc=0

CLEAR

*-- Ensure the project manager is closed, or we may run into
*-- conflicts when trying to KEYBOARD a hot-key
DEACTIVATE WINDOW "Project Manager"

*-- All public vars will be released as soon as the application
*-- object is created. 

IF SET('TALK') = 'ON'
  SET TALK OFF
  PUBLIC gcOldTalk
  gcOldTalk = 'ON'
ELSE
  PUBLIC gcOldTalk
  gcOldTalk = 'OFF'
ENDIF

PUBLIC gcOldDir, gcOldPath, gcOldClassLib, gcOldEscape, gTTrade
gcOldEscape   = SET('ESCAPE')
gcOldDir       = FULLPATH(CURDIR())
gcOldPath     = SET('PATH')
gcOldClassLib = SET('CLASSLIB')
gTTrade = .T.

IF cod_seq.binaryFont <> EncripSerial(sys(0) + ALLT(cod_seq.serie))
   =MESSAGEBOX("Debe adquirir una licencia para poder operar la aplicacion en esta computadora", ;
    MB_ICONEXCLAMATION, ;
    'ERROR de Licencia')
ELSE 
   IF EMPTY(cod_seq.Fecha1erRun) AND MESSAGEBOX("Antes de correr la aplicacion, verifique que la fecha y hora de su computador esten correctas, esto es "+;
            "para su buen funcionamiento."+CHR(13)+"Para soporte y ayuda, pongase en contacto con su proveedor de Software."+CHR(13)+;
            "¿Desea continuar con la corrida?", ;
            MB_ICONQUESTION + MB_YESNO, ;
            'Advertencia') = IDNO
   ELSE       
      *-- Set up the path so we can instantiate the application object
      ruta = SetPath()
      IF VerVigencia()
      *   lnDias = DATE() - cod_seq.Fecha1erRun
      *   REPLACE cod_seq.RCount WITH lnDias
   *      IF cod_seq.RCount = 0
   *         REPLACE cod_seq.Fecha1erRun WITH DATE()
   *      ENDIF 
         IF ruta
            PUBLIC oApp
            oApp = CREATEOBJECT("TasTrade")
            IF TYPE('oApp') = "O"
               *-- Release all public vars, since their values were
               *-- picked up by the Environment class
               RELEASE gcOldDir, gcOldPath, gcOldClassLib, gcOldTalk, gcOldEscape
               Setting_area()
               oApp.Do()
           ENDIF
         ENDIF
      ENDIF 
      CLEAR DLLS
      RELEASE ALL EXTENDED
      CLEAR ALL
   ENDIF 
ENDIF 

FUNCTION SetPath()
  LOCAL lcSys16, ;
        lcProgram

  lcSys16 = SYS(16)
  lcProgram = SUBSTR(lcSys16, AT(":", lcSys16) - 1)

  CD LEFT(lcProgram, RAT("\", lcProgram))
  *-- If we are running MAIN.PRG directly, then
  *-- CD up to the parent directory
  IF RIGHT(lcProgram, 3) = "FXP"
    CD ..
  ENDIF
  SET PATH TO PROGS, FORMS, LIBS, ;
        MENUS, DATA, OTHER, ;
        REPORTS, INCLUDE, HELP, ;
        BITMAPS
  SET CLASSLIB TO MAIN, TSGEN
ENDFUNC

FUNCTION Setting_area()
    IF !USED("cod_seq")
	    USE cod_seq IN 0
    ENDIF
*-- SET Area
    formatdate = IIF(cod_seq.tipo_fecha='E','DMY','MDY')
    pointsepar = IIF(VAL(cod_seq.separador)=1,'.',',')
    comasepar = IIF(VAL(cod_seq.separador)=1,',','.') 
    redondeo = cod_seq.redon

    SET DECIMALS TO redondeo
    SET POINT TO pointsepar
    SET separator to comasepar
    SET DATE &formatdate 
    SET ESCAPE OFF  
*    SET FIXED ON
    USE IN cod_seq
 ENDFUNC


FUNCTION EncripSerial()
LPARAMETERS cPassw
LOCAL nSumaPos,;
      Passwd,;
      CHA,;
      cSTring 
Passwd = ''
cString = ''      
nSumaPos = 0
CHA = ''

FOR i=32 TO 126
    cString = cString + CHR(i)
NEXT 
FOR i=1 TO LEN(cPassw)
    CHA = SUBST(cPassw,i,1) 
*    nSumaPos = nSumaPos + AT(CHA,cString)  
    nSumaPos = AT(CHA,cString) 
    Passwd = Passwd + TRANSFORM(IIF((nSumaPos / 2) - INT(nSumaPos / 2)>0,1,0))
NEXT 

RETURN Passwd
ENDFUNC 

FUNCTION VerVigencia()
    IF !USED("cod_seq")
	    USE cod_seq IN 0
    ENDIF
    IF cod_seq.RCount = 0 AND DATE() - cod_seq.Fecha1erRun=0
       REPLACE cod_seq.Fecha1erRun WITH DATE()
    ENDIF 
    lnDias = DATE() - cod_seq.Fecha1erRun
*    REPLACE cod_seq.RCount WITH lnDias
*    IF lnDias > 0 AND lnDias =< cod_seq.VigenciaSof
*       REPLACE cod_seq.RCount WITH lnDias
*    ENDIF    
*    IF BETWEEN(lnDias,0,cod_seq.VigenciaSof) AND lnDias > cod_seq.RCount 
*       REPLACE cod_seq.RCount WITH lnDias
*    ENDIF    
***************
*    IF lnDias > cod_seq.RCount AND lnDias > 0 AND lnDias=<cod_seq.VigenciaSof
*       REPLACE cod_seq.RCount WITH lnDias
*    ENDIF    
*************    
    gg=0
    IF lnDias = IIF(lnDias=0,0,cod_seq.RCount + 1) AND lnDias >= cod_seq.RCount &&lnDias = cod_seq.RCount + 1 && AND lnDias > 0 AND lnDias=<cod_seq.VigenciaSof
       REPLACE cod_seq.RCount WITH IIF(lnDias=0,0,cod_seq.RCount + 1)
    ENDIF    
    IF BETWEEN(lnDias-cod_seq.RCount,0,1) AND lnDias >= cod_seq.RCount
       gg = 1
    ENDIF 

*    IF BETWEEN(lnDias - cod_seq.RCount,0,1) AND lnDias=<cod_seq.VigenciaSof
*       REPLACE cod_seq.RCount WITH lnDias
*    ENDIF    
*    IF lnDias > cod_seq.RCount AND lnDias =< cod_seq.VigenciaSof AND IIF(cod_seq.RCount=0 AND lnDias=0,0,lnDias - cod_seq.RCount)=0 &&lnDias - cod_seq.RCount = 1 
*       REPLACE cod_seq.RCount WITH lnDias
*    ENDIF    

*    IF cod_seq.RCount = 0
*       REPLACE Fecha1erRun WITH DATE() IN cod_seq
*    ENDIF 
*    lnDias = DATE() - cod_seq.Fecha1erRun
*    USE IN cod_seq
    DO CASE 
       CASE  cod_seq.RCount = cod_seq.VigenciaSof
            =MESSAGEBOX("La Licencia para el uso de MOFAC es por "+TRANS(cod_seq.VigenciaSof)+" dias ya ha caducado, por favor renovela"+CHR(13)+;
              "Pongase en contacto con su proveedor de Software.", ;
               MB_ICONEXCLAMATION, ;
               'Vencimiento de Licencia')
            RETURN .F. 

       CASE gg=0 &&lnDias <> IIF(lnDias=0,0,cod_seq.RCount + 1) &&lnDias < cod_seq.RCount OR lnDias < 0
*       CASE IIF(cod_seq.RCount=0 AND lnDias=0,0,lnDias - cod_seq.RCount)<>0 &&lnDias - cod_seq.RCount <> 1 
*       CASE lnDias <> cod_seq.RCount &&lnDias - cod_seq.RCount <> 1 
            =MESSAGEBOX("Verifique la fecha de su computadora " + ALLT(DTOC(DATE())) + ". Es importante que la fecha del sistema "+;
              "este actualizada para evitar posibles errores en la operacion del software.", ;
               MB_ICONEXCLAMATION, ;
               'ERROR de fecha')
            RETURN .F.

*       CASE BETWEEN(lnDias,1,cod_seq.VigenciaSof)
       CASE BETWEEN(cod_seq.VigenciaSof-cod_seq.RCount,0,5) &&cod_seq.RCount > 24 &&cod_seq.VigenciaSof - cod_seq.RCount < 6
*            IF lnDias > 24
               =MESSAGEBOX("La Licencia para el uso de MOFAC es por "+TRANS(cod_seq.VigenciaSof)+" dias, solo restan "+;
               TRANS(cod_seq.VigenciaSof-cod_seq.RCount)+" dia(s) de vigencia renove su licencia para evitar que MOFAC cese su operacion"+CHR(13)+;
                "Pongase en contacto con su proveedor de Software.", ;
                MB_ICONEXCLAMATION, ;
               'Advertencia')
*             ENDIF 
             RETURN .T. 
      
      OTHERWISE 
             RETURN .T. 
                    
    ENDCASE  
ENDFUNC 
**********
**********
**********************************************************************************
*
*  Receive the Prompt() that pass from the On Selection Bar, then pass it to DoPrg
*
**********************************************************************************
FUNCTION RunProgram
   LPARAMETER cPrompt
   
   
   FOR i = 1 to menuobject.oMenu.ControlCount
        =DoPrg(cPrompt, menuobject.oMenu.Controls[i])
        IF VARTYPE(menuobject.oMenu) <> "O"
           EXIT
        ENDIF   
   ENDFOR     
ENDFUNC


*********************************************************************************
*
*  Run the appropriate program that store in cProgramName property of bar object
*
**********************************************************************************
FUNCTION DoPrg
   LPARAMETER  cPrompt, oCurrentControl, iCount
 
       FOR iCount = 1 to oCurrentControl.ControlCount
           IF oCurrentControl.controls[iCount].ControlCount > 0
              oCurrentControl = oCurrentControl.controls[iCount]
              DoPrg(cPrompt, oCurrentControl, iCount)
              IF VARTYPE(oCurrentControl) = "O"
                 oCurrentControl = oCurrentControl.Parent
              ELSE
                 EXIT   
              ENDIF   
           ELSE
              IF oCurrentControl.controls[iCount].cBarPrompt == cPrompt
                  DO CASE 
                    CASE oCurrentControl.controls[iCount].cExpr = "P"
                           cPrg = (oCurrentControl.controls[iCount].cProgramName)    
                           DO &cPrg
                    CASE oCurrentControl.controls[iCount].cExpr = "E"
                           cPrg = oCurrentControl.controls[iCount].cProgramName
                           &cPrg
                  ENDCASE       
                  EXIT
              ENDIF
           ENDIF
       ENDFOR   
ENDFUNC
**********
**********