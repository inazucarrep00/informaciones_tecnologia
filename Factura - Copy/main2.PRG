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

PUBLIC fDesde, fHasta, _nFac, indice,noParam,tipodoc,glSave,AddRecord, cad1, cad2, cGroup, UserAcces,;
       MontoUltimoPgo, FechaUltimoPgo, UserRepo, SelFechaControl, _User,sw_imprime, Activepapel,;
       vJugos, vSandw, vCombos, cMenuOrd, limpiaCboCus

limpiaCboCus = .F.
vCombos = 0
vJugos = 0
vSandw = 0
Activepapel = "S"
sw_imprime=.F.       
_User = ""       
AddRecord = .F.
UserRepo = .F.
UserAcces = .F.
cVendedor = ""
cMenuOrd = ""
cCliente = ""
producto=""
termino=""                            
_nFac = ""
cGroup = ""
_dato = null
datacombo = "" 
tipodoc = 'F'
indice = 1
inicial = 0 
lnDias = 0
cad1=0
cad2=0
gLastCod = ""
glSave = .F.
noParam = .T.
keyF10 = .F.
Fdesde = {}
Fdesde = {}
SelFechaControl = {}
nHeightWith = .F. 
nLeft = 0
nTop = 0
OPEN DATABASE SYS(2003)+"\DATA\tastrade" SHARED  
IF !USED("cod_seq")
   USE tastrade!cod_seq IN 0
*  setexcl = SET('EXCLUSIVE')
*  SET EXCLUSIVE OFF 
*  USE SYS(2003)+"\DATA\cod_seq" IN 0
*  SET EXCLUSIVE &setexcl
ENDIF

IF !USED("permisos")
   USE tastrade!permisos IN 0
ENDIF

PUBLIC ARRAY achkpagos[30,1], arrAlias(6), Arrtablas(75),ArrLineItems[40,5]
achkpagos = NULL
Arrtablas=""
arrAlias=""
ArrLineItems=""

*SELECT COUNT(group_id) AS counGroup_id FROM permisos WHERE ;
*group_id = (SELECT MIN(group_id) FROM permisos) INTO CURSOR qCounGroup
*totGroup = qCounGroup.counGroup_id
SELECT permisos
CALCULATE MIN(group_id) TO minGroup
GO TOP 
SCAN FOR group_id = minGroup
     Var = 'Var'+ALLT(opMenu) 
     PUBLIC &Var
     &Var = permisos.Acceso
ENDSCAN 

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

PUBLIC gcOldDir, gcOldPath, gcOldClassLib, gcOldEscape, gTTrade,redondeo
gcOldEscape   = SET('ESCAPE')
gcOldDir       = FULLPATH(CURDIR())
gcOldPath     = SET('PATH')
gcOldClassLib = SET('CLASSLIB')
gTTrade = .T.

*IF cod_seq.binaryFont <> EncripSerial(ALLT(sys(0)) + ALLT(cod_seq.serie)) &&OR EMPTY(cod_seq.serie)
*   =MESSAGEBOX("Debe adquirir una licencia para poder operar la aplicacion en esta computadora", ;
*    MB_ICONEXCLAMATION, ;
*    'ERROR de Licencia')
*ELSE 
   IF EMPTY(cod_seq.Fecha1erRun) AND MESSAGEBOX("Antes de correr la aplicacion, verifique que la fecha y hora de su computador esten correctas, esto es "+;
            "para su buen funcionamiento."+CHR(13)+"Para soporte y ayuda, pongase en contacto con su proveedor de Software."+CHR(13)+;
            "¿Desea continuar con la corrida?", ;
            MB_ICONQUESTION + MB_YESNO, ;
            'Advertencia') = IDNO
   ELSE       
      *-- Set up the path so we can instantiate the application object
      ruta = SetPath()
      IF VerVigencia()
         IF ruta
            PUBLIC oApp
            oApp = CREATEOBJECT("TasTrade")
            IF TYPE('oApp') = "O"
               *-- Release all public vars, since their values were
               *-- picked up by the Environment class
               RELEASE gcOldDir, gcOldPath, gcOldClassLib, gcOldTalk, gcOldEscape
               ON KEY LABEL F8 ACTIVATE WINDOW calculator
               Setting_area()
               oApp.Do()
            ENDIF
         ENDIF
      ENDIF 
*      CLEAR DLLS
*      RELEASE ALL EXTENDED
*      CLEAR ALL
   ENDIF 
*ENDIF 
CLEAR DLLS
RELEASE ALL EXTENDED
CLEAR ALL

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
       USE tastrade!cod_seq IN 0
*       setexcl = SET('EXCLUSIVE')
*       SET EXCLUSIVE OFF 
*       USE cod_seq IN 0
*       SET EXCLUSIVE &setexcl
    ENDIF
*-- SET Area
    formatdate = IIF(cod_seq.tipo_fecha='E','DMY','MDY')
    pointsepar = IIF(VAL(cod_seq.separador)=1,'.',',')
    comasepar = IIF(VAL(cod_seq.separador)=1,',','.') 
    redondeo = cod_seq.redon

    SET DECIMALS TO redondeo
    SET DELETED ON 
*    SET FIXED ON     && Fix decimal display
    SET POINT TO pointsepar
    SET separator to comasepar
    SET DATE &formatdate 
    USE IN cod_seq
*    USE IN permisos
 ENDFUNC

FUNCTION EncripSerial()
LPARAMETERS cPassw
LOCAL nSumaPos,;
      Passwd,;
      CHA,;
      cSTring,;
      laCum 
Passwd = ''
cString = ''      
nSumaPos = 0
CHA = ''
laCum = ''

FOR i=32 TO 126
    cString = cString + CHR(i)
NEXT 
FOR i=1 TO LEN(cPassw)
    CHA = SUBST(cPassw,i,1) 
    laCum = laCum + CHR(AT(CHA,cString))
NEXT 

RETURN laCum

ENDFUNC 

FUNCTION VerVigencia()
    IF !USED("cod_seq")
       USE tastrade!cod_seq IN 0
*       setexcl = SET('EXCLUSIVE')
*       SET EXCLUSIVE OFF 
*       USE cod_seq IN 0
*       SET EXCLUSIVE &setexcl       
    ENDIF
    IF cod_seq.RCount = 0 AND DATE() - cod_seq.Fecha1erRun=0
       REPLACE cod_seq.Fecha1erRun WITH DATE()
    ENDIF 
    IF VAL(SUBSTR(cod_seq.serie,14,2))=0
       RETURN .T. 
    ENDIF  

    lnDias = DATE() - cod_seq.Fecha1erRun
    gg=0
    IF lnDias = IIF(lnDias=0,0,cod_seq.RCount + 1) AND lnDias >= cod_seq.RCount
       REPLACE cod_seq.RCount WITH IIF(lnDias=0,0,cod_seq.RCount + 1)
    ENDIF    
    IF BETWEEN(lnDias-cod_seq.RCount,0,1) AND lnDias >= cod_seq.RCount
       gg = 1
    ENDIF 
    DO CASE 
       CASE  cod_seq.RCount = cod_seq.VigenciaSof
            =MESSAGEBOX("La Licencia para el uso de MOFAC es por "+TRANS(cod_seq.VigenciaSof)+" dias ya ha caducado, por favor renovela"+CHR(13)+;
              "Pongase en contacto con su proveedor de Software.", ;
               MB_ICONEXCLAMATION, ;
               'Vencimiento de Licencia')
            RETURN .F. 

       CASE gg=0 
            =MESSAGEBOX("Verifique la fecha de su computadora " + ALLT(DTOC(DATE())) + ". Es importante que la fecha del sistema "+;
              "este actualizada para evitar posibles errores en la operacion del software.", ;
               MB_ICONEXCLAMATION, ;
               'ERROR de fecha')
            RETURN .F.

       CASE BETWEEN(cod_seq.VigenciaSof-cod_seq.RCount,0,5) &&cod_seq.RCount > 24 &&cod_seq.VigenciaSof - cod_seq.RCount < 6
               =MESSAGEBOX("La Licencia para el uso de MOFAC es por "+TRANS(cod_seq.VigenciaSof)+" dias, solo restan "+;
               TRANS(cod_seq.VigenciaSof-cod_seq.RCount)+" dia(s) de vigencia renove su licencia para evitar que MOFAC cese su operacion"+CHR(13)+;
                "Pongase en contacto con su proveedor de Software.", ;
                MB_ICONEXCLAMATION, ;
               'Advertencia')
             RETURN .T. 
      
      OTHERWISE 
             RETURN .T. 
                    
    ENDCASE  
ENDFUNC 
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
